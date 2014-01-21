module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  class Config

    attr_accessor :realms

    def initialize(input)
      @data = if input.is_a?(Hash)
        input
      else
        JSON.parse(File.read(input))
      end
    end

    def realms
      @realms ||= @data['realms'].collect { |name, data| Realm.new(name, data, self) } rescue {}
    end

    def realm(realm_name)
      realms.find { |r| r.name == realm_name } rescue nil
    end

    def instance_types
      @instance_types ||= @data['instance_types'].collect { |name, data| InstanceType.new(name, data) } rescue {}
    end

    def instance_type(name)
      instance_types.find { |it| it.name == name }
    end

  end
end