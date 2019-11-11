class EventsController < ApplicationController

    def new
        @event=Event.new
    end

    def create
        @creator = User.find(session[:user_id])
        @event = @creator.events.build(event_params)
          if @event.save
            redirect_to users_path, notice: 'Event was successfully created.'
          else
            render :new
          end
      end


      private 

      def event_params
        params.require(:event).permit(:date, :description)

      end
end
