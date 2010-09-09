module Rack
  class XFrameOptions

    def initialize(app, value = "SAMEORIGIN")
      @app = app
      @value = value.upcase
    end

    def call(env)
      status, headers, body = @app.call(env)
      if headers['Content-Type'] =~ /html/
        headers['X-Frame-Options'] = ["DENY", "SAMEORIGIN"].include?(@value) ? @value : "DENY"
        [status, headers, body]
      else
        @app.call(env)
      end
    end
  end
end