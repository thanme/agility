class Entry < ActiveRecord::Base
  
  has_one :event
  has_one :handler
  has_one :dog
  
  accepts_nested_attributes_for :handler, :dog
  
  validates :classes, :presence => true
  validate :check_classes
  
  
  
  def check_classes
    
    puts "Balls"
    errors[:entry] << "Nah it's broke hey"
    
  end
  
  
end
