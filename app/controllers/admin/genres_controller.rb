class Admin::GenresController < ApplicationController
  def new
    @genre = Genre.new

  end

  def index
    @genres = Genre.all
    @genre = Genre.new
    # if @genres.is_active == true
    #    "有効"
    # else
    #   "無効"
    # end
  end

  def create
    @genre = Genre.new(genre_params)
    # @genre.admin_id = current_admin.id
    @genre.save
    redirect_back(fallback_location: root_path)
  end

  def edit
    @genre = Genre.find(params[:id])

  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  # 間違ったgenreを生成したときのために作成(ワークフレームには記述なし)
  # def delete
  #   @genre = Genre.find(params[:id])
  #   @genre.destroy
  #   redirect_back(fallback_location: root_path)
  # end

private
  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end
end
