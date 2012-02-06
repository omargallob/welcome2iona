require 'file_size_validator' 
class Post < ActiveRecord::Base
  has_event_calendar
  attr_accessible :title, :body,:body_html, :category_id, :position, :published,:published_on, :start_at, :end_date, :end_at, :image,:document, :category_parent, :crop_x, :crop_y, :crop_h, :crop_w, :open,:rates,:address,:website,:phone, :email

  belongs_to :category
  #mount_uploader :image, ThumbUploader
  #mount_uploader :document, DocumentUploader
  #albums
  has_many :albums, :as => :albumable, :dependent => :destroy

  attr_accessible :albums_attributes 
  attr_writer :albums_attributes,:category_parent
  accepts_nested_attributes_for :albums, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
  #uploads
  has_many :uploads, :through => :albums  

 
  validates_presence_of :body
  validates_length_of :title, :maximum=>33

   has_one :metatag, :as => :metatagable,  :dependent => :destroy
   attr_accessible :metatag_attributes 
   attr_writer :metatag_attributes
   accepts_nested_attributes_for :metatag
   #  DOCUMENTS
   # has_many :documents, :dependent => :destroy
   # attr_accessible :documents_attributes 
   # attr_writer :documents_attributes
   # accepts_nested_attributes_for :documents, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
  


   mount_uploader :image, ImageUploader
  attr_accessor  :crop_x, :crop_y, :crop_h, :crop_w

  scope :published, lambda{
     where(:published => true).order("published_on ASC")
   }
  scope :category,  lambda{|id|
     where("category.parent_id"=>id).published
   }
  scope :children, lambda{|id|
    where("categories.parent_id"=>id).published.join(:categories)
  }
  # scope :parent, lambda{|id|
  #   includes(:category).
  #   where(:categories => {:id => id}).all
  # }
  # 
  def parent_title
    self.category.parent.title
  end
  
  def news_month    
    self.published_on.strftime("%B")
  end

  validates_presence_of :category
  validates :image, 
      :file_size => { 
        :maximum => 1.megabytes.to_i 
      }
  
  after_update :reprocess_image, :if => :cropping?
   
      def cropping?
        !crop_x.blank? && !crop_y.blank?  && !crop_w.blank? && !crop_h.blank?
      end
      
      def image_geometry
        img = MiniMagick::Image.from_file("public"+self.image.url)
        @geometry = {:width => img[:width], :height => img[:height] }

      end
      # 
      private
      def reprocess_image
          image = MiniMagick::Image.from_file("public"+self.image.url)
          crop_params = "#{crop_w}x#{crop_h}+#{crop_x}+#{crop_y}"
          image.crop(crop_params)
          image
      end
      def original_document
        self.document.original_filename
      end
    
end
