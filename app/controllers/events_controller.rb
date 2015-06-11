class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  def enter
	@event = Event.find(params[:event])
	  
  end
  
  def do_entry
	@results = params
	
	
	@events = Array.new
	
	params.each do |k, e|

		case k
		when "agility"
			case e
			when "AD"
				@events.push("Novice Agility")
			when "ADX"
				@events.push("Excellent Agility")
			when "ADM"
				@events.push("Masters Agility")
			end
			
		when "jumping"
			case e
			when "JD"
				@events.push("Novice Jumping")
			when "JDX"
				@events.push("Excellent Jumping")
			when "JDM"
				@events.push("Masters Jumping")
			end
		
		when "open"
			e.each do |o, v|
				if v == "1" then
					case o
					when "ADO"
						@events.push("Open Agility")
					when "JDO"
					@events.push("Open Jumping")
					end
				end
			end
		
		when "snooker"
			case e
			when "SD"
				@events.push("Novice Snooker")
			when "SDX"
				@events.push("Excellent Snooker")
			when "SDM"
				@events.push("Masters Snooker")
			end
			
		when "gamblers"
			case e
			when "GD"
				@events.push("Novice Gamblers")
			when "GDX"
				@events.push("Excellent Gamblers")
			when "GDM"
				@events.push("Masters Gamblers")
			end
		end		
		
	end
			
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:hosting_club, :isAgility, :isJumping, :isADO, :isJDO, :isSnooker, :isGamblers, :isStratPairs, :trial_datetime, :notes)
    end
end
