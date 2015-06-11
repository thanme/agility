class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :hosting_club
      t.boolean :isAgility
      t.boolean :isJumping
      t.boolean :isADO
      t.boolean :isJDO
      t.boolean :isSnooker
      t.boolean :isGamblers
      t.boolean :isStratPairs
      t.datetime :trial_datetime
      t.text :notes

      t.timestamps
    end
  end
end
