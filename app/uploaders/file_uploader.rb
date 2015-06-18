class FileUploader < CarrierWave::Uploader::Base
  storage :file

   def store_dir
    'uploads'
  end

   def extension_white_list
    %w(jpg jpeg gif png pdf doc docx xls xlsx cad)
  end
end