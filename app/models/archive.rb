class Archive < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :name, :file_path

  mount_uploader :file_path, FileUploader
end
