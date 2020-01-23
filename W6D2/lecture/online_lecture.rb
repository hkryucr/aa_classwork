# RAILS ROUTING

# GOAL: getting HTTP request and sending HTTP response

# 1. HTTP request to router
# 2. Router -> path & method
# - router will check the path and the method and it has a list of what combinations of the paths and methods are associated with which controllers and which actions of the controllers
# - UsersController: figure out how to process data about the users
# - router

# The router when it matches the path and the method => create(initialize) a new UsersController instance => call the right index actions => UsersController's job is to send HTTP response back to users
# This happens in routes.rb

# if the router can't find matched path and methods -> send 404

ROUTES
Representational state transfer
- get 'superheroes', to: 'superheroes#index'
- get 'superheroes/:id', to: 'superheroes#show'
- post .. to 'superheroes#create'
- patch .. to 'superheroes#update'
- put .. to 'superheroes#update'
- delete .. to 'superheroes#destroy'

can all be created with:
resources :superheroes, only: [:index, :show, :create, :update, :destroy]


get 'superheroes/2/abilities'
patch 'superheroes/2/abilities/6'

resources :superheroes do
    resources :abilities, only: [:index]
end

resources :abilities, only: [:show, :update, :create, :destroy]
end

1) get 'silly', to: 'silly#fun'
2) make silly_controller
3) 
class SillyController < ApplicationController
    def fun
        render text: params[:message]
    end
    def time
        render json: params
    end
    def super
        render json: params
    end
end

# params
# 1) Query string
# 2) Request body
# 3) URL Params/route params (wildcards)

4) post 'silly', to: 'silly#time'
5) post 'silly/:id', to: 'silly#super'


-start server 
=> rails s
