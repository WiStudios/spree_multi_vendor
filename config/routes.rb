Spree::Core::Engine.routes.draw do
  namespace :admin, path: "" do
    get 'profile' => 'vendor_settings#edit', constraints: {subdomain: ENV.fetch('VENDOR_SUBDOMAIN', 'authors')}
    patch 'profile' => 'vendor_settings#update', constraints: {subdomain: ENV.fetch('VENDOR_SUBDOMAIN', 'authors')}
  end 
  namespace :admin, path: Spree.admin_path do
    resources :vendors do
      collection do
        post :update_positions
      end
    end
    #get 'vendor_settings' => 'vendor_settings#edit'
    #patch 'vendor_settings' => 'vendor_settings#update'
  end
end
