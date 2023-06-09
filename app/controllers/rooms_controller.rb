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
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:room_image,:room_name, :address, :room_detail, :price)
  end
end
