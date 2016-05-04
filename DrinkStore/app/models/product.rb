class Product < ActiveRecord::Base
  belongs_to :category
  has_many :pictures
  has_many :order_items
  has_many :carts, through: :order_items
  has_many :orders, through: :carts
  before_save :default_values
  has_attached_file :picture, style: {show: "100x100", default_url: 'missing_:avatar.png'}
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'

  scope :recent, -> { order(created_at: 'DESC').limit(5) }
  scope :top_seller, -> { includes(orders: :order_items)
                          .where(orders: {status: "Complete"})
                          .group("order_items.id")
                          .order("sum(order_items.quantity) DESC")
                          .limit(5)
                          #.select("sum(order_items.quantity) as total")
                        }
  def default_values
    self.category_id ||= 1
  end
end
