require_relative 'questions_database'
require_relative 'users'
require_relative 'questions'
require_relative 'replies'
require_relative 'question_like'


class QuestionsFollows
    attr_accessor :question_id, :user_id, :id
    def self.all 
        data = QuestionsDBConnection.instance.execute("SELECT * FROM questions_follows")
        data.map {|datum| QuestionsFollows.new(datum)}
    end

    def initialize (options)
        @question_id = options['question_id']
        @user_id = options['user_id']
        @id = options['id']
    end

    def self.find_by_id(id)
        data = QuestionsDBConnection.instance.execute(<<-SQL,id)
                SELECT 
                    * 
                FROM 
                    questions
                WHERE 
                    id = ?; 
            SQL

        data.map { |datum| QuestionsFollows.new(datum) }
    end

    

end