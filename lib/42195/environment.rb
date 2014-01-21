module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  class Environment

    attr_accessor :name, :provider, :groups, :users, :enabled, :shared, :realm

    def initialize(name, data, realm, config=nil)
      @name     = name
      @data     = data
      @realm    = realm
      @enabled  = @data['enabled']
      @shared   = @data['shared'] && realm.enabled
      @provider = Providers.find_by_name(@data['provider']).new
      @groups   = @data['groups'].collect { |name, data| Group.new(name, data, config, self)}
      @users    = realm.users.merge(@data['users'] || {})
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
        },
        populate_sshkey: {
          erb: File.read("#{MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV.templates_path}/vagrant/populate_sshkey.sh.erb"),
          dest: "scripts/populate_sshkey.sh"          
        }
      }.merge(provider.templates)
    end

  end
end