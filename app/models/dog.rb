class Dog < ActiveRecord::Base
  
  belongs_to :handler
  
  validate :check_titles
  validates_presence_of :name, :reg, :height
  validates_numericality_of :height, :message => " must be numeric"
  validates_uniqueness_of :reg, :message => "Dog already exists"
  
  
  
  
  def check_titles
    
    #Ensure titles field is alphanumeric
    #NEED PROVISION FOR SPACE
    if ((titles =~ /\A\p{Alnum}+\z/).nil? && titles != "")
      errors.add(:titles, " are invalid. Please ensure you have entered them correctly (e.g. AD ADX)")  
    end
     
    
  end
  
  
end
