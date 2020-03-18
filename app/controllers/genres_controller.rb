class GenresController < ApplicationController
  def index
    genres = Genres.all
  end

  def create
    @genre = Genre.new(genr_params)
    @genre.admin_id = current_user.id
    @genre.save
    redirect_back(fallback_location: root_path)
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(pames[:id])
    @genre.update
    redirect_to パス指定（routesが出来次第追加）
  end

private
  def genr_params
    params_require(:genr).permit(:name, :is_active)
  end


  
end
