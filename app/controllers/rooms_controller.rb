class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
      if @room.save
        redirect_to :rooms
      else
        flash[:notice] = "入力内容を確認してください"
        render :new
      end
  end

  def update
    @room = Room.find(params[:id])
    if @room = @room.update(room_params)
      redirect_to :rooms
    else
      flash[:notice] = "入力内容を確認してください"
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  def search
    if params[:area].present? && params[:query].present?
    # エリアとフリーワードの両方を検索する場合
    @rooms = Room.where("address LIKE :area OR room_name LIKE :query OR room_detail LIKE :query",area: "%#{params[:area]}%", query: "%#{params[:query]}%")
    elsif params[:area].present?
      # エリアのみを検索する場合
      @rooms = Room.where("address LIKE ?", "%#{params[:area]}%")
    elsif params[:query].present?
      # フリーワードのみを検索する場合
      @rooms = Room.where("room_name LIKE :query OR room_detail LIKE :query", query: "%#{params[:query]}%")
    else
        # エリアとフリーワードのどちらも指定されていない場合、全ての施設を表示
        @rooms = Room.all
    end
    @room_count = Room.count
  end

  private

  def room_params
    params.require(:room).permit(:room_image,:room_name, :address, :room_detail, :price)
  end
end
