class PaymentsController < ApplicationController
  before_action :authenticate_user

  def pay_now
    unless validate_params(["amount"])
      return
    end

    render_success
  end
end
