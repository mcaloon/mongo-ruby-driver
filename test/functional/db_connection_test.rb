require 'test_helper'

class DBConnectionTest < Test::Unit::TestCase

  include Mongo

  def test_no_exceptions
    host = ENV['MONGO_RUBY_DRIVER_HOST'] || 'localhost'
    port = ENV['MONGO_RUBY_DRIVER_PORT'] || Client::DEFAULT_PORT
    db = Client.new(host, port).db(MONGO_TEST_DB)
    coll = db.collection('test')
    coll.remove
    db.get_last_error
  end
end
