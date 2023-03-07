class CreatePoll < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.references :author, null: false, foreign_key: {to_table: :users}
      t.string :title, null:false
      t.timestamps
    end
    add_index :users, :username, unique:true
  end
end
