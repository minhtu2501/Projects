class Order < ActiveRecord::Base
 belongs_to :cart

 validates :custome_name, presence: true, length: {maximum: 50}
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, presence: true, length: {maximum: 255}, 
				format: {with: VALID_EMAIL_REGEX}
 validates :mobile, presence: true, length: {in: 9..10}
 validates :address, presence: true
end
