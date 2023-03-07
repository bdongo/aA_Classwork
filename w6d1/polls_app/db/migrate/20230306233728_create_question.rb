class CreateQuestion < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.references :poll, null: false, foreign_key: true
      t.string :body, null: false
      t.timestamps
    end
  end
end
