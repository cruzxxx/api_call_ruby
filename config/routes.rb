Rails.application.routes.draw do

  get "/athletes", to: "athlete#index"
  # to: point to the controller

end
