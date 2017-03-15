class Property < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :amenities
  has_many :shortlists, dependent: :destroy

  def self.search(search)
  where("address ILIKE ? OR property_type ILIKE ?", "%#{search}%", "%#{search}%")
  end

end
