class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :percent

      t.timestamps null: false
    end
  end
end
