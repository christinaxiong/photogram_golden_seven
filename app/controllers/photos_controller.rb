class PhotosController < ApplicationController

  def index
    @list_of_all_my_photos = Photo.all
    render("photos/index.html.erb")
  end

  def show
    the_id=params[:da_id]
    @my_photo = Photo.find(the_id)  #represents the row of the photo you want to display; @my_photo is an object; currently using a method action on a row object.
    render("photos/show.html.erb")
  end

  def new_form
    render("photos/new_form.html.erb")
  end

  def create_row
    url = params[:da_source]
    cap = params[:da_caption]
    @new_photo = Photo.new
    @new_photo.source= url
    @new_photo.caption = cap
    @new_photo.save
    #render("photos/create_row.html.erb") #render goes directly to view page
    #redirect_to("/photos/#{new_photo.id}")
    redirect_to("/photos")
  end

  def edit_form
    the_id=params[:id]
    @existing_photo = Photo.find(the_id)
    render("photos/edit_form.html.erb")
  end

  def update_row
    the_id=params[:id]
    @existing_photo = Photo.find(the_id)
    @existing_photo.caption = params[:da_caption]
    @existing_photo.source = params[:da_source]
    @existing_photo.save

    #render("photos/update_row.html.erb")
    redirect_to("/photos/#{the_id}")
  end

  def destroy_row
    the_id=params[:id]
    old_photo = Photo.find(the_id)
    old_photo.destroy
    old_photo.save
    #render("photos/destroy_row.html.erb")
    redirect_to("/photos")
  end
end
