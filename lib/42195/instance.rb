module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  class Instance

    attr_reader :group, :index, :data, :memory, :cpu, :ip

    def initialize(group, index, data)
      @group = group
      @index = index
      @data  = data

      @memory = group.memory
      @cpu    = group.cpu
      @ip     = group.all_ips[index]
    end

    def name
      "#{group.name}-#{index}"
    end

  end
end