Rails.application.routes.draw do
  get "/health_check" => "application#health_check"
end
