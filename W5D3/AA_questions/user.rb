require_relative "question_db"
require_relative "question_like"
require_relative "question_follow"
require_relative "question"
require_relative "reply"

class User
    attr_reader :id
    def self.find_by_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            * 
        FROM 
            users 
        WHERE 
            id = ?
        SQL
        return nil unless user.length > 0
        User.new(user.first)
    end

    def self.find_by_name(fname, lname)
        user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT 
            * 
        FROM 
            users 
        WHERE 
            fname = ? AND lname = ?
        SQL
        
        return nil unless user.length > 0
        User.new(user.first)
    end

    def initialize(option)
        @id = option['id']
        @fname = option['fname']
        @lname = option['lname']
    end

    def authored_questions
        Question.find_by_author_id(self.id)
    end

    def authored_replies
        Reply.find_by_user_id(self.id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(id)
    end

end