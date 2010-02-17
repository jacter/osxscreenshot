require "test/unit"
require "osxscreenshot"

class TestOsxscreenshot < Test::Unit::TestCase
  
  def test_loads_url
    @tmpfile = OSX::Screenshot.capture("http://example.com")
    assert_not_nil @tmpfile
    assert File.exist?(@tmpfile)
  end

  def test_loads_tall_url
    @tmpfile = OSX::Screenshot.capture("http://blog.peepcode.com/archives")

    extra_file_name = @tmpfile.gsub(/-0\.png$/, "-1.png")
    assert !File.exist?(extra_file_name)
  end
  
  def test_uses_custom_tmpdir
    @tmpfile = OSX::Screenshot.capture("http://example.com", :tmpdir => "./tmp")
    assert_match /^\.\/tmp/, @tmpfile
    assert File.exist?(@tmpfile)
  end
  
  def teardown
    FileUtils.rm @tmpfile
  end

end
