Rails.application.routes.draw do
#homepage
get("/", { :controller => "users", :action => "index"})

#users
get("/users", { :controller => "users", :action => "index"})

#photos
get("/photos", { :controller => "photos", :action => "index"})
end
