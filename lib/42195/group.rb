require 'ipaddress'

module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  class Group

    attr_reader :name, :covers, :instances, :memory, :cpu, :ipmask

    def initialize(name, data)
      @name = name
      @data = data

      @covers       = data['covers'] || []
      @memory       = data['memory'] || 1024
      @cpu          = data['cpu'] || 1
      @ipmask       = IPAddress data['ipmask']
      @nr_instances = data['instances'] || 1
      @instances    = @nr_instances.times.collect { |i| Instance.new(self, i, {}) }      
    end

    def all_ips
      @all_ips ||= ipmask.enum_for(:each_host).map { |host| host.to_s }[10...10+@nr_instances]
    end

    def roles
      Group.roles.slice(*@covers)
    end

    def self.roles
      {
        "it0"  => %w(dockers zookeepers),
        "it1"  => %w(vorarbeiter),
        "app0" => %w(maloche)
      }
    end

  end
end
