require 'machinist/active_record'

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
  email 'ra@2l.com'
  username 'rendrick'
  password 'password'
  password_confirmation 'password'
end