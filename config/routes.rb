ActionController::Routing::Routes.draw do |map|
  map.resources :messages

  map.resources :results, :has_many => [:approaches, :lines]

  map.resources :approaches, :has_one => [:line, :scene, :result], :collection => {:auto_complete_for_line_phrasing => :post, :auto_complete_for_scene_name => :post, :auto_complete_for_result_name => :post}

  map.resources :scenes, :has_many => [:approaches, :lines, :goals]

  map.resources :publications, :has_one => [:line, :user, :group]

  map.resources :memberships, :has_one => [:group, :user], :has_many => [:publications, :lines, :comments]

  map.resources :groups, :has_many => [:publications, :lines, :memberships, :users]

  map.resources :comments, :has_one => [:line, :user]
  
  map.resources :affirmations
  
  map.resources :tips, :has_many => [:goals]
  
  map.resources :goals
  
  map.resources :goal_ownerships
  
  map.resources :ratings

  map.resources :users, :has_many => [:lines, :groups, :memberships, :publications, :comments, :goal_ownerships] do |user|
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

  map.resources :lines, :has_one => [:user], :has_many => [:publications, :comments, :groups, :approaches, :goals], :collection => {:mine => :get}

  map.resource :user_session
  map.resources :password_resets
  map.root :controller => 'lines'
  
  map.about '/about', :controller => 'static', :action => 'about'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
