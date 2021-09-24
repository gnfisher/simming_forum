class SignInHelper
  def initialize(app)
    @app = app
  end

  def call(env)
    params = Rack::Utils.parse_query(env["QUERY_STRING"])
    user_param = params.delete("as")
    env["QUERY_STRING"] = Rack::Utils.build_query(params)

    if user_param.present?
      env["rack.session"]["user_id"] = user_param.to_i
    end

    @app.call(env)
  end
end
