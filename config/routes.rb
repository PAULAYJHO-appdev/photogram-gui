Rails.application.routes.draw do
#homepage
get("/", { :controller => "users", :action => "index"})

#users
get("/users", { :controller => "users", :action => "index"})
get("/users/:path_username", { :controller => "users", :action => "show"})

#photos
get("/photos", { :controller => "photos", :action => "index"})
get("/photos/:path_id", { :controller => "photos", :action => "show"})
get("/delete_photo/:path_id", { :controller => "photos", :action => "delete"})
get("/insert_photo", { :controller => "photos", :action => "create"})
#remember, it doesn't matter what you call ":path_id"
end
