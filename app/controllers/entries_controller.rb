class EntriesController < ApplicationController


  def new
    
    @event = Event.find(params[:event])
    @handler = Handler.new
    @dog = Dog.new
    @entry = Entry.new
      
  end
  
  
  
  def create
    @results = params
    
    
    #Validate the titles field
    @titles = params[:dog_titles]
    
    #render :action=>'new'
    
    
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
        e.each { |o, v|
          if v == "1" then
            case o
            when "ADO"
              @events.push("Open Agility")
            when "JDO"
              @events.push("Open Jumping")
            end
          end
       }
      
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
    
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to @entry, notice: 'Entry was successfully created.' 
    elsef
      @event = Event.find(params[:event])
      render :new, event: @event.id
    end

  end
  
  
  private
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:classes)
    end

end
