require 'pathname'

module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  module Commands
    class Update

      def initialize(opts={})
        @realm = config.realm(opts[:realm]) rescue nil
        @environment = @realm.environment(opts[:environment]) rescue nil
      end

      def run
        unless is_42195_dir?
          puts "Not a 42195 dir".colorize(:red)
          return false
        end

        unless valid?
          puts "Realm or environment not valid!".colorize(:red)
          return false 
        end

        # ap [
        #   @realm,
        #   @environment
        # ]

        # A Vagrant environment is required to run this command. Run `vagrant init`

        ensure_dir
        ensure_dir_in_gitignore
        Dir.chdir(working_dir) do
          copy_playbooks
          render_and_write_templates

          status = `vagrant status`
          puts status

          puts `vagrant up`

          # opts = {}
          # env = ::Vagrant::Environment.new(opts)
          # ap env.active_machines
        end
        commit_changes
      end

      private

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

      def commit_changes
        status = `git status`
        if status.index('nothing added to commit but untracked files present')
          `git add . ; git commit -m '[bot] updated #{@realm.name}.#{@environment.name}'`
        end
      end

      def valid?
        @realm.present? && @environment.present?
      end

      def config
        @config ||= Config.new(JSON.parse(File.read("config.json")))
      end

      def is_42195_dir?
        File.exist?(".42195")
      end

    end
  end
end