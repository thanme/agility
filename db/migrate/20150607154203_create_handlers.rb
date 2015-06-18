class CreateHandlers < ActiveRecord::Migration
  def change
    create_table :handlers do |t|
      t.string :first_name
      t.string :last_name
      t.string :reg
      t.string :email
      t.string :encrypted_password 
      t.string :salt
      t.timestamps
    end
  end
end
