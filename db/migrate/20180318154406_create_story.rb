class CreateStory < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.belongs_to :profile, index: true

      t.timestamps
    end
  end
end
