Rails.application.routes.draw do
  constraints(:id => /[^\/]+/) do
    resources :stacks
    resources :resources
    resources :instances
    resources :deployments
  end
end
