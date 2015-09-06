class League < ActiveRecord::Base
  belongs_to :nation
  has_many :clubs
end
