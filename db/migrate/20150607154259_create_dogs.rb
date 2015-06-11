class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :reg
      t.string :titles
      t.string :breed

      t.timestamps
    end
  end
end
