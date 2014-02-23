class SpeakersController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
	
	def index
		@speakers = Speaker.page(params[:page])
	end

	def create
		@meeting = Meeting.find(speaker_params[:meeting_id])
		@speaker = @meeting.speakers.build(speaker_params)
		@speaker.engagements.build(:meeting_id => @meeting.id)
		if @speaker.save
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
			params.require(:speaker).permit(:name, :bio, :moderator, :meeting_id,
																			:user_id)
		end
end