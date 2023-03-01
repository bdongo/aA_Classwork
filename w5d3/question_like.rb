require_relative 'questions_database'
require_relative 'users'
require_relative 'questions'
require_relative 'replies'
require_relative 'question_follows'


class QuestionLike 
    attr_accessor :user_id, :question_id, :id, :like_status
    def self.all 
        data = QuestionsDBConnection.instance.execute("SELECT * FROM question_like")
        data.map {|datum| QuestionLike.new(datum)}
    end

    def initialize (options)
        @user_id = options['user_id']
        @question_id = options['question_id']
        @id = options['id']
        @like_status = options['like_status']
    end

    def self.find_by_id

    end 
end