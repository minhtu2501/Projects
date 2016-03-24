class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :age
      t.string :address
      t.string :email
      t.string :tel

      t.timestamps null: false
    end
  end
end
