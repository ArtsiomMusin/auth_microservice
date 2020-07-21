class UserRoutes < Application
  post '/signup' do
    user_params = validate_with!(UserParamsContract, params: params)
    result = Users::CreateService.call(*user_params.to_h.values)

    if result.success?
      status 201
    else
      status 422
      error_response(result.user)
    end
  end

  post '/login' do
    session_params = validate_with!(SessionParamsContract, params: params)
    result = UserSessions::CreateService.call(*session_params.to_h.values)

    if result.success?
      token = JwtEncoder.encode(uuid: result.session.uuid)
      meta = { token: token }

      status 201
      json({ meta: meta })
    else
      status 401
      error_response(result.session || result.errors)
    end
  end
end
