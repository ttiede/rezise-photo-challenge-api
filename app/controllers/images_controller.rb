# Controller to return calling points of images

class ImagesController < ApplicationController
  def show
    render json: Image.all_json_formatted
  end

  def populate
    image_service = ImagesWebService.new(CONFIG['images_web_service_url'])

    Image.create_from_urls(image_service.photos_urls, request.base_url)
    render json: 'The system is running a assync process, it may take a while to generate all the photos.', status: 200
  end
end
