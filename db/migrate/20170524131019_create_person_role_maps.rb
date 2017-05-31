class CreatePersonRoleMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :person_role_maps do |t|
      t.references :role, :null => false, :index => true
      t.references :person, foreign_key: true, :null => false, :index => true
      t.boolean :voided, :null => false, :default => 0
      t.integer :voided_by
      t.integer :created_by, :null => false
      t.text :voided_reason
      t.string :uuid, :null => false, :limit => 36, :default => ""


      t.timestamps
    end
    add_foreign_key :person_role_maps, :users, column: :created_by, :index => true
    add_foreign_key :person_role_maps, :users, column: :voided_by, :index => true

  end
end
