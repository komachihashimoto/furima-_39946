class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :zip_code,           null: false, default: ""
      t.integer :prefecture_id,     null: false
      t.string :city,               null: false, default: ""
      t.string :address_line1,      null: false, default: ""
      t.string :address_line2,      default: ""
      t.string :tel,                null: false, default: ""
      t.references :buy_history,    null: false, foreign_key: true

      t.timestamps
    end
  end
end
