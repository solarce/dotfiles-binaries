#!/usr/bin/env ruby

def make_package(package_name)
  pkgsrc_root = "#{ENV['HOME']}/pkgsrc"
  #pkgsrc_pkgs = "#{pkgsrc_root}/packages/All"
  #source_url = package_info["source"]
  pkgsrc_name = package_name
  #version = package_info["version"]
  #source_file_name = source_url.split("/")[-1]

  #p Dir["#{pkgsrc_root}/*"]
  if pkgsrc_name == nil
    puts "No packages found"
    exit 1
  else
    puts "building package for #{pkgsrc_name}"
  end
  #bmake_cmd = "cd #{pkgsrc_root}/#{pkgsrc_name} && /home/ubuntu/pkg/bin/bmake package 2>&1 | grep '=>'"
  #bmake_cmd = "bmake #{pkgsrc_root}/#{pkgsrc_name} package".to_s
  pkg_location = "#{pkgsrc_root}/#{pkgsrc_name}"
  puts pkg_location
  pkg_version = `grep DISTNAME #{pkg_location}/Makefile | awk '{print $2;}'`
  puts pkg_version
  bmake = "/home/ubuntu/pkg/bin/bmake"
  puts bmake
  bmake_cmd = "cd #{pkg_location} && #{bmake} package"
  puts bmake_cmd
  #IO.popen("cd #{pkgsrc_root}/#{pkgsrc_name} && /home/ubuntu/pkg/bin/bmake package") do |io|
  IO.popen(bmake_cmd) do |io|
    while (line = io.gets) do
      p line
    end
  end
  #output = ""
  #make_pkg_cmd = Mixlib::ShellOut.new("bmake package", :cwd => "#{pkgsrc_root}/#{pkgsrc_name}", :live_stdout => output, :live_stderr => output)
  #make_pkg_cmd.run_command
  #puts "output"
  #puts output
  #while make_pkg_cmd.exitstatus != 0
  #  puts "building ..."
  #  puts live_output
  #  sleep 30
  #end
  #p make_pkg_cmd
  #p make_pkg_cmd.stdout
end

packages_config = File.foreach('/home/ubuntu/code/scripts/packages.txt')
packages_config.each do | package_name |
  package_name = package_name.strip
  make_package(package_name)

end
