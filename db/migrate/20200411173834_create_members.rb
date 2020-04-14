class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :website
      t.string :short_url
      t.timestamps
    end
    add_index :members, %i[name website], unique: true
  end
end
