class Admin::ItemsController < ApplicationController
    def index
        @item = Item.new
    end

    def new
        @item = Item.new
    end

    def edit

    end

    def create
         item = Item.new(item_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
         item.save
    # 4. トップ画面へリダイレクト
         redirect_to '/admin'
    end



    def show

    end

    def update


    end

    private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :genre_id,:is_active)
  end
end
