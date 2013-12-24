module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  module Commands
    class Update

      def self.run(opts={})
        path        = "#{MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV.root}/config.json"
        # path      = File.expand_path("./../../config.json", __FILE__)
        config      = MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV::Config.new(path)
        realm       = config.realms(opts[:realm])
        environment = realm.environments(opts[:environment])

        unless realm && environment
          puts "Invalid realm #{cmd_opts[:realm]} and/or environment #{cmd_opts[:environment]} provided!".colorize(:red)
          exit 1
        end

        ap [
          realm,
          environment
        ]

        puts environment.provider.templates

        ap environment.provider.render      
      end

    end
  end
end