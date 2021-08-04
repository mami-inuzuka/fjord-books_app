# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :authenticate_user! がDeviseのコントローラを継承していると使えないため下記を記述
  prepend_before_action :authenticate_scope!, except: %i[new create]

  # GET /users
  def index
    @users = User.page(params[:page]).per(10)
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end

  # GET /mypage/edit
  def edit
    @user = current_user
  end
end
