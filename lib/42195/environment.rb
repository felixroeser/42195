module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  class Environment

    attr_accessor :name, :provider, :groups

    def initialize(name, data, realm)
      @name     = name
      @data     = data
      @realm    = realm
      @provider = Providers.find_by_name(@data['provider']).new
      @groups   = @data['groups'].collect { |name, data| Group.new(name, data)}

      ap [
        @groups
      ]
    end

    def render
      templates.reduce({}) do |memo, (type, template)|

        memo[type] = {
          rendered: ERB.new(template[:erb], nil, '-').result(binding),
          dest: template[:dest]
        }

        memo
      end
    end

    def templates
      {
        inventory: {
          erb: File.read("#{MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV.templates_path}/ansible/inventory.erb"),
          dest: "inventory"
        }
      }.merge(provider.templates)
    end

  end
end