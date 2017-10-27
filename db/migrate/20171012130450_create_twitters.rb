class CreateTwitters < ActiveRecord::Migration
  def change
    create_table :twitters do |t|
      t.timestamps
      t.string :name
      t.integer :tweet_number
      t.integer :follower_number
      t.integer :user_id
    end
  end
end
