class PredictionsController < ApplicationController
  def view_state
    render json: PredictionState.fetch(
      params.require(:user_id),
      params.require(:prediction_id)
    ).to_h
  end

  def create_state
    state = PredictionState.new
    state.user_id = params.require(:user_id)
    state.prediction_id = params.require(:prediction_id)
    state.steps_taken = params.require(:steps_taken)
    state.started_at = params.require(:started_at)
    state.time_to_exist = params.require(:time_to_exist).to_i.seconds.from_now.iso8601
    state.save
  end
end
