class Metatag < ActiveRecord::Base
  attr_accessible :title, :description,:keywords, :metatagable_id, :metatagable_type
  #validates_presence_of :title, :description,:keywords
  belongs_to :metatagable, :polymorphic => true
  #  translates :title, :keywords, :description
end
