class Player < ActiveRecord::Base
  belongs_to :nation
  belongs_to :league
  belongs_to :club
end
