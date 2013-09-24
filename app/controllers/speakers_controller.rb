class SpeakersController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
	
	def index
		@speakers = Speaker.page(params[:page])
	end

	def create
		# @speaker = meeting[:id].speaker
		#if @speaker.save
			# flash[:success] = "Speaker saved!"
			# redirect_to root_url
		# else
			# render 'static_pages/home'
		# end
	end

	def destroy
	end

	private
		def speaker_params
			params.require(:speaker).permit(:name, :bio, :moderator, :meeting_id,
																			:user_id)
		end
end