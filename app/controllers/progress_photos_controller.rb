class ProgressPhotosController < ApplicationController
  before_action :current_user_must_be_progress_photo_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_progress_photo_user
    progress_photo = ProgressPhoto.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == progress_photo.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = ProgressPhoto.ransack(params[:q])
    @progress_photos = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)

    render("progress_photo_templates/index.html.erb")
  end

  def show
    @progress_photo = ProgressPhoto.find(params.fetch("id_to_display"))

    render("progress_photo_templates/show.html.erb")
  end

  def new_form
    @progress_photo = ProgressPhoto.new

    render("progress_photo_templates/new_form.html.erb")
  end

  def create_row
    @progress_photo = ProgressPhoto.new

    @progress_photo.user_id = params.fetch("user_id")
    @progress_photo.comment = params.fetch("comment")
    @progress_photo.picture = params.fetch("picture") if params.key?("picture")

    if @progress_photo.valid?
      @progress_photo.save

      redirect_back(:fallback_location => "/progress_photos", :notice => "Progress photo created successfully.")
    else
      render("progress_photo_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @progress_photo = ProgressPhoto.find(params.fetch("prefill_with_id"))

    render("progress_photo_templates/edit_form.html.erb")
  end

  def update_row
    @progress_photo = ProgressPhoto.find(params.fetch("id_to_modify"))

    
    @progress_photo.comment = params.fetch("comment")
    @progress_photo.picture = params.fetch("picture") if params.key?("picture")

    if @progress_photo.valid?
      @progress_photo.save

      redirect_to("/progress_photos/#{@progress_photo.id}", :notice => "Progress photo updated successfully.")
    else
      render("progress_photo_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @progress_photo = ProgressPhoto.find(params.fetch("id_to_remove"))

    @progress_photo.destroy

    redirect_to("/users/#{@progress_photo.user_id}", notice: "ProgressPhoto deleted successfully.")
  end

  def destroy_row
    @progress_photo = ProgressPhoto.find(params.fetch("id_to_remove"))

    @progress_photo.destroy

    redirect_to("/progress_photos", :notice => "Progress photo deleted successfully.")
  end
end
