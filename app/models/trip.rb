class Trip < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :trip_name
end
