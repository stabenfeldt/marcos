class Service < ActiveRecord::Base
  belongs_to :bike
  belongs_to :user
end
