class SpeakersController < ApplicationController

	private
		def speaker_params
			params.require(:speaker).permit(:name, :bio, :moderator, :meeting_id,
																			:user_id)
		end
end