class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      
      t.string :classes

      t.timestamps
    end
  end
end
