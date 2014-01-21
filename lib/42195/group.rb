require 'ipaddress'

module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  class Group

    attr_reader :name, :covers, :instance_type, :instances, :memory, :cpu, :ipmask, :environment

    def initialize(name, data, config, environment = nil)
      @name = name
      @data = data

      @environment   = environment
      @covers        = data['covers'] || []
      @ipmask        = IPAddress data['ipmask']
      @nr_instances  = data['instances'] || 1
      @instance_type = config.instance_type(data['instance_type']) rescue nil
      @instances     = @nr_instances.times.collect { |i| Instance.new(self, i, {}) }
    end

    # TODO implement and bail if not valid
    def valid?
      true
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
