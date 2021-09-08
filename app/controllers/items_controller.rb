class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :movement, only: [ :show, :edit, :update, :destroy]
  before_action :prohibit, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
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

    # @user = current_user
    # @events = @user.events
    # participations = Participation.where(user_id: current_user.id).pluck(:event_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    # @participation_list = Participation.find(participations)     # postsテーブルから、お気に入り登録済みのレコードを取得
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
      redirect_to items_path(current_user)
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
