Callback
- callbacks are methods that get called at certain moments of an object's life cycle
- before_validation, after_create, after_destroy
-e.g.
before_validation(on: :create) do
    self.number = number.gsub(/[^0-9]/, '') if attribute_present?('number')
end

Relational Callback
- dependent: :destroy
- when user is destroyed, make it sure to destroy posts too.

- dependent: :nullify
- when user is destroyed, make posts have null value for its user_id foreign_key.

- dependent: :restrict
- when user has its has_many relationship with posts, the exception is raised if we try to destroy user.

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
end

it's not common to use dependent: :destroy for belongs_to

Routing II: Nested Collections

# config/routes.rb
NewspapersApp::Application.routes.draw do
  resources :magazines do
    # provides a route to get all the articles for a given magazine.
    resources :articles, only: :index
  end

  # provides all seven typical routes
  resources :articles
end

# This generates a /magazines/:magazine_id/articles route. Requests for this route will be sent to the ArticlesController#index action.

class ArticlesController
  def index
    if params.has_key?(:magazine_id)
      # index of nested resource
      @articles = Article.where(magazine_id: params[:magazine_id])
    else
      # index of top-level resource
      @articles = Article.all
    end

    render json: @articles
  end
end

