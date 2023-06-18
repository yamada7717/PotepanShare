class ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations
  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
  end

  def edit
  end

  def create
    @room = Room.find(params[:reservation][:room_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.room = @room

    if @reservation.save
      flash[:notice] = "予約が完了しました。"
      redirect_to reservations_path
    else
      render :confirmation
    end

  end

  def confirmation
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.room = @room

    if @reservation.valid?
      render :new
    end
  end


  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to :reservations
  end

  private

  def reservation_params
    params.require(:reservation).permit(:room_id,:start_date, :end_date, :number_of_people)
  end
end
