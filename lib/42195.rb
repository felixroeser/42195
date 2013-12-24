__LIB_DIR__ = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift __LIB_DIR__ unless $LOAD_PATH.include?(__LIB_DIR__)

require 'json'
require 'erb'

require '42195/version'
require '42195/config'
require '42195/realm'
require '42195/group'
require '42195/environment'
require '42195/provider'
require '42195/commands/init'

module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV

  def self.root=(path)
    @root = path
  end

  def self.root
    @root
  end

end