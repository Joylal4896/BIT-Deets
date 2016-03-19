class Post < ActiveRecord::Base

	mount_uploader :image1, ImageUploader
	mount_uploader :image2, Image23Uploader
	mount_uploader :image3, Image23Uploader
	mount_uploader :video1, VideoUploader
	mount_uploader :video2, VideoUploader
	mount_uploader :file1, FileUploader
	mount_uploader :file2, FileUploader
	mount_uploader :file3, FileUploader
	
end
