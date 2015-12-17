Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
  authenticated :user do
    root 'site#panelcontrol', as: :authenticated_root
  end

  unauthenticated do
    root 'site#home', as: :unauthenticated_root
  end
end


  get '/' => 'site#home'
  get '/contact' => 'site#contact'
  get '/panelcontrol' => 'site#panelcontrol'

  get '/cities/pointsofinterest' => 'point_of_interests#search'
  get '/pointsofinterest' => 'point_of_interests#index'

  resources :cities

end
