class Listing < ApplicationRecord
	belongs_to :user
	enum status: { draft: 0, verified: 1}
	serialize :photos, Array
	mount_uploaders :photos, PhotoUploader
	has_many :reservations, dependent: :destroy
end

#validates :photos, presences:true