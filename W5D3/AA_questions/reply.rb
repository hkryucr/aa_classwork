require_relative "question_db"
require_relative "question_like"
require_relative "question_follow"
require_relative "question"
require_relative "user"

class Reply
    attr_reader :id, :author_id, :parent_id
    def self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            * 
        FROM 
            replies 
        WHERE 
            id = ?
        SQL
        
        return nil unless reply.length > 0
        Reply.new(reply.first)
    end

    def self.find_by_parent_id(parent_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, parent_id)
        SELECT 
            * 
        FROM 
            replies 
        WHERE 
            parent_id = ?
        SQL
        
        return nil unless replies.length > 0
        replies.map {|reply| Reply.new(reply)}
    end

    def self.find_by_user_id(user_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT 
            * 
        FROM 
            replies 
        WHERE 
            author_id = ?
        SQL
        
        return nil unless replies.length > 0
        replies.map {|reply| Reply.new(reply)}
   
    end

    def self.find_by_question_id(question_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT 
            * 
        FROM 
            replies 
        WHERE 
            question_id = ?
        SQL
        
        return nil unless replies.length > 0
        replies.map {|reply| Reply.new(reply)}
    end

    def initialize(option)
        @id = option['id']
        @question_id = option['question_id']
        @title = option['title']
        @body = option['body']
        @author_id = option['author_id']
        @parent_id = option['parent_id']
    end

    def author
        User.find_by_id(author_id)
    end

    def question
        Question.find_by_author_id(author_id)
    end

    def parent_reply
        Reply.find_by_id(parent_id)
    end

    def child_replies
        Reply.find_by_parent_id(id)
    end
end