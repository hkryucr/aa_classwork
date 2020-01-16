require_relative "question_db"
require_relative "question_like"
require_relative "question"
require_relative "reply"
require_relative "user"
require 'byebug'
class QuestionFollow
    def self.find_by_id(id)
        question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            * 
        FROM 
            question_follows 
        WHERE 
            id = ?
        SQL
        
        return nil unless question_follow.length > 0
        QuestionFollow.new(question_follow.first)
    end
    
    def self.followers_for_question_id(question_id)
        #  User objects in an array
        q_followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT 
        users.id, users.fname, users.lname
        FROM 
        users
        JOIN 
        question_follows
        ON 
        users.id = question_follows.user_id
        JOIN
        questions
        ON
        question_follows.question_id = questions.id
        WHERE
        question_id = ?;
        SQL
        return nil unless q_followers.length > 0
        q_followers.map{|q_follower| User.new(q_follower)}
    end
    
    def self.followed_questions_for_user_id(user_id)
        #  User objects in an array
        questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT 
        questions.*
        FROM 
        users
        JOIN 
        question_follows
        ON 
        users.id = question_follows.user_id
        JOIN
        questions
        ON
        question_follows.question_id = questions.id
        WHERE
        user_id = ?;
        SQL
        
        return nil unless questions.length > 0
        questions.map{|question| Question.new(question)}
    end

    def self.most_followed_questions(n)
        questions = QuestionsDatabase.instance.execute(<<-SQL, n)
        SELECT 
            *
        FROM 
            question_follows
        GROUP BY
            question_id
        ORDER BY
            COUNT(question_id) DESC
        LIMIT ?;
        SQL
        questions.map{|question| Question.find_by_id(question["question_id"])}
    end

    attr_reader :id
    def initialize(option)
        @id = option['id']
        @user_id = option['user_id']
        @question_id = option['question_id']
    end



end