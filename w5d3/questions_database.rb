require 'sqlite3'
require 'singleton'


class QuestionsDBConnection < SQLite3::Database 
    include Singleton 

    def initialize
        super('questions.db')
        self.type_translation = true 
        self.results_as_hash = true 
    end


end

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
                    questions
                WHERE 
                    author_id = ?; 
            SQL
        # return user obj
    end
end

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

        data.map { |datum| Replies.new(datum) }
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

end 

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

print james = Users.find_by_name('Brandon', 'Leung')
puts
print james.id
puts 
print james.fname
puts
print james.authored_questions
puts 
# print QuestionsFollows.all