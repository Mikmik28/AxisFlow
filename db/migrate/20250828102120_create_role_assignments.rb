class CreateRoleAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :role_assignments do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
