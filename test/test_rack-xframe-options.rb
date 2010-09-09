require 'helper'

class SampleApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, "Sample Response"]
  end
end

class TestRackXframeOptions < Test::Unit::TestCase
  include Rack::Test::Methods

  context "X-Frame-Options" do
    context "DENY" do
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

    context "SAMEORIGIN" do
      setup do
        def app
          Rack::Builder.new do
            use Rack::XFrameOptions, "SAMEORIGIN"
            run SampleApp.new
          end
        end
      end

      should "be added to response headers" do
        get '/'
        assert_equal "SAMEORIGIN", last_response.headers['X-Frame-Options']
      end
    end
  end
end
