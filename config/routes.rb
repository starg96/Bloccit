Bloccit::Application.routes.draw do
# get 'question/new'
# get 'question/edit'
# get 'question/index'
# get 'question/show'


	resources :question

	get 'about' => 'welcome#about'

	root to: 'welcome#index'
end
