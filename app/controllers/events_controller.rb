class EventsController < ApplicationController
	before_action :authenticate_user!

  def index
    load_events
  end

  def show
    load_event
  end

  def new
    build_event
  end

  def edit
  	load_event
  end

  def create
    build_event
    save_event or render 'new'
  end

  def update
    load_event
    update_event or render 'edit'
  end

  def destroy
    load_event
    @event.destroy
    redirect_to events_path
  end

  def toggle_approve
    load_event
    new_state = !@event.is_approved
    @event.update(is_approved: new_state)
    redirect_to event_path(@event)
  end

  private

  	def load_events
  		@event_groups = policy_scope(Event).order(start_time: :asc).group_by_day(time_zone: "Sydney") { |e| e.start_time }
  		@unapproved_events = policy_scope(Event).order(created_at: :desc).where(is_approved: false)
  	end

  	def load_event
  		@event = Event.find(params[:id])
    	authorize @event
  	end

  	def build_event
			@event = Event.new(event_params)
      authorize @event
		end

		def save_event
			if @event.save
				redirect_to events_path
			end
		end

		def update_event
	    if @event.update(event_params)
				redirect_to event_path(@event)
			end
		end

		def event_params
    	event_params = params[:event]
    	event_params ? event_params.permit(:title, :itemised_budget, :runsheet, :start_time, :budget_total, :is_approved, :feedback, :expected_turnout, :user_id, :location) : {}
    end
end
