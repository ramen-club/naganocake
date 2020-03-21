module Admin::ItemsHelper

    def top
    end

    def index
      @item = Item.all
    end

    def show
    end

    def new
    end

    def edit
    end

    def update
    end

    private
    def item_params
      params.require(:item).permit(:name, :description, :price, :image_id)
    end
end
