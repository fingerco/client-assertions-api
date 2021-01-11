class AssertionsController < ApplicationController
  def failure_create
    failure = AssertionFailure.new
    failure.id = params.require(:id)
    failure.failed_at = params.require(:failed_at)
    failure.assertion_name = params.require(:assertion_name)
    failure.user_id = params.require(:user_id)
    failure.save

    head :created
  end
end
