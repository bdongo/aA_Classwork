class AnswerChoice < ApplicationRecord
    belongs_to :question,
        foreign_key: :question_id,
        class_name: :Qeustion
end