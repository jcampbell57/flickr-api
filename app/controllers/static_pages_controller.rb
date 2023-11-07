class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new

    @photos = if params[:flickr_id]
                flickr.people.getPublicPhotos(user_id: params[:flickr_id], api_key: ENV['FLICKR_API_KEY'])
              else
                @photos = flickr.photos.getRecent(api_key: ENV['FLICKR_API_KEY'], per_page: 48)
              end
  end
end
