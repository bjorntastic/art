class Painting < ActiveRecord::Base

  has_attached_file :picture, :styles => { :medium => "300x300>", :large => "600x600>" }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  
end
