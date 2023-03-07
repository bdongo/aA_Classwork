class CreateResponse < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.references :respondent, null:false, foreign_key: {to_table: :users}
      t.references :question, null:false, foreign_key:true
      t.timestamps
    end
  end
end
