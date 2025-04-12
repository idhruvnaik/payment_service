class PaymentsController < ApplicationController
  def pay_now
    unless validate_params(["amount"])
      return
    end

    render_success
  end
end
