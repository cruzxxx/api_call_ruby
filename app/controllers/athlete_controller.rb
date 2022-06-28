class AthleteController < ApplicationController

  def index
    post_request = HTTParty.post(ENV['GET_TOKEN_URL'],
                                 :headers =>
                                     {'Content-Type' => 'application/x-www-form-urlencoded',
                                     },
                                 :body => {
                                     'client_id' => ENV['CLIENT_ID'],
                                     'client_secret' => ENV['CLIENT_SECRET'],
                                     'grant_type' => 'client_credentials',
                                     'audience' => ENV['AUDIENCE']
                                 })

    api_key = post_request['access_token']

    get_data = HTTParty.get(ENV['GET_DATA_URL'],
                            :headers => {
                                "Content-Type" => "application/json",
                                "Authorization" => "Bearer #{api_key}"
                            })

    @all_data = get_data

    athletes = []
    # Iterate through data returned from API
    get_data.each do |athlete|
      sum = 0
      count = 0
      # Iterate through summary to calculate average values
      athlete['summary'].each do |metric|
        count += 1
        sum = sum + metric['value']
      end
      average = sum / count
      athletes_data = {'athlete': athlete['athlete'],
                         'test': athlete['test'],
                         'average': average}
      athletes.append(athletes_data)
    end
    @athletes = athletes
  end
end
