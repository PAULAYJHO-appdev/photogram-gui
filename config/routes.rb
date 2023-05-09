Rails.application.routes.draw do

root to: 'users#index'

#homepage
get("/", { :controller => "users", :action => "index"})

#users
get("/users", { :controller => "users", :action => "index"})
get("/users/:path_username", { :controller => "users", :action => "show"})
get("/insert_user_record", { :controller => "users", :action => "create"})
get("/delete_user/:toast_id", { :controller=> "users", :action =>"bye"})
get("/update_user/:modify_id", { :controller=> "users", :action =>"update"})

#photos
get("/photos", { :controller => "photos", :action => "index"})
get("/photos/:path_id", { :controller => "photos", :action => "show"})
get("/delete_photo/:path_id", { :controller => "photos", :action => "delete"})
get("/insert_photo", { :controller => "photos", :action => "create"})
get("update_photo/:modify_id", { :controller => "photos", :action => "update"})
#remember, it doesn't matter what you call ":path_id"

#comments
get("/update_photo/:modify_id", { :controller=> "photos", :action =>"update"})

end
