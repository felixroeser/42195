module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  module Providers
    class VirtualBox < Base

      def self.name
        'virtualbox'
      end

      def name_for_vagrant
        'virtualbox'
      end

      def customize_for_instance(instance)
        "['modifyvm', :id, '--memory', #{instance.memory}, '--cpus', #{instance.cpu} ]"
      end

    end
  end
end