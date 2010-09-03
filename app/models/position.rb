class Position < ActiceRecord::Base
  has_many :locations
  belongs_to :user
  
  def name
    "#{latitude}, #{longitude}"
  end
end