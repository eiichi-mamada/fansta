class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user
      t.references :post

      t.timestamps
    end
  end
end
