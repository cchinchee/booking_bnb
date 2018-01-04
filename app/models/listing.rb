class Listing < ApplicationRecord
	belongs_to :user
	enum status: { draft: 0, verified: 1}
	mount_uploaders :photos, PhotoUploader
end
