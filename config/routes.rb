Rails.application.routes.draw do
  get "/health_check" => "application#health_check"
  post "assertions/failures" => "assertions#failure_create"
end
