class PlansController < ApplicationController
  before_action :authenticate_user!

    def index
    @user = current_user
    @events = @user.events
    likes = Like.where(user_id: @user.id).pluck(:event_id)  # ログイン中のユーザーのお気に入りのevent_idカラムを取得
    @like_posts = Event.find(likes)
  end

end
