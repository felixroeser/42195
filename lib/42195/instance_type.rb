module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  class InstanceType

    attr_reader :name

    def initialize(name, data={})
      @name = name
      @data = data
    end

    def data_for(provider)
      @data[provider] || {}
    end

  end
end