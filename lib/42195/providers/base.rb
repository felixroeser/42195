module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV
  module Providers
    class Base

      def name
        self.class.name
      end

      def templates
        @templates ||= {
          vagrant: {
            erb: File.read("#{MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV.templates_path}/vagrant/Vagrantfile.#{name}.erb"),
            dest: 'Vagrantfile'
          }
        }
      end

    end
  end
end