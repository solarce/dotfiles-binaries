#!/usr/bin/env ruby

require 'rubygems'
require "mixlib/shellout"
require 'toml'

def bmake(pkgsrc_root, pkgsrc_name)
  puts "building package for #{pkgsrc_name}"
  make_pkg_cmd = Mixlib::ShellOut.new("bmake", "package", "clean", "clean-depends", :cwd => "#{pkgsrc_root}/#{pkgsrc_name}")
  make_pkg_cmd.run_command

  return [ make_pkg_cmd, true ]
end

def make_package(package_name, package_info)
  pkgsrc_root = "#{ENV['HOME']}/pkgsrc"
  #pkgsrc_pkgs = "#{pkgsrc_root}/packages/All"
  #source_url = package_info["source"]
  pkgsrc_name = package_info["pkgsrc_name"]
  #version = package_info["version"]
  #source_file_name = source_url.split("/")[-1]

  #p Dir["#{pkgsrc_root}/*"]
  puts "building package for #{pkgsrc_name}"
  output = ""
  make_pkg_cmd = Mixlib::ShellOut.new("bmake package", :cwd => "#{pkgsrc_root}/#{pkgsrc_name}", :live_stdout => output, :live_stderr => output)
  make_pkg_cmd.run_command
  puts "output"
  puts output
  #while make_pkg_cmd.exitstatus != 0
  #  puts "building ..."
  #  puts live_output
  #  sleep 30
  #end
  p make_pkg_cmd
  p make_pkg_cmd.stdout
end

packages_file = "packages/packages.toml"
packages_config = TOML.load_file(packages_file)

packages_config.each do | package_name,package_info |
  make_package(package_name, package_info)

end
