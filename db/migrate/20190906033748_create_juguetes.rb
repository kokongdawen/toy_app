class CreateJuguetes < ActiveRecord::Migration[5.1]
  def change
    create_table :juguetes do |t|
      t.string :name
      t.text :content
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :juguetes, [:user_id, :created_at]
  end
end
