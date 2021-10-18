class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :motivate, only: [ :show, :edit, :update, :destroy]
  before_action :prohibition, only: [:edit, :update, :destroy]

  def index
    @events = Event.all.order("date", "start_at")
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
      if @event.save
        redirect_to event_path(@event.id), notice: "Now, you can plan the event !"
      else
        render :new
      end
  end

  def show
    @question = Question.new
    @questions = @event.questions.includes(:user)

    @like = Like.new
  end

  def edit 
  end


  def update 
    if @event.update(event_params)
      redirect_to event_path(@event.id)
    else
      render :edit
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path
    else
      render :show
    end
  end

  private

  def event_params
    params.require(:event).permit(:theme, :detail, :date, :start_at, :finish_at, :user).merge(user_id: current_user.id)
  end

  def motivate
    @event = Event.find(params[:id])
  end

  def prohibition
    redirect_to new_user_session_path unless current_user.id == @event.user_id 
  end
  
end
