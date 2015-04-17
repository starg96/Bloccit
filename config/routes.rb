Bloccit::Application.routes.draw do
#  get 'advertisment/index'
#  get 'advertisment/show'
#  get 'index/show'

	resources :advertisment

	get 'about' => 'welcome#about'

	root to: 'welcome#index'
end
