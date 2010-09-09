module Rack
  class XFrameOptions

    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call(env)
      if headers['Content-Type'] =~ /html/
        headers['X-Frame-Options'] = "DENY" # SAMEORIGIN
        [status, headers, body]
      else
        @app.call(env)
      end
    end

  end
end