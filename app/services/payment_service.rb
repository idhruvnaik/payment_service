class PaymentService
  def initialize(user:, amount:, method_id:)
    @user = user
    @amount = amount
    @method_id = method_id
  end

  def process
  end
end
