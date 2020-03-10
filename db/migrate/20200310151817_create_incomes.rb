class CreateIncomes < ActiveRecord::Migration[6.0]
  def change
    create_table :incomes do |t|
      t.string :email
      t.integer :acc_inc
      t.string :tours

      t.timestamps
    end
  end
end
