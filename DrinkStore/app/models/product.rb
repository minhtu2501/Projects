class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_items
  before_save :default_values
  
  def default_values
    self.category_id ||= 1
  end
end
