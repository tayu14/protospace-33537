class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index,]


  def index
    @prototype = Prototype.all
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment   = Comment.new
    @comments  = Comment.all
  end

  def edit
    prototype = Prototype.find(params[:id])
    unless user_signed_in? && current_user.id == prototype.user_id
      redirect_to action: :index
    end
    @prototype = Prototype.find(params[:id])
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit
    end
    # prototype = Prototype.find(params[:id])
    # prototype.update(prototype_params)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    # prototypes.create(prototype_params)
    @prototype = Prototype.new(prototype_params)
    # 上のprototype_paramsはビューの_formのこと
    if @prototype.save
      redirect_to root_path
    else
      render :new
      # 上のnewはビューのnew.html.erbのこと
    end
  end

  private
  def prototype_params
  params.require(:prototype).permit(:title,:catch_copy,:concept,:image,).merge(user_id: current_user.id)
  end

  # def authenticate_user!
    # unless user_signed_in?
      # redirect_to action: :index
    # end
  # end
end
