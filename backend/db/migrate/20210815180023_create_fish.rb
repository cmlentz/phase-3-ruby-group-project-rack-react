class CreateFish < ActiveRecord::Migration[5.2]
  def change
    create_table :single_fishes do |t|
      t.string :species
      t.integer :weight
      t.integer :rarity
      t.boolean :caught
      t.belongs_to :river, foreign_key: true
    end
  end
end
