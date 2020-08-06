class YarukotosController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_message, only: [:show, :edit, :update, :destroy]  
  
  def index
    @yarukotos = Yarukoto.order(id: :desc).page(params[:page]).per(10)
  end

  def show
  end

  def new
    @yarukoto = Yarukoto.new
  end

  def create
    @yarukoto = Yarukoto.new(message_params)

    if @yarukoto.save
      flash[:success] = 'やることが投稿されました'
      redirect_to @yarukoto
    else
      flash.now[:danger] = 'やることが投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update

    if @yarukoto.update(message_params)
      flash[:success] = 'やることが更新されました'
      redirect_to @yarukoto
    else
      flash.now[:danger] = 'やることが更新されませんでした'
      render :edit
    end
  end

  def destroy
    @yarukoto.destroy

    flash[:success] = 'やることが削除されました'
    redirect_to yarukotos_url
  end

  private
  
  def set_message
    @yarukoto = Yarukoto.find(params[:id])
  end  

  # Strong Parameter
  def message_params
    params.require(:yarukoto).permit(:content)
  end

end