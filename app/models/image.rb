# Class image of mongo
# Methos to prepare JSON to returning
class Image
  include Mongoid::Document

  field :file_name, type: String
  field :source, type: String

  embeds_many :image_versions

  def self.create_from_urls(urls, host)
    urls.each do |url|
      file_name = url[/([^\/]+)\/?$/, 1]

      image = build_image(file_name, url)  
    
      next if image.nil? 

      resizing(image, host)

      image.save
    end
  end

  def self.resizing(image, host)
    CONFIG['image_dimensions'].each do |size_name, dimensions|
      image_version = ImageVersion.create(
        image: image,
        alias: size_name,
        path: Rails.root.join(CONFIG['images_folder'], "#{size_name}_#{image.file_name}").to_s,
        url: "#{host}/#{size_name}_#{image.file_name}"
      )

      ImageEdit.resize_from_url(image.source, dimensions['height'], dimensions['width'], image_version.path)
    end
  end

  def self.all_json_formatted
    result = Hash.new
    self.all.each do |image|
      result[image.file_name] = {}
      image.image_versions.each do |image_version|
        result[image.file_name][image_version.alias] = image_version.url
      end
    end

    result.to_json
  end
  
  protected

  def self.build_image(file_name, url)
    return nil if where(file_name: file_name).exists?
    
    unless where(file_name: file_name).exists?
      return create(
          file_name: file_name,
          source: url
        )
    end
  end
end
