class Admin::ItemsController < ApplicationController
    def index
        @items = Item.all

    end

    def new
        @item = Item.new
    end

    def edit
         @item = Item.find(params[:id])

    end

    def create
         item = Item.new(item_params)
         item.save
    # 4. トップ画面へリダイレクト
         redirect_to '/admin'
    end



    def show
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        redirect_to admin_item_path
    end

    private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :genre_id,:is_active)
  end
end
