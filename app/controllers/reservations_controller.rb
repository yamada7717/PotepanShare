class ReservationsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
  end

  def edit
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to reservation_confirmation_path(@reservation)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end
end
