class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new

    if params[:flickr_id]
      begin
        @photos = flickr.people.getPublicPhotos(user_id: params[:flickr_id],
                                                api_key: ENV['FLICKR_API_KEY'])
      rescue StandardError => e
        flash.now[:alert] = "#{e.class}: #{e.message}. Please try again..."
        @photos = flickr.photos.getRecent(api_key: ENV['FLICKR_API_KEY'], per_page: 48)
      end
    else
      @photos = flickr.photos.getRecent(api_key: ENV['FLICKR_API_KEY'], per_page: 48)
    end
  end
end
