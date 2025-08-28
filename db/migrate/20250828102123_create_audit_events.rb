class CreateAuditEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :audit_events do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :action
      t.references :auditable, polymorphic: true, null: false
      t.jsonb :data
      t.string :ip
      t.string :user_agent

      t.timestamps
    end
  end
end
