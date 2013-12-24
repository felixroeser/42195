module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  class Provider

    attr_accessor :name, :environment

    def initialize(name, environment)
      @name        = name
      @environment = environment
    end

    def templates
      @templates ||= {
        vagrant: File.read( File.expand_path("./../../templates/vagrant/Vagrantfile.#{@name}.erb", __FILE__) )
      }
    end

    def render
      templates.reduce({}) do |memo, (type, template)|

        memo[type] = ERB.new(template).result(binding)

        memo
      end
    end

    def self.available
      %w(virtualbox)
    end

    def self.valid?(name)
      self.available.include?(name)
    end



  end
end