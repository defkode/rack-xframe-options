require 'rubygems'
require "rack/test"
require 'shoulda'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rack/xframe-options'

class SampleApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, "Sample Response"]
  end
end
