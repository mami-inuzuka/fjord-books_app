# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show followings followers]
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show; end

  def followings; end

  def followers; end

  private

  def set_user
    @user = User.find(params[:user_id] || params[:id])
  end
end
