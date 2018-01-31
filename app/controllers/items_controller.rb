class ItemsController < ApplicationController
  before_action :authenticate_admin!, except:[:index]

  def index
    @q = Item.search(params[:q])
    # @items = @q.result(distinct: true)
    @items = Item.all
    # Rails.logger.info(@items.first.category_id)
  end

  def new
    @disc_count = DiscCount.find(1)
    @disc_count.count = 1
    @disc_count.save
    @song_count = SongCount.find(196)#<=これは試行錯誤した回数です。データによって違うので、最初にコンソールで作ったIDを入れてください
    @song_count.count = 1
    @song_count.save
  	@item = Item.new
    @disc_count.count.times{
      @disc = @item.discs.build
      @song_count.count.times{@disc.songs.build}
    }
  end

  def add_disc
    @song_count = SongCount.find(196)#<=これは試行錯誤した回数です。データによって違うので、最初にコンソールで作ったIDを入れてください
    @disc_count = DiscCount.find(1)
    @disc_count.count += 1
    @disc_count.save
    @item = Item.new
    @disc_count.count.times{
      @disc = @item.discs.build
      @song_count.count.times{@disc.songs.build}
    }
    render :new
  end

  def add_song
    @song_count = SongCount.find(196)#<=これは試行錯誤した回数です。データによって違うので、最初にコンソールで作ったIDを入れてください
    @disc_count = DiscCount.find(1)
    @item = Item.new
    @song_count.count += 1
    @song_count.save
    @disc_count.count.times{
      @disc = @item.discs.build
      @song_count.count.times{@disc.songs.build}
    }
    render :new
  end

  def create
  	@item = Item.new(item_params)
    if @item.save
    redirect_to ("/")
  else
    render ("items/new")
  end
  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @disc = @item.discs
    @item.update(item_params)
    redirect_to ("/")
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.delete
      flash[:notice] = "削除しました。"
      redirect_to("/items")
    end
  end

  private

    def song_count_params
      params.require(:song_count).permit(:count)
    end
    def item_params
        params.require(:item).permit(
          :artist_name,
          :item_name,
          :image,
          :price,
          :label_name,
          :stock,
          :category_id,
          :release_date,
            discs_attributes: [
              :id,
              :disc_name,
              songs_attributes: [
                :id,
                :number,
                :song_name
              ]
            ]
          )
        #Rails.logger.info(params[:item][:discs_attributes].count)
    end
end
