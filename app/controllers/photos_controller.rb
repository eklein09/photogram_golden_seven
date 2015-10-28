class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    #@current_photo = Photo.find_by({ :id => params[:id] })
    @current_photo  = photo_lookup(params[:id])
    render("show.html.erb")
  end

  def new_form
    render("new_form.html.erb")
  end

  def create_row
    new_photo = Photo.new
    new_photo.caption = params[:the_caption]
    new_photo.source = params[:the_source]
    new_photo.save
    redirect_to("http://localhost:3000/photos")
  end

  def destroy
    @current_photo  = photo_lookup(params[:id])
    @current_photo.destroy
    redirect_to("http://localhost:3000/photos")
  end

  def edit_form
    @current_photo  = photo_lookup(params[:id])
    render("edit_form.html.erb")
  end

  def photo_lookup(id)
    return Photo.find_by({ :id => id })
  end

  def update_row
      @current_photo  = photo_lookup(params[:id])
      @current_photo.caption  = params[ :the_caption  ]
      @current_photo.source  = params[ :the_source
      @current_photo.save ]
    end
  end
