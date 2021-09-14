class IinesController < ApplicationController
  def create
    @iine = current_user.iines.create(item_id: params[:item_id])
    redirect_back(fallback_location: items_path)
  end

  def destroy
    @iine = Iine.find_by(item_id: params[:item_id], user_id: current_user.id)
    @iine.destroy
    redirect_back(fallback_location: items_path)
  end
end
