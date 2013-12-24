module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  class Group

    attr_reader :name, :covers, :instances, :memory, :cpu, :mask

    def initialize(name, data)
      @name = name
      @data = data

      @covers    = data['covers'] || []
      @instances = data['instances'] || 1
      @memory    = data['memory'] || 1024
      @cpu       = data['cpu'] || 1
      @mask      = data['mask']
    end

  end
end

# "name": "it",
# "covers": ["it0", "it1", "it2"],
# "instances": 1,
# "memory": 1576,
# "cpu": 1,
# "mask": "10.1.10.X"
