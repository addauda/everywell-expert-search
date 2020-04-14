class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :content
      t.string :heading_tag
      t.belongs_to :member
      t.timestamps
    end
  end
end
