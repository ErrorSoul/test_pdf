class AddWordToPharas < ActiveRecord::Migration
  def change
    add_reference :pharas, :word, index: true
  end
end
