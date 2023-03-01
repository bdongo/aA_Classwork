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









# print reply = Replies.find_by_id(2)
# puts
# print reply.parent_reply
# # puts 
# # print james.fname
# # puts
# # print james.authored_questions
# puts 
# # print QuestionsFollows.all