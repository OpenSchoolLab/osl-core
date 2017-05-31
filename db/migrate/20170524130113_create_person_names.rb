class CreatePersonNames < ActiveRecord::Migration[5.0]
  def change
    create_table :person_names do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :voided, :null => false, :default => 0
      t.integer :voided_by
      t.integer :created_by, :null => false
      t.text :voided_reason
      t.string :uuid, :null => false, :limit => 36, :default => ""

      t.references :person, foreign_key: true, :null => false

      t.timestamps
    end
    add_foreign_key :person_names, :users, column: :created_by, :index => true
    add_foreign_key :person_names, :users, column: :voided_by, :index => true
  end
end
