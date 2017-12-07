#!/usr/bin/ruby -w
# -*- ruby -*-

dir = File.dirname(File.dirname(File.expand_path(__FILE__)))
libpath = dir + "/lib"
$:.unshift libpath

require 'pathname'

class TestCreator
  def initialize args
    $stderr.puts "args: #{args}"
    args.each do |arg|
      spn = Pathname.new(arg).expand_path
      $stderr.puts "spn: #{spn}"
      tpn = get_test_file spn
      $stderr.puts "tpn: #{tpn}"

      relpath = get_relative_path spn
      puts "relpath: #{relpath}"

      re = Regexp.new '^\s*class\s+([\w:]*?)(\w+)[\n ]'

      mod = nil
      cls = nil

      IO.readlines(spn.to_s).each do |line|
        if md = re.match(line)
          mod, cls = md[1, 2]
        end
      end

      puts "mod: #{mod}"
      puts "cls: #{cls}"

      if tpn.exist?
        puts "already exists: #{tpn}"
      else
        lines = Array.new.tap do |a|
          a << "#!/usr/bin/ruby -w"
          a << "# -*- ruby -*-"
          a << ""
          a << "require '#{relpath}'"
          a << "require 'test/unit'"
          a << ""
          a << "class #{mod}#{cls}Test < Test::Unit::TestCase"
          a << "  def test_init"
          a << "    x = #{cls}.new"
          a << "    assert_equal expected, result"
          a << "  "
          a << "  end"
          a << "end"
        end
        
        puts lines
      end
    end
  end

  def get_module_class srcpn
    IO.readlines(spn.to_s).each do |line|
      if md = re.match(line)
        return md[1, 2]
      end
    end
    nil
  end
  
  def get_relative_path srcpn
    relpath = srcpn.to_s
    relpath.sub! Pathname.pwd.to_s + "/lib/", ""
    relpath.sub! ".rb", ""
    relpath
  end

  def get_test_file srcpn
    srcpn.parent + (rootname(srcpn).to_s + "_test.rb")
  end
  
  def rootname pn
    pn.basename.to_s.sub pn.extname.to_s, ''
  end
end

TestCreator.new ARGV
