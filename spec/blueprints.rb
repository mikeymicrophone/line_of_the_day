require 'machinist/active_record'

Line.blueprint do
  phrasing 'tickle me elmo!'
end

Line.blueprint :public do
  public true
end