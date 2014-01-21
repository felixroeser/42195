module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  module Commands
    class List

      def initialize(opts={})
      end

      def run(opts={})
        unless is_42195_dir?
          puts "Not a 42195 dir".colorize(:red)
          return false
        end

        config.realms.each do |realm|
          puts "Realm: #{realm.name}".colorize(:green)
          realm.environments.each do |environment|
            puts "  Environment: #{environment.name}"
            if environment.provider
              puts "    Provider: #{environment.provider.name}"
              ap [
                environment.templates,
                # environment.render,
                environment.groups,
                # environment.groups.map(&:roles)
              ]
            end
          end
          puts
        end
      end

      private

      def config
        @config ||= Config.new(JSON.parse(File.read("config.json")))
      end

      def is_42195_dir?
        File.exist?(".42195")
      end

    end
  end
end