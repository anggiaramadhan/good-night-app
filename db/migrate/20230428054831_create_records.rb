class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :clock_in, null: false
      t.datetime :clock_out
      t.decimal :duration
      t.boolean :complete, null: false, default: false

      t.timestamps
    end
  end
end
