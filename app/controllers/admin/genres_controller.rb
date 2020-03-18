class Admin::GenresController < ApplicationController
  def new
    @genre = Genre.new

  end

  def index
    genres = Genres.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.admin_id = current_user.id
    @genre.save
    redirect_back(fallback_location: root_path)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update
    redirect_to admin_genre_path
  end

  # 間違ったgenreを生成したときのために作成(ワークフレームには記述なし)
  # def delete
  #   @genre = Genre.find(params[:id])
  #   @genre.destroy
  #   redirect_back(fallback_location: root_path)
  # end

private
  def genre_params
    params_require(:genre).permit(:name, :is_active)
  end
end
