class CreateWordAttachments < ActiveRecord::Migration
  def change
    create_table :word_attachments do |t|
      t.references :word, index: true
      t.string :asset

      t.timestamps
    end
  end
end
