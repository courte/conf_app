class MeetingsController < ApplicationController
	def index
	end

	def new
		@meeting = Meeting.new
	end

	def create
		@meeting = Meeting.new(meeting_params)
		if @meeting.save
  		flash[:success] = "Your event has been created."
  		redirect_to @meeting
  	else
  		render 'edit'
  	end
	end

	def show
		@meeting = Meeting.find(params[:id])
	end

	def edit
		@meeting = Meeting.find(params[:id])
	end

	def update
		@meeting = Meeting.find(params[:id])
		if @meeting.update_attributes(meeting_params)
      flash[:success] = "Meeting updated"
      redirect_to @meeting
    else
      render 'edit'
    end
	end

	def destroy
	end

	private
		def meeting_params
			params.require(:meeting).permit(:title, :location, :start_time,
																			:end_time, :description)
		end
end
