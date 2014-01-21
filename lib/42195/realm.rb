module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  class Realm

    attr_accessor :name, :enabled, :users, :config

    def initialize(name, data, config=nil)
      @name    = name
      @data    = data      
      @enabled = @data['enabled'] || false
      @users   = @data['users'] || {}
      @config  = config
    end

    def environments
      @environments ||= @data['environments'].collect { |name, data| Environment.new(name, data, self, config) } # rescue {}
    end

    def environment(environment_name)
      environments.find { |e| e.name == environment_name } rescue nil
    end

  end
end
