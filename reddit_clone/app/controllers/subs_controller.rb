class SubsController < ApplicationController
  before_action :require_login
  
  def self.require_moderator
    current_sub = Sub.find(params[:id])
    redirect_to sub_url(current_sub) unless current_user.id == current_sub.moderator_id
  end
  
  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  def edit
    # SubsController.require_moderator
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to edit_sub_url
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end
  
  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
