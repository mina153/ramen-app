class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :movement, only: [ :show, :edit, :update, :destroy]
  before_action :prohibit, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")

    @user = current_user
    @items = @user.items
    iines = Iine.where(user_id: @user.id).pluck(:item_id)  # ログイン中のユーザーのお気に入りのevent_idカラムを取得
    @iine_items = Item.find(iines)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @comment= Comment.new
    @comments = @item.comments.includes(:user)

    @iine = Iine.new
  end

  def edit 
  end


  def update 
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to sharings_path(current_user)
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :prefecture_id, :city, :user, :image).merge(user_id: current_user.id)
  end

  def movement 
    @item = Item.find(params[:id])
  end

  def prohibit
    redirect_to new_user_session_path unless current_user.id == @item.user_id 
  end

end
