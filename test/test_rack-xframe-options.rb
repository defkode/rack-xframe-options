require 'helper'

class TestRackXframeOptions < Test::Unit::TestCase
  include Rack::Test::Methods

  context "X-Frame Options Header" do
    setup do
      def app
        Rack::Builder.new do
          use Rack::XFrameOptions
          run SampleApp.new
        end
      end
    end

    should "be added to response headers" do
      get '/'
      assert_equal "DENY", last_response.headers['X-Frame-Options']
    end

  end

end
