class CreateAnswerChoice < ActiveRecord::Migration[7.0]
  def change
    create_table :answer_choices do |t|
      t.string :body, null: false
      t.references :question, null:false, foreign: true

      t.timestamps
    end
  end
end
