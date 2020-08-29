class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name, null: false, unique: true
      t.string :icon

      t.timestamps
    end
  end
end
