require_relative 'questions_database'
require_relative 'question_like'
require_relative 'questions'
require_relative 'replies'
require_relative 'question_follows'


class Users   
    attr_accessor :fname, :lname, :id
    def self.all 
        data = QuestionsDBConnection.instance.execute("SELECT * FROM users")
        data.map {|datum| Users.new(datum)}
    end

    def initialize (options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def self.find_by_id(id)
        data = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?;
            SQL

        Users.new(data.first)
    end 

    def self.find_by_name(first, last)
        data = QuestionsDBConnection.instance.execute(<<-SQL, first, last)
            SELECT
                *
            FROM
                users
            WHERE
                fname = ? AND lname = ?;
        SQL

        Users.new(data.first)
    end 

    def authored_questions
        Questions.find_by_author_id(self.id) #results in an array of objects
    end

    def authored_replies
        Replies.find_by_user_id(self.id)
    end


end 
