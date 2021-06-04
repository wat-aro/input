Rails.application.routes.draw do
  defaults format: :json do
    post '/repos/:owner_name/:repository_name/pulls/:pull_number/reviews', to: 'repositories/pull_requests/reviews#create'
  end
end
