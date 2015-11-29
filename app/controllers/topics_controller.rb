class TopicsController < ApplicationController

  before_action :require_sign_in, except: [:index, :show]
  before_action :only_mods_admins, only: [:edit, :update]
  before_action :admin_user, only: [:new, :create, :destroy]


  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)

    if @topic.save
      flash[:notice] = "Topic was updated!"
      redirect_to @topic
    else
      flash[:error] = "Error saving topic. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash[:error] = "There was a problem deleting your post. Please try again."
      render :show
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end

  def admin_user
    unless current_user.admin?
      flash[:error] = "You must be an admin to do that."
      redirect_to topics_path
    end
  end

  def only_mods_admins
    unless current_user.moderator? || current_user.admin?
      redirect_to topics_path
    end
  end
end
