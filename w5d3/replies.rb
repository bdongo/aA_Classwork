require_relative 'questions_database'
require_relative 'users'
require_relative 'questions'
require_relative 'question_like'
require_relative 'question_follows'


class Replies 
    attr_accessor :question_id, :parent_reply_id, :user_id, :id
    def self.all 
        data = QuestionsDBConnection.instance.execute("SELECT * FROM replies")
        data.map {|datum| Replies.new(datum)}
    end

    def initialize (options)
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
        @user_id = options['user_id']
        @id = options['id']
    end
    def self.find_by_id(id)
        data = QuestionsDBConnection.instance.execute(<<-SQL, id)
                SELECT 
                    * 
                FROM 
                    replies
                WHERE 
                    id = ?; 
            SQL

        Replies.new(data.first)
    end
    
    def self.find_by_user_id(id)
        data = QuestionsDBConnection.instance.execute(<<-SQL, id)
                SELECT 
                    * 
                FROM 
                    replies
                WHERE 
                    user_id = ?; 
            SQL

        data.map { |datum| Reply.new(datum) }
    end

    def self.find_by_question_id(id)
        data = QuestionsDBConnection.instance.execute(<<-SQL, id)
                SELECT 
                    * 
                FROM 
                    replies
                WHERE 
                    question_id = ?; 
            SQL

        data.map { |datum| Replies.new(datum) }
    end

    def author
        data = QuestionsDBConnection.instance.execute(<<-SQL, self.user_id)
            SELECT 
                * 
            FROM 
                users 
            WHERE 
                id = ?;
        SQL
        Users.new(data.first)
    end

    def question 
        data = QuestionsDBConnection.instance.execute(<<-SQL, self.question_id)
            SELECT
                * 
            FROM 
                questions 
            WHERE 
                id = ? ;
        SQL
        Questions.new(data.first)
    end 

    def parent_reply
        data = QuestionsDBConnection.instance.execute(<<-SQL, self.parent_reply_id)
            SELECT 
                * 
            FROM 
                replies 
            WHERE 
                id = ? ;
        SQL
        return nil if data.empty? 
        Replies.new(data.first)
    end

    def child_replies 
        data = QuestionsDBConnection.instance.execute(<<-SQL, self.id) 
            SELECT
                * 
            FROM 
                replies 
            WHERE 
                parent_reply_id = ? ; 
            SQL
        return nil if data.empty? 
        Replies.new(data.first)
    end 
end 
