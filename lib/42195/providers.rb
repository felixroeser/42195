require_relative 'providers/base'
require_relative 'providers/virtual_box'

module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  module Providers

    def self.all
      [VirtualBox]
    end

    def self.find_by_name(name)
      self.all.find { |p| p.name == name }
    end

  end
end