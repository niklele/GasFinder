require 'dotenv'
Dotenv.load("../.env")
require "test/unit"

require_relative "../dropbox.rb"

class TestDropbox < Test::Unit::TestCase

  def setup
    # nothing
  end

  def teardown
    # nothing
  end

  def test_prices_list
    puts "#{Dropbox.prices_list.count} prices saved in dropbox"
  end

end