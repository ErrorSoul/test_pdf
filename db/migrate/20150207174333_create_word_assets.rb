class CreateWordAssets < ActiveRecord::Migration
  def change
    create_table :word_assets do |t|
      t.string :asset

      t.timestamps
    end
  end
end
