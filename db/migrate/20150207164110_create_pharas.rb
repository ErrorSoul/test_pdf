class CreatePharas < ActiveRecord::Migration
  def change
    create_table :pharas do |t|
      t.string :avatar

      t.timestamps
    end
  end
end
