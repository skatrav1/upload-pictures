# frozen_string_literal: true

# The controller to maintain photo details  and other CRUD operations

class PhotosController < ApplicationController
  load_and_authorize_resource except: :create
  before_action :authenticate_user!, except: %i[index show]
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photos_params)
    authorize! :create, @photo
    if @photo.save
      redirect_to @photo
    else
      logger.debug @photo.errors.full_messages
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photos_params)
      redirect_to @photo, notice: 'Cat photo updated successfully!'
    else
      logger.debug @photo.errors.full_messages.to_sentence
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path
  end

  def show
    @photo = Photo.find(params[:id])
    return unless @photo.nil?

    redirect_to photos_path, alert: 'Photo not found.'
  end

  private

  def photos_params
    params.require(:photo).permit(:title, :description, :image)
  end
end
