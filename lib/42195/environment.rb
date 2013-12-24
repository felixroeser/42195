module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  class Environment

    attr_accessor :name, :provider, :groups

    def initialize(name, data, realm)
      @name  = name
      @data  = data
      @realm = realm

      @provider = Provider.valid?(@data['provider']) ? Provider.new(@data['provider'], self) : nil
      @groups   = @data['groups'].collect { |name, data| Group.new(name, data)}
    end

  end
end