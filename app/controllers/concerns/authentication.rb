module Authentication
  extend ActiveSupport::Concern
  extend RequestValidation

  def authenticate_user
    token = request.headers["Authorization"]&.split("Bearer ")&.last
    @current_user = User.find_by(auth_token: token)

    unless @current_user
      render json: { message: "Unauthorized" }, status: :unauthorized and return
    end
  end
end
