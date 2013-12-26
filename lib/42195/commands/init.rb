require 'fileutils'

module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  module Commands
    class Init

      def initialize(opts={})
        @dir = opts[:dir]
        @skip_example = opts[:skip_example]
      end

      def run(opts={})
        ensure_dir
        ensure_id_file
        ensure_git_repo
      end

      private

      def ensure_dir
        FileUtils.mkdir_p(@dir) unless Dir.exist?(@dir)
      end

      def ensure_id_file
        FileUtils.touch("#{@dir}/.42195") unless File.exist?("#{@dir}/.42195")
      end

      def ensure_git_repo
        Dir.chdir(@dir) do
          result = `git status 2>&1`
          return unless result =~ /fatal: Not a git repository/
          `git init`
          `git add .`
          `git commit -m '[bot] initial commit'`
          puts "initialized a fresh git repo in #{@dir}".colorize(:green)
          init_example_realm unless @skip_example
        end
      end

      def init_example_realm        
        src  = "#{MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV.templates_path}/config.json"
        dest = "#{@dir}/config.json"
        FileUtils.cp(src, dest)
        Dir.chdir(@dir) do
          `git add config.json`
          `git commit -m '[bot] added sample config'`
        end
      end

    end
  end
end