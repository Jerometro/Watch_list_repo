class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id]) # necessaire pour rediriger le user vers la page list_path(@list)
    @bookmark.list = @list # necessaire pour creer le bookmark --> c'est le list_id

    if @bookmark.save
      redirect_to list_path(@list), notice: 'Votre bookmark a bien été ajouté !'
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(:bookmark_id)
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'Votre bookmark a bien été supprimé !'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
