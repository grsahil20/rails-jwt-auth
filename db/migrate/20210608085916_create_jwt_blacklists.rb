class CreateJwtBlacklists < ActiveRecord::Migration[6.1]
  def change
    create_table :jwt_blacklists do |t|
      t.string :jti
      t.string :aud
      t.datetime :exp, null: :false
      t.references :users, foreign_key: { on_delete: :cascade }, null: false

      t.timestamps
    end
    add_index :jwt_blacklists, :jti
  end
end
