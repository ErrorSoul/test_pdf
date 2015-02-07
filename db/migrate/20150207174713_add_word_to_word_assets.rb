class AddWordToWordAssets < ActiveRecord::Migration
  def change
    add_reference :word_assets, :word, index: true
  end
end
