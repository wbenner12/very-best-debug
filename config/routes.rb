Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "home" })
  get("/users", { :controller => "users", :action => "all_users" })
  get("/users/:username", { :controller => "users", :action => "show" })
  get("/insert_user_record", { :controller => "users", :action => "create" })
  post("/update_user/:user_id", { :controller => "users", :action => "update" })

  get("/venues", { :controller => "venues", :action => "index" })
  get("/venues/:venue_id", { :controller => "venues", :action => "show" })
  get("/delete_venue/:delete_id", { :controller => "venues", :action => "destroy" })
  get("/insert_venue_record", { :controller => "venues", :action => "create" })
  get("/update_venue/:the_id", { :controller => "venues", :action => "update" })
  
  
  get("/insert_comment_record", { :controller => "comments", :action => "create" })
end
