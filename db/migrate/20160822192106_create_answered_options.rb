class CreateAnsweredOptions < ActiveRecord::Migration
  def change
    create_table :answered_options do |t|
      t.integer :answer_id
      t.integer :option_id

      t.timestamps null: false
    end
  end
end
