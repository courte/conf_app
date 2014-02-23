class SpeakersController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
	
	def index
		@speakers = Speaker.page(params[:page])
	end

	def create
		@meeting = Meeting.find(params[:meeting_id])
		@speaker = Speaker.new(speaker_params)
		if @speaker.save
			@speaker.schedule!(@meeting)
			flash[:success] = "Speaker saved!"
			redirect_to @meeting
		else
			redirect_to @meeting
		end
	end

	def destroy
	end

	private

	def speaker_params
		params.require(:speaker).permit(:name, :bio, :moderator, :user_id)
	end

end