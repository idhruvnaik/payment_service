class LoginController < ApplicationController
  def sign_in
    unless validate_params(["email", "password"])
      return
    end

    user = User.find_by_email params[:email]
    if user.present? && user.authenticate(params[:password])
      if user.respond_to?(:regenerate_auth_token)
        user.regenerate_auth_token
        render_success(user, "Authenticated!") and return
      end
    end

    render_unauthorized and return
  end

  def sign_up
    unless validate_params(["name", "email", "password"])
      return
    end

    user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password])
    user.save

    render_success(user, "Successfully created", :created) and return
  end
end
