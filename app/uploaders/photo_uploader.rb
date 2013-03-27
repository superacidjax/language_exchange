class PhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

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

  version :large do
    process :resize_to_limit => [600, 600]
  end

  version :profile do
    process :resize_to_fill => [250, 250]
  end

  def crop
    if model.crop_x.present?
      resize_to_limit(600, 600)
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop!(x, y, w, h)
      end
    end
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
