module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  module Providers
    class VirtualBox < Base

      def self.name
        'virtualbox'
      end

      def name_for_vagrant
        'virtualbox'
      end

      def customize_for_instance_type(instance_type)
        "['modifyvm', :id, '--memory', #{instance_type.data_for('virtualbox')['memory'] || 1024}, '--cpus', #{instance_type.data_for('virtualbox')['cpu'] || 2} ]"
      end

    end
  end
end