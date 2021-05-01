class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movies = @list.movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list), notice: 'Votre liste a bien été créée !'
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    @bookmarks.destroy
    @list.destroy
    redirect_to root_path, notice: 'Votre liste a bien été supprimée !'
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
