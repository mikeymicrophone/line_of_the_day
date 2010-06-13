require 'machinist/active_record'
require 'forgery'

Line.blueprint do
  phrasing 'tickle me elmo!'
end

Line.blueprint :public do
  public true
end

Group.blueprint {}

Membership.blueprint {}

Publication.blueprint {}

User.blueprint do
  email { Forgery(:internet).email_address }
  username { Forgery(:internet).user_name }
  password 'password'
  password_confirmation 'password'
end