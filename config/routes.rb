Rails.application.routes.draw do
  match '*all', to: proc { [204, {}, ['']] }, via: :options
  get "/health_check" => "application#health_check"
  post "assertions/failures" => "assertions#failure_create"
end
