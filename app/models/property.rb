class Property < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :amenities
  has_many :shortlists, dependent: :destroy
  validates :address, presence: true
  validates :postcode, length: { is: 6 }, format: { with: /\d{6}/, message: "Please enter 6 digit postal code" }
  validates :price, length: { maximum: 8, message: "Too expensive, no one would rent" }, numericality: true
  validates :lease_durn, length: { maximum: 3, message: "Too expensive, no one would rent" }, numericality: true
  geocoded_by :address #added for rubygeocoder API
  after_validation :geocode #added for rubygeocoder API

  def self.search(search)
  where("address ILIKE ? OR property_type ILIKE ?", "%#{search}%", "%#{search}%")
  end

end
