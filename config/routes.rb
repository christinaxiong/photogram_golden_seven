Rails.application.routes.draw do
  get("/photos/new", {:controller => "photos", :action => "new_form"})
  get("create_photo", {:controller => "photos", :action => "create_row"})
  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:da_id", {:controller => "photos", :action => "show"})
  get("/photos/:id/edit", {:controller => "photos", :action => "edit_form"})
  get("/update_photo/:id", {:controller => "photos", :action => "update_row"})
  get("/delete_photo/:id", {:controller => "photos", :action => "destroy_row"}) #when someone hits this URL, Rails is going to create a dictionary, params, where all of the tokens specified (:id) are keys that are mapped to the values passed in the URL and in the corresponding positions; Rails will then refer to the PhotosController class and action (implemented as a method) called on by this URL
end
