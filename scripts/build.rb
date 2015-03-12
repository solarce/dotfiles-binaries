#!/usr/bin/env ruby

require 'rubygems'
require "mixlib/shellout"
require 'toml'

def make_package(package_name, package_info)
  pkgsrc_root = "#{ENV['HOME']}/pkg" 
  #source_url = package_info["source"]
  version = package_info["version"]
  #source_file_name = source_url.split("/")[-1]

  p Dir["#{pkgsrc_root}/*"]
end

packages_file = "packages/packages.toml"
packages_config = TOML.load_file(packages_file)

packages_config.each do | package_name,package_info |
  make_package(package_name, package_info)

end
