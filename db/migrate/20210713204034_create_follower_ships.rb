class CreateFollowerShips < ActiveRecord::Migration[6.1]
  def change
    create_table :follower_ships do |t|
      t.references :user, foreign_key: true
      t.references :follower, foreign_key: { to_table: 'users' }
      t.timestamps
    end
  end
end
