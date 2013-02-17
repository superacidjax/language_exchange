class PhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  #include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/assets/" + [version_name, "beagle.jpg"].compact.join('_')
  end

  version :small do
    process :resize_to_fill => [100, 100]
  end

  version :medium do
    process :resize_to_fill => [175, 175]
  end

  version :profile do
    process :resize_to_fill => [250, 250]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
