class PostsController < ApplicationController
  before_filter :require_current_user!, :only => [:new, :create]
  
  def index
    @posts = Post.all
    respond_to do |format|
      format.json { render "index.rabl" }
    end
  end

  def new
    @post = Post.new()
    render :json => @post
  end
  
  def create
    @post = Post.new(params[:post])
    @post.submitter_id = current_user.id
    if @post.save
      render "create.rabl"
    else
      render :new
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
    render :show
  end
  
  def update
    @post = Post.find_by_id(params[:id])
    if current_user.id == @post.submitter_id
      @post.update_attributes!(params[:post])
    end
    render "create.rabl"
  end
  
  def destroy
    @post = Post.find_by_id(params[:id])
    if current_user.id == @post.submitter_id
      @post.destroy
    end
    render :json => @post
  end
  
end
