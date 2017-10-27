class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|

      t.timestamps
      t.integer :status
      t.integer :user_id
    end
  end
end
