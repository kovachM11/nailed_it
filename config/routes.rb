Rails.application.routes.draw do
  root :to => "progress_photos#index"
  # Routes for the Action resource:

  # CREATE
  get("/actions/new", { :controller => "actions", :action => "new_form" })
  post("/create_action", { :controller => "actions", :action => "create_row" })

  # READ
  get("/actions", { :controller => "actions", :action => "index" })
  get("/actions/:id_to_display", { :controller => "actions", :action => "show" })

  # UPDATE
  get("/actions/:prefill_with_id/edit", { :controller => "actions", :action => "edit_form" })
  post("/update_action/:id_to_modify", { :controller => "actions", :action => "update_row" })

  # DELETE
  get("/delete_action/:id_to_remove", { :controller => "actions", :action => "destroy_row" })

  #------------------------------

  # Routes for the Development resource:

  # CREATE
  get("/developments/new", { :controller => "developments", :action => "new_form" })
  post("/create_development", { :controller => "developments", :action => "create_row" })

  # READ
  get("/developments", { :controller => "developments", :action => "index" })
  get("/developments/:id_to_display", { :controller => "developments", :action => "show" })

  # UPDATE
  get("/developments/:prefill_with_id/edit", { :controller => "developments", :action => "edit_form" })
  post("/update_development/:id_to_modify", { :controller => "developments", :action => "update_row" })

  # DELETE
  get("/delete_development/:id_to_remove", { :controller => "developments", :action => "destroy_row" })

  #------------------------------

  # Routes for the Progress photo resource:

  # CREATE
  get("/progress_photos/new", { :controller => "progress_photos", :action => "new_form" })
  post("/create_progress_photo", { :controller => "progress_photos", :action => "create_row" })

  # READ
  get("/progress_photos", { :controller => "progress_photos", :action => "index" })
  get("/progress_photos/:id_to_display", { :controller => "progress_photos", :action => "show" })

  # UPDATE
  get("/progress_photos/:prefill_with_id/edit", { :controller => "progress_photos", :action => "edit_form" })
  post("/update_progress_photo/:id_to_modify", { :controller => "progress_photos", :action => "update_row" })

  # DELETE
  get("/delete_progress_photo/:id_to_remove", { :controller => "progress_photos", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
