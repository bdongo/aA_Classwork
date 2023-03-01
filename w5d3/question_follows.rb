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
                    questions_follows
                WHERE 
                    id = ?; 
            SQL

        data.map { |datum| QuestionsFollows.new(datum) }
    end

    def self.followers_for_question_id(id)
        data = QuestionsDBConnection.instance.execute(<<-SQL, id)
                SELECT 
                    users.id, users.fname, users.lname 
                FROM 
                    questions_follows
                JOIN 
                    users ON users.id = questions_follows.user_id
                WHERE 
                    questions_follows.question_id = ?; 
            SQL

        data.map { |datum| Users.new(datum) }
    end

    def self.followers_for_user_id(id)
        data = QuestionsDBConnection.instance.execute(<<-SQL, id)
                SELECT
                    questions_follows.question_id, questions.title, questions.body, questions.author_id
                FROM
                    questions_follows
                JOIN
                    questions ON questions.id = questions_follows.question_id
                WHERE
                    questions_follows.user_id = ?;
                SQL
        data.map { |datum| Questions.new(datum) }
    end

end