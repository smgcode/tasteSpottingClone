class Favorite < ActiveRecord::Base
  attr_accessible :post_id, :user_id
  
  belongs_to :user,
  :class_name => "User",
  :foreign_key => :user_id,
  :primary_key => :id
  
  belongs_to :post,
  :class_name => "Post",
  :foreign_key => :post_id,
  :primary_key => :id
end
