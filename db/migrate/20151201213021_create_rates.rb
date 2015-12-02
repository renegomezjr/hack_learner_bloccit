class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.references :rating, index: true
      t.references :ratable, polymorphic: true, index: true
      t.timestamps null: false
    end
    add_foreign_key :rates, :ratings
  end
end
