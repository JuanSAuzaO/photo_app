class ImagesController < ApplicationController

  def index
    @images = current_user.images.all
  end

  def new
    @image = current_user.images.build
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user

    if @image.save
      flash[:success] = "Image uploaded!"
      redirect_to image_path(@image)
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  
  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:success] = "Image updated!"
      redirect_to images_path
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_path
  end

  def show
    @image = Image.find(params[:id])
  end

  private
    def image_params
      params.require(:image).permit(:name, :picture)
    end
  
end