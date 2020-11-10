class CreateCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :codes do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :codeno, null: false, uniqueness: true
      t.string :title, null: false
      t.string :category, null: false
      t.text :summary, null: false
      t.text :detail, null: false
      t.text :supplement
      t.timestamps
    end
  end
end
