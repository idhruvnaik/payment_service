class CreatePayments < ActiveRecord::Migration[7.2]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :payment_method, null: false, foreign_key: true
      t.integer :amount
      t.string :currency
      t.string :status
      t.string :transaction_id
      t.string :idempotency_key

      t.timestamps
    end
    add_index :payments, :idempotency_key
  end
end
