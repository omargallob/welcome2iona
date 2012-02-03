class Category < ActiveRecord::Base
  attr_accessible :title, :parent_id, :position, :page_id, :body,:navlabel
  #has_many :downloads,:dependent => :destroy
  has_many :posts,:dependent => :destroy
  has_many :maps, :dependent => :destroy
  has_many :galleries, :dependent => :destroy
  has_many :subcategories, :class_name => 'Category', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Category', :foreign_key => 'parent_id'
  belongs_to :page
  has_one :link
  has_one :metatag, :as => :metatagable,  :dependent => :destroy
  attr_accessible :metatag_attributes 
  attr_writer :metatag_attributes
  accepts_nested_attributes_for :metatag
  
  def self.find_main
     Category.order("position").where("parent_id IS ?", nil).all
   end
   def self.find_sub(pid)
     Category.order("position").where('parent_id = ?', pid).all
   end
   def self.find_all_sub
     Category.order("parent_id").where('parent_id IS NOT ?', nil).all
   end
   # scope :filtered, lambda { |a|
   #   joins(:posts).group("posts.category_id")
   # }
   scope :children, lambda{|a|
    includes(:posts).where('categories.parent_id' => a) 
    }
    scope :main,lambda{
      where("categories.parent_id IS ?", nil)
    }
end
