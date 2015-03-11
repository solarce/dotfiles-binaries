#!/usr/bin/env ruby

require 'rubygems'
require "mixlib/shellout"
require 'toml'

def make_package(package_name, package_info)
  source_url = package_info["source"]
  source_file_name = source_url.split("/")[-1]

  get_source_cmd = Mixlib::ShellOut.new("curl -s #{source_url} -o /tmp/#{source_file_name} ")
  puts "Downloading #{source_url} to /tmp/#{source_file_name}"
  get_source_cmd.run_command
  if get_source_cmd.exitstatus == 1
    puts "Download of #{source_url} failed"
    exit(1)
  elsif File.exist?("/tmp/#{source_file_name}") == true
    puts "Download of #{source_url} successful"
  end
end

packages_file = "packages/packages.toml"
packages_config = TOML.load_file(packages_file)

packages_config.each do | package_name,package_info |
  make_package(package_name, package_info)

end
