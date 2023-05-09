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

def create
  #Parameters: {"query_image"=>"http://www.something.com/media", "query_caption"=>"hello, it's me.", "query_owner_id"=>"117"}
  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")
  input_owner_id = params.fetch("query_owner_id")

  a_new_photo = Photo.new
  a_new_photo.image = input_image
  a_new_photo.caption = input_caption
  a_new_photo.owner_id = input_owner_id

  a_new_photo.save

  #render({ :template => "photo_templates/create.html.erb"})
  #instead of rendering, it might be more helpful to redirect.

  redirect_to("/photos/" + a_new_photo.id.to_s)
end

def update
#Parameters: {"query_image"=>"https://bradaronson.com/wp-content/uploads/2013/10/happy.jpg", "query_caption"=>"https://bradaronson.com/wp-content/uploads/2013/10/happy.jpg", "modify_id"=>"951"}

  the_id = params.fetch("modify_id")
  matching_photos = Photo.where({ :id => the_id })
  the_photo = matching_photos.first

  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")
  #input_owner_id = params.fetch("query_owner_id", false)
  #you don't want to list params unless they're coming up. Otherwise specify: if not here, then.
  
  the_photo.image = input_image
  the_photo.caption = input_caption

  the_photo.save
  #render({ :template => "photo_templates/update.html.erb"})
  redirect_to("/photos/" + the_photo.id.to_s)
end

def create_comment
  input_caption = params.fetch("input_body")
  input_owner_id = params.fetch("input_author_id")
  input_body = params.fetch("input_body")
 
  a_new_comment = Comment.new
  a_new_comment.author_id = input_owner_id
  a_new_comment.body = input_caption
 
  a_new_comment.save

  redirect_to ("/photos/"+a_new_comment.id.to_s)
end
end
