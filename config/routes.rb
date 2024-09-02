Rails.application.routes.draw do
  root 'root#index'

  get '/*anyPath', to: 'root#index', anyPath: /(?!api).*/
end
