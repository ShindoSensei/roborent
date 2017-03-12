class Property < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :amenities
  has_many :shortlists
  # set_table_name "properties"
end
