class CreateDaras < ActiveRecord::Migration
  def change
    create_table :daras do |t|
      t.string :asset

      t.timestamps
    end
  end
end
