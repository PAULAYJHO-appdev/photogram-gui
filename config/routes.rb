Rails.application.routes.draw do
#homepage
get("/", { :controller => "users", :action => "index"})

#users
get("/users", { :controller => "users", :action => "index"})
get("/users/:path_username", { :controller => "users", :action => "show"})

#photos
get("/photos", { :controller => "photos", :action => "index"})
end
