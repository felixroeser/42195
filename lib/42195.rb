__LIB_DIR__ = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift __LIB_DIR__ unless $LOAD_PATH.include?(__LIB_DIR__)

# require 'bundler'
# Bundler.setup

require 'json'
require 'erb'
require 'fileutils'
require 'pathname'
require 'active_support/core_ext/hash'
# require 'vagrant'

require '42195/version'
require '42195/config'
require '42195/realm'
require '42195/group'
require '42195/instance'
require '42195/environment'
require '42195/providers'
require '42195/commands/init'
require '42195/commands/list'
require '42195/commands/update'


module MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMCXCV

  def self.root=(path)
    @root = path
  end

  def self.root
    @root
  end

  def self.gem_root
    # Pathname.new(__FILE__).dirname
    File.expand_path('../../', __FILE__)
  end

  def self.templates_path
    "#{gem_root}/lib/templates"
  end

end