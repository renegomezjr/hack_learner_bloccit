class Rate < ActiveRecord::Base
  belongs_to :ratable, polymorphic: true
  belongs_to :rating 
end
