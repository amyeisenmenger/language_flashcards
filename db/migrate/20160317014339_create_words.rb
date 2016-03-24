class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :english
      t.string :dutch
      t.string :part_of_speech
      t.belongs_to :user
      t.belongs_to :category

      t.timestamps null: false
    end
  end
end
