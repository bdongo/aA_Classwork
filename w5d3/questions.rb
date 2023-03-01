require_relative 'questions_database'
require_relative 'users'
require_relative 'question_like'
require_relative 'replies'
require_relative 'question_follows'


class Questions 
    attr_accessor :title, :body, :id, :author_id
    def self.all 
        data = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
        data.map {|datum| Questions.new(datum)}
    end

    def initialize (options)
        @title = options['title']
        @body = options['body']
        @id = options['id']
        @author_id = options['author_id']
    end


    def self.find_by_author_id(author_id)
        
        data = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
                SELECT 
                    * 
                FROM 
                    questions
                WHERE 
                    author_id = ?; 
            SQL

        data.map { |datum| Questions.new(datum) }
    end 

    def author 
        data = QuestionsDBConnection.instance.execute(<<-SQL, self.author_id)
                SELECT 
                    * 
                FROM 
                    users
                WHERE 
                    id = ?; 
            SQL
        Users.new(data.first)
    end

    def replies 
        Replies.find_by_question_id(self.id)
    end
end