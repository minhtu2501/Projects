class PicturesController < ApplicationController

	def create
    params[:images].each{ |image|
    @picture = Picture.create(picture: picture)
      if @picture.save
        respond_to do |format|
          format.html { render json: @photo.to_jq_upload, content_type: 'text/html', layout: false }
          format.json { render json: @photo.to_jq_upload }
        end
      else
        render json: { error: @picture.errors.full_messages }, status: 304
      end
    }
	end
end
