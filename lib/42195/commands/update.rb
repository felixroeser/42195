require 'pathname'

module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  module Commands
    class Update

      def initialize(opts={})

        realm_arg, environment_arg = if state_dir? && opts[:realm].blank? && opts[:environment].blank?
          [File.expand_path( './../').split('/').last, File.expand_path( './').split('/').last]
        else
          [opts[:realm], opts[:environment]]
        end

        @realm       = config.realm(realm_arg) rescue nil
        @environment = @realm.environment(environment_arg) rescue nil
        @apply       = opts[:apply] || false

        ap @environment.groups
      end

      def run
        unless is_42195_project?
          puts "Not a 42195 dir".colorize(:red)
          return false
        end

        unless valid?
          puts "Realm or environment not valid!".colorize(:red)
          return false 
        end

        unless enabled?
          puts "Realm or environment not enabled!".colorize(:red)
          return false
        end

        puts "Called update with #{@realm.name}-#{@environment.name}".colorize(:blue)

        ensure_dir
        ensure_dir_in_gitignore
        Dir.chdir(working_dir) do
          copy_playbooks
          render_and_write_templates
        end

        ignore_state_dir_if_configured
        commit_changes

        puts "Written current configuration".colorize(:green)

        if @apply
          Dir.chdir(working_dir) do
            puts "Applying configuration....".colorize(:yellow)
            # Ensure all machines are up and running
            puts `vagrant up --provider #{@environment.provider.name_for_vagrant}`
          end

          # Provision the boxes
          Dir.chdir(provisioning_dir) do
            # Using ssh-agent is prefered
            pk_param = "--private-key=#{@environment.users['root']['private_key_path']}" rescue nil

            # puts `ansible-playbook playbook.yml -i ../inventory #{pk_param if pk_param} #{'-vvvv' if verbose?} -u root -s -l it`
          end

        end

      end

      private

      def provisioning_dir
        "#{working_dir}/provisioning"
      end

      def working_dir
        "#{MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV.root}/#{relative_working_dir}"
      end

      def relative_working_dir
        "state/#{@realm.name}/#{@environment.name}"
      end

      def ensure_dir
        FileUtils.mkdir_p(working_dir) unless Dir.exist?(working_dir)
      end

      def ensure_dir_in_gitignore
        path = "#{relative_working_dir}/provisioning"
        file = "#{MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV.root}/.gitignore"
        FileUtils.touch(file) unless File.exist?(file)
        `echo #{path} > #{file}` unless File.read(file).index(path)
      end

      def render_and_write_templates
        @environment.render.each do |(name, h)|
          pathname = Pathname.new h[:dest]

          dir = pathname.dirname.to_s
          FileUtils.mkdir_p(dir) if dir != "." && !Dir.exist?(dir)

          File.open(h[:dest], 'w+') { |f| f.write h[:rendered] }
        end
      end

      def copy_playbooks
        cmd = "rsync -av #{MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV.templates_path}/provisioning ."
        `#{cmd}`
      end

      def ignore_state_dir_if_configured
        return unless @environment.shared
        file = "#{MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV.root}/.gitignore"
        path = "#{relative_working_dir}/.vagrant"          
        `echo #{path} > #{file}` unless File.read(file).index(path)
      end

      def commit_changes
        status = `git status`
        if status.index('nothing added to commit but untracked files present')
          `git add . ; git commit -m '[bot] updated #{@realm.name}.#{@environment.name}'`
        end
      end

      def valid?
        @realm.present? && @environment.present?
      end

      def enabled?
        @realm.enabled && @environment.enabled
      end

      def config
        file = project_root? ? './config.json' : '../../../config.json'
        @config ||= Config.new(JSON.parse(File.read(file)))
      end

      def is_42195_project?
        project_root? || state_dir?
      end

      def project_root?
        File.exist?(".42195")
      end

      def state_dir?
        File.exist?("./../../../.42195")
      end

      def verbose?
        true
      end

    end
  end
end