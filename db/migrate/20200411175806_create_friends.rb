class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.references :from
      t.references :to
      t.timestamps
    end
    add_foreign_key :friends, :members, column: :from_id, primary_key: :id
    add_foreign_key :friends, :members, column: :to_id, primary_key: :id
    add_index :friends, %i[from_id to_id], unique: true
  end
end
