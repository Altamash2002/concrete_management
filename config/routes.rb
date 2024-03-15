Rails.application.routes.draw do
  # resources :strength_testings do
  #   collection do
  #     # post :index
  #   end
  # end

  resources :strength_testings do
    member do
      post 'send_email'
    end
  end
       
  post '/zone/send_red_values_email', to: 'zone#send_red_values_email', as: 'send_red_values_email_zone'
  post '/zone/send_grey_values_email', to: 'zone#send_grey_values_email', as: 'send_grey_values_email_zone'


  get '/failed_status', to: "strength_testings#failed_status"
  get '/building_name', to: "strength_testings#building_name"
  get '/last_30_days', to: "strength_testings#last_30_days"
  get '/daily_testing', to: "strength_testings#daily_testing"
  get '/daily_testing/:id/edit', to: 'strength_testings#edit_daily_testing', as: 'edit_daily_testing'
  get '/daily_testing/:id/edit_testing_results/:day', to: 'testing_results#edit_testing_results', as: 'edit_testing_results'
  post '/daily_testing/:id/show_more', to: 'strength_testings#show_testing_results', as: 'show_more'

  # filter paths
  post '/daily_testing/filter', to: "strength_testings#daily_testing"
  post '/strength_testings/filter', to: "strength_testings#get_strength_filter"
  post '/comparison/filter', to: "comparison#cement"
  post '/comparison/flyash/filter', to: "comparison#flyash"
  post '/comparison/micro_silica/filter', to: "comparison#micro_silica"
  post '/comparison/rmc_concrete/filter', to: "comparison#rmc_concrete"
  post '/comparison/superplasticizer/filter', to: "comparison#superplasticizer"
  post '/overall_failure_report/filter', to: "overall_failure_report#overall"
  post '/standard_deviation/standard/filter', to: "standard_deviation#standard_get_filter"
  post '/mastergraph/filter', to: "landing#mastergraph"
  post '/last_30_days/filter', to: "strength_testings#last_30_days"
  post '/failed_status/filter', to: "strength_testings#failed_status"


  get 'concrete/concrete_strength_record', to: 'concrete#concrete_strength_record'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'landing#masterview'
  get '/coming_soon', to: 'landing#index'
  get '/mastergraph', to: 'landing#mastergraph' 
  get '/masterview', to: 'landing#masterview'
  get '/compressive', to: 'landing#compressive'
  get '/concrete_strength_filter', to: 'landing#concrete_strength_filter'

  # comparison routes
  get '/comparison/flyash', to: 'comparison#flyash'
  get '/comparison/micro_silica', to: 'comparison#micro_silica'
  get '/comparison/superplasticizer', to: 'comparison#superplasticizer'
  get '/comparison/rmc_concrete', to: 'comparison#rmc_concrete'
  get '/standard_deviation/grade/:building_id', to: 'standard_deviation#grade', as: :standard_deviation_grade
  get '/standard_deviation/standard', to: 'standard_deviation#standard', as: :standard_deviation_standard

  # routes for comparsion filter
  # post '/comparison/filter', to: "comparison#cement"

  # zone routes
  get '/zone/red', to: 'zone#red'
  get '/zone/grey', to: 'zone#grey'
  get '/zone/green', to: 'zone#green'
  post '/send_selected_data_email', to: 'zone#send_selected_data_email', as: 'send_selected_data_email'

  #strength graph
  get '/strength_graph/structure', to: 'strength_graph#structure'
  get '/strength_graph/grade', to: 'strength_graph#grade'

  get '/comparison/structure', to: 'comparison#structure'
  get '/comparison/grade', to: 'comparison#grade'
  get '/comparison/building', to: 'comparison#building'
  get '/comparison/compare', to: 'comparison#compare'
  get '/drildown_strength_testing/project', to: 'drildown_strength_testing#project'
  get '/drildown_strength_testing/building', to: 'drildown_strength_testing#building'
  get '/drildown_strength_testing/grade', to: 'drildown_strength_testing#grade'
  get '/bmc_tmc_report', to: 'strength_testings#bmc_tmc_report'

  #strength testing graph
  resources :strength_graph do
    member do
      get 'index'
    end
  end

  #profile page route
  get '/profile', to: 'profile#index'

  resources :drildown_strength_testing do
    member do 
      get 'index'
     end
  end

  resources :standard_deviation do
    member do
      get 'index'
    end
  end

  # route for edit form view table
  resources :concrete do
    member do
      get 'edit'
    end
  end

  resources :comparison do
    member do
      get 'comparison'
    end
  end

  resources :zone do
    member do
      get 'zone'
    end
  end
  resources :zone do
    collection do
      get 'red'
      post 'send_red_values_email' # Make sure it's defined as a POST request
      post 'send_grey_values_email'
    end
  end

  resources :overall_failure_report do
    member do
      get 'overall_failure_report'
    end
  end

  
  delete 'strength_testings/:id', to: "strength_testings#destroy"


  # routes for new 
  resources :concrete do
    collection do
      get 'new'
    end
  end
  resources :testing_results do
    collection do
      get 'all_testing_results'
    end
  end

end
