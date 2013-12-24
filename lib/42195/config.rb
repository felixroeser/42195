module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  class Config

    attr_accessor :realms

    def initialize(input)
      @data = if input.is_a?(Hash)
        input
      else
        JSON.parse(File.read(input))
      end

      @realms = @data['realms'].collect { |name, data| Realm.new(name, data) } rescue {}
    end

    def realms(realm_name)
      @realms.find { |r| r.name == realm_name } rescue nil
    end

  end
end