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
        render :new
      end
  end

  def update
    @room = Room.find(params[:id])
    if @room = @room.update(room_params)
      redirect_to :rooms
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  def search
    @query = params[:query]
    @results = Room.where("address LIKE :query", query: "%#{@query}%")
    @room_count = Room.count
  end

  private

  def room_params
    params.require(:room).permit(:room_image,:room_name, :address, :room_detail, :price)
  end
end
