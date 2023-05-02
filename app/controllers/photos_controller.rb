class PhotosController< ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photo_templates/index"})
  end
  
  def show
    # Parameters: {"path_id"=>"777"}
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id})
    @the_photo = matching_photos.first
    #look in the "id" column for the variable "url_id"; go back and look up "url_id"
    render ({ :template => "photo_templates/show"})
  end

def delete
  #Parameters: {"path_id"=>"785"}
  the_id = params.fetch("path_id")
  matching_photos = Photo.where({ :id => the_id})
  the_photo = matching_photos.at(0)
  the_photo.destroy
  #render ({ :template => "photo_templates/delete.html.erb"})
  redirect_to("/photos")
end
end
