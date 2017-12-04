#!/usr/bin/ruby -w
# -*- ruby -*-

dir = File.dirname(File.dirname(File.expand_path(__FILE__)))
libpath = dir + "/lib"
$:.unshift libpath

require 'pathname'

class Columns
  def initialize args
  end
end

Columns.new ARGV

width = (ARGV.shift || 8).to_i

rg = (0 .. width)
rg.each do |x|
  printf "%-10d", x
end

puts

rg.each do
  (0 .. 9).each do |n|
    print n
  end
end

puts
