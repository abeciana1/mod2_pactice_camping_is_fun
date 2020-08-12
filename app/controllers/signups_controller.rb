class SignupsController < ApplicationController
    before_action :find_signup, only: [:show]
    
    def index
        @signups = Signup.all
    end
    
    def new
        @signup = Signup.new

        @campers = Camper.all
        @activities = Activity.all
    end
    
    def show
    end
    
    def create
        @signup = Signup.create(signup_params)
        if @signup.valid?
            redirect_to camper_path(@signup.camper)
        else
            flash[:my_errors] = @signup.errors.full_messages
            redirect_to new_signup_path
        end
    end

    
    private
        
    def find_signup
        @signup = Signup.find(params[:id])
    end
    
    def signup_params
        params.require(:signup).permit(:camper_id, :activity_id, :time)
    end
    
    

end
