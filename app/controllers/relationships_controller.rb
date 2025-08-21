class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def create
    current_user.active_relationships.find_or_create_by!(following_id: @user.id)
    redirect_back fallback_location: @user
  end

  def destroy
    current_user.active_relationships.find_by!(following_id: @user.id).destroy
    redirect_back fallback_location: @user
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
