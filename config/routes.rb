Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
	root 'projects#index' #по умолчанию показывает индекс
  	resources :projects # имя контроллера
  	resources :tasks
end
