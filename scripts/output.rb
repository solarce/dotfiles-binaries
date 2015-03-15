#!/usr/bin/env ruby
require 'rubygems'
require "mixlib/shellout"

output = ""
errorput = ""
find = Mixlib::ShellOut.new("find . -name '*.rb' && sleep 200 && echo your_mom", :env => nil, :cwd => "/", :live_stdout => output, :live_stderr => output)
find.run_command
sleep 10
puts "output: #{output}"
puts "errorput: #{errorput}"
sleep 30
puts "find: #{find.stdout}"
