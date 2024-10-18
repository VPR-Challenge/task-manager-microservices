class CreateCars < ActiveRecord::Migration[7.2]
  def change
    create_table :cars do |t|
      t.string :title
      t.string :price
      t.text :description

      t.timestamps
    end
  end
end
