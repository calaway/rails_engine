class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :invoice, foreign_key: true
      t.datetime :credit_card_expiration_date
      t.string :result

      t.timestamps
    end
  end
end
