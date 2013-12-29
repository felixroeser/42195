module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  class Realm

    attr_accessor :name, :enabled, :users

    def initialize(name, data)
      @name    = name
      @data    = data      
      @enabled = @data['enabled']
      @users   = @data['users']
    end

    def environments
      @environments ||= @data['environments'].collect { |name, data| Environment.new(name, data, self) } # rescue {}
    end

    def environment(environment_name)
      environments.find { |e| e.name == environment_name } rescue nil
    end

  end
end
