class ImageUploader < CarrierWave::Uploader::Base
  storage :file if Rails.env.development? || Rails.env.test?
  storage :fog if Rails.env.production?

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
