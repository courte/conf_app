class MeetingsController < ApplicationController
	before_filter :admin_user, only: [:new, :create, :edit, :update, :destroy]

	def index
		@meetings = Meeting.order('start_time ASC, duration DESC').page(params[:page]).per_page(10)
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
		@speakers = @meeting.speakers
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
		Meeting.find(params[:id]).destroy
    flash[:success] = "Meeting deleted."
    redirect_to meetings_url
	end

	private
		def meeting_params
			params.require(:meeting).permit(:title, :location, :start_time,
																			:end_time, :description)
		end
end
