require_relative "question_db"
require_relative "question_follow"
require_relative "question"
require_relative "reply"
require_relative "user"

class QuestionLike
    attr_reader :id

    def self.find_by_id(id)
        question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            * 
        FROM 
            question_likes 
        WHERE 
            id = ?
        SQL
        return nil unless question_like.length > 0
        QuestionLike.new(question_like.first)
    end

    def self.likers_for_question_id(question_id)
        likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT 
            * 
        FROM 
            question_likes 
        WHERE 
            question_id = ?
        SQL
        return nil unless likers.length > 0
        likers.map {|liker| User.find_by_id(likers['user_id'])}
    end

    def initialize(option)
        @id = option['id']
        @question_id = option['question_id']
        @liked = option['liked']
    end
end