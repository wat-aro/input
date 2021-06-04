class Repositories::PullRequests::ReviewsController < ApplicationController
  def create
    owner = User.find_by!(name: params[:owner_name])
    repository = owner.repositories.find_by!(name: params[:repository_name])
    pull_request = repository.pull_requests.find_by!(number: params[:pull_number])
    input = ReviewInput.new(review_params)

    Review::Create.new(pull_request).call(input)
    head :ok
  rescue ActiveRecord::RecordInvalid, InputInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  private

  def review_params
    params.permit(
      :commit_id,
      :body,
      :event,
      comments: %i[
        path
        position
        body
        line
        side
        start_line
        start_side
      ]
    )
  end
end
