class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.boolean :voided, :null => false, :default => 0
      t.integer :voided_by
      t.integer :created_by, :null => false
      t.text :voided_reason
      t.string :uuid, :null => false, :limit => 36, :default => ""

      t.timestamps
    end
    add_foreign_key :people, :users, column: :created_by, :index => true
    add_foreign_key :people, :users, column: :voided_by, :index => true
  end
end
