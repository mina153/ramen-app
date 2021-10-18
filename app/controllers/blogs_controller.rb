class BlogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @blogs = Blog.all.order("start_time")
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    @blog= Blog.new(blog_parameter)
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      redirect_to blogs_path, notice:"You can delete"
    else
      render :index
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      redirect_to blogs_path, notice: "You can update"
    else
      render 'edit'
    end
  end

  private

  def blog_parameter
    params.require(:blog).permit(:dairy, :content, :start_time)
  end

end
