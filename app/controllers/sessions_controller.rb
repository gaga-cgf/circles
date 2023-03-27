# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    
  end

  def create
    @user = User.authenticate(params[:username], params[:password])
    if @user
      signin_user(@user)
      # session[:user_id] = @user.id

      render json: {
        status: 'ok',
        msg: {
          redirect_url: root_path
        }
      }.to_json
    else
      render json: {
        status: 'error',
        msg: '用户名或密码不正确'
      }.to_json
      puts '没有用户'
    end
  end

  def destroy
    logout_user
    # session[:user_id] = nil
    flash[:notice] = '退出成功'
    redirect_to root_path
  end
end
