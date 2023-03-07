class Response < ApplicationRecord
    belongs_to :respondent,
        foreign_key: :respondent_id,
        class_name: :User

    
end