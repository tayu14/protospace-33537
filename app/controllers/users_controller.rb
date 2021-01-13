class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    # 上のやつはマイページごとに表示を変えてくれる
    @user = User.find(params[:id])
    @prototypes = user.prototypes
  end
end
