class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  # GET /events
  def index
    @events = Event.all
    @upcoming_events = Event.upcoming_events
    @past_events = Event.past_events
  end

  # GET /events/1
  def show
    @event = Event.find(params[:id])
    @attendees = @event.invitations
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  def create
    @event = current_user.created_events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to current_user, notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /events/1
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }

      end
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :location, :date, :description)
  end
end
