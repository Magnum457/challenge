Rails.application.routes.draw do
  namespace 'api' do
  	namespace 'v1' do
      post '/orders/', to: 'orders#create'
      get '/orders/:id', to: 'orders#get_status'
      get '/orders/:purchase/:status', to: 'orders#list_order'
  	end
  end
end
