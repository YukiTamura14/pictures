class PicturesController < ApplicationController
  before_action :set_pic, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:destroy, :edit]

  def top
  end

  def index
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @picture = Picture.new(pic_params)
      @picture.image.retrieve_from_cache! pic_params[:image]
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = Picture.new(pic_params)
    @picture.user_id = current_user.id
    if @picture.invalid?
      render :new
     elsif params[:picture][:confirm].blank?
    # elsif params[:confirm].blank?
      render :confirm
    else
      @picture.save
      PicturesMailer.picture_mail(@picture).deliver
      redirect_to pictures_path, notice: "投稿されました！"
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id:@picture.id)
  end

  def edit
  end

  def update
    if @picture.update(pic_params)
      redirect_to pictures_path, notice: "更新されました！"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "削除されました！"
  end

  private

  def pic_params
    params.require(:picture).permit(:content, :image, :image_cache).merge(carriwave_cache_params)
  end

  def carriwave_cache_params
   params.require(:cache).permit(:image) if params[:cache]
  end

  def set_pic
    @picture = Picture.find(params[:id])
  end

  def set_user
    redirect_to pictures_path unless @picture.user_id == current_user.id
  end
end
