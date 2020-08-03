class YarukotosController < ApplicationController
  def index
    @yarukotos = Yarukoto.all
  end

  def show
    @yarukoto = Yarukoto.find(params[:id])
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
    @yarukoto = Yarukoto.find(params[:id])
  end

  def update
    @yarukoto = Yarukoto.find(params[:id])

    if @yarukoto.update(message_params)
      flash[:success] = 'やることが更新されました'
      redirect_to @yarukoto
    else
      flash.now[:danger] = 'やることが更新されませんでした'
      render :edit
    end
  end

  def destroy
    @yarukoto = Yarukoto.find(params[:id])
    @yarukoto.destroy

    flash[:success] = 'やることが削除されました'
    redirect_to yarukotos_url
  end

  private

  # Strong Parameter
  def message_params
    params.require(:yarukoto).permit(:content)
  end

end