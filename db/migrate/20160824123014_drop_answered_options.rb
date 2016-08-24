class DropAnsweredOptions < ActiveRecord::Migration
  def change
    drop_table :answered_options
  end
end
