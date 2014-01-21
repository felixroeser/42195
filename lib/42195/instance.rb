module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  class Instance

    attr_reader :group, :index, :data, :memory, :cpu, :ip, :instance_type

    def initialize(group, index, data)
      @group = group
      @index = index
      @data  = data

      @memory = group.memory
      @cpu    = group.cpu
      @ip     = group.all_ips[index]
      @instance_type = group.instance_type
    end

    def name
      "#{group.name}-#{index}"
    end

    def hostname
      "#{name}.#{group.environment.name}.#{group.environment.realm.name}"
    end

  end
end