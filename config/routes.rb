ActionController::Routing::Routes.draw do |map|
  map.iphone '/iphone', :controller => 'iphone', :action => 'initial'
  
  map.resources :messages

  map.resources :results, :has_many => [:approaches, :lines]

  map.resources :approaches, :has_one => [:line, :scene, :result], :collection => {:auto_complete_for_line_phrasing => :post, :auto_complete_for_scene_name => :post, :auto_complete_for_result_name => :post}

  map.resources :scenes, :has_many => [:approaches, :lines, :goals]

  map.resources :publications, :has_one => [:line, :user, :group]

  map.resources :memberships, :has_one => [:group, :user], :has_many => [:publications, :lines, :comments]

  map.resources :groups, :has_many => [:publications, :lines, :memberships, :users], :member => {:avatar => :get}

  map.resources :comments, :has_one => [:line, :user]
  
  map.resources :affirmations, :has_many => [:list_items]
  
  map.resources :tips, :has_many => [:goals, :list_items, :ratings, :comments, :tags]
  
  map.resources :goals, :has_many => [:goal_ownerships, :list_items]
  
  map.resources :goal_ownerships
  
  map.resources :ratings
  
  map.resources :books, :has_many => [:list_items]
  
  map.resources :quotes, :has_many => [:list_items]
  
  map.resources :articles, :has_many => [:list_items]

  map.resources :users, :has_many => [:lines, :tips, :affirmations, :groups, :memberships, :publications, :comments, :goal_ownerships, :lists, :nicknames, :ratings, :goals], :member => {:avatar => :get} do |user|
    user.resources :students, :controller => 'guidances' do |student|
      student.resources :lines, :approaches, :results
    end
    user.resources :coaches, :controller => 'guidances' do |coach|
      coach.resources :messages, :lines, :publications
    end
    user.resources :groups do |group|
      group.resources :lines
    end
  end

  map.resources :guidances

  map.resources :lines, :has_one => [:user], :has_many => [:publications, :comments, :groups, :approaches, :goals, :list_items, :ratings, :tags], :collection => {:mine => :get, :random => :get}

  map.resources :blogs, :has_many => [:posts, :list_items], :member => {:fetch => :get}, :collection => {:fetch_all => :get}
  map.resources :posts, :has_one => [:blog], :has_many => [:list_items]
  
  map.resources :newsletters
  
  map.resources :lists, :has_many => [:list_items], :member => {:elevate => :put, :lower => :put, :tag => :get}
  map.resources :list_items, :has_one => [:list], :member => {:elevate => :put, :lower => :put}

  map.resource :user_session
  map.resources :user_sessions, :collection => {:iphone_login => :get}
  map.identify_user '/users/:username/identity', :controller => 'users', :action => 'identify'
  
  map.resources :password_resets
  map.root :controller => 'lines'
  
  map.resources :videos, :has_many => [:list_items]
  
  map.resources :nicknames
  
  map.resources :tags
  
  map.resources :concepts
  
  map.resources :questions, :has_many => [:list_items]
  
  map.resources :exercises, :has_many => [:list_items, :goals, :ratings, :comments, :tags]
  map.connect "/:controller/:id/inspect_content/:user_id", :action => 'inspect_content'
  
  map.resources :stories, :has_many => [:list_items]

  map.resources :artists, :has_many => [:list_items]
  
  map.resources :companies, :has_many => [:list_items]
  
  map.resources :products, :has_many => [:list_items]
  
  map.resources :websites, :has_many => [:list_items]
  
  map.resources :feedbacks
  
  map.resources :invitations
  
  map.resources :countries
  map.resources :states
  map.resources :cities
  map.resources :neighborhoods
  map.resources :positions
  map.resources :locations
  
  map.search '/search', :controller => 'search', :action => 'index', :method => :post
  
  map.about '/about', :controller => 'static', :action => 'about'
  map.terms '/terms', :controller => 'static', :action => 'terms'
  map.faq '/faq', :controller => 'static', :action => 'faq'

  map.connect 'talktoher/:action', :controller => 'talktoher'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
