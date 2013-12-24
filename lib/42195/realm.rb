module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  class Realm

    attr_accessor :name

    def initialize(name, data)
      @name = name
      @data = data

      @environments = @data['environments'].collect { |name, data| Environment.new(name, data, self) } rescue {}
    end

    def environments(environment_name)
      @environments.find { |e| e.name == environment_name } rescue nil
    end

  end
end
