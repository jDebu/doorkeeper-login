class SessionsController < ApiBaseController

  def create
    email = user_params[:email]
    password = user_params[:password]
    unless User.authenticate(email, password)
      render json: { error: 'Credenciales incorrectas' }, status: :unprocessable_entity
    else
      render json: { msj: 'Credenciales correctas'}, status: :ok
    end
  end

  def user_params
    params.permit(:email, :password)
  end

end