class ActionsController < ApplicationController
  def index
    @actions = Action.page(params[:page]).per(10)

    render("action_templates/index.html.erb")
  end

  def show
    @development = Development.new
    @action = Action.find(params.fetch("id_to_display"))

    render("action_templates/show.html.erb")
  end

  def new_form
    @action = Action.new

    render("action_templates/new_form.html.erb")
  end

  def create_row
    @action = Action.new

    @action.action_type = params.fetch("action_type")

    if @action.valid?
      @action.save

      redirect_back(:fallback_location => "/actions", :notice => "Action created successfully.")
    else
      render("action_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @action = Action.find(params.fetch("prefill_with_id"))

    render("action_templates/edit_form.html.erb")
  end

  def update_row
    @action = Action.find(params.fetch("id_to_modify"))

    @action.action_type = params.fetch("action_type")

    if @action.valid?
      @action.save

      redirect_to("/actions/#{@action.id}", :notice => "Action updated successfully.")
    else
      render("action_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @action = Action.find(params.fetch("id_to_remove"))

    @action.destroy

    redirect_to("/actions", :notice => "Action deleted successfully.")
  end
end
