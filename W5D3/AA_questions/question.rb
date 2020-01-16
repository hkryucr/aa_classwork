require_relative "question_db"
require_relative "question_like"
require_relative "question_follow"
require_relative "reply"
require_relative "user"

class Question
    attr_reader :id, :author_id
    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            * 
        FROM 
            questions 
        WHERE 
            id = ?
        SQL
        
        return nil unless question.length > 0
        Question.new(question.first)
    end

    def self.find_by_author_id(author_id)
        question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT 
            * 
        FROM 
            questions 
        WHERE 
            author_id = ?
        SQL

        return nil unless question.length > 0
        question.map {|question| Question.new(question)}
    end

    def self.most_followed(n)
        QuestionFollow.most_followed_questions(n)
    end

    def initialize(option)
        @id = option['id']
        @title = option['title']
        @body = option['body']
        @author_id = option['author_id']
    end

    def author
        User.find_by_id(@author_id)
    end

    def replies
        Reply.find_by_question_id(self.id)
    end

    def followers
        QuestionFollow.followers_for_question_id(id)
    end
end