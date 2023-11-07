class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new
    return unless params[:flickr_id]

    @photos = flickr.people.getPublicPhotos(user_id: params[:flickr_id], api_key: ENV['FLICKR_API_KEY'])
  end
end
