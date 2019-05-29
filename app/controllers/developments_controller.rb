class DevelopmentsController < ApplicationController
  def index
    @q = Development.ransack(params[:q])
    @developments = @q.result(:distinct => true).includes(:user, :action).page(params[:page]).per(10)

    render("development_templates/index.html.erb")
  end

  def show
    @development = Development.find(params.fetch("id_to_display"))

    render("development_templates/show.html.erb")
  end

  def new_form
    @development = Development.new

    render("development_templates/new_form.html.erb")
  end

  def create_row
    @development = Development.new

    @development.user_id = params.fetch("user_id")
    @development.trigger = params.fetch("trigger")
    @development.action_id = params.fetch("action_id")

    if @development.valid?
      @development.save

      redirect_back(:fallback_location => "/developments", :notice => "Development created successfully.")
    else
      render("development_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_action
    @development = Development.new

    @development.user_id = params.fetch("user_id")
    @development.trigger = params.fetch("trigger")
    @development.action_id = params.fetch("action_id")

    if @development.valid?
      @development.save

      redirect_to("/actions/#{@development.action_id}", notice: "Development created successfully.")
    else
      render("development_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @development = Development.find(params.fetch("prefill_with_id"))

    render("development_templates/edit_form.html.erb")
  end

  def update_row
    @development = Development.find(params.fetch("id_to_modify"))

    @development.user_id = params.fetch("user_id")
    @development.trigger = params.fetch("trigger")
    @development.action_id = params.fetch("action_id")

    if @development.valid?
      @development.save

      redirect_to("/developments/#{@development.id}", :notice => "Development updated successfully.")
    else
      render("development_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @development = Development.find(params.fetch("id_to_remove"))

    @development.destroy

    redirect_to("/users/#{@development.user_id}", notice: "Development deleted successfully.")
  end

  def destroy_row_from_action
    @development = Development.find(params.fetch("id_to_remove"))

    @development.destroy

    redirect_to("/actions/#{@development.action_id}", notice: "Development deleted successfully.")
  end

  def destroy_row
    @development = Development.find(params.fetch("id_to_remove"))

    @development.destroy

    redirect_to("/developments", :notice => "Development deleted successfully.")
  end
end
