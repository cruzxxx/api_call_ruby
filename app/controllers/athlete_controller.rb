class AthleteController < ApplicationController

  def index
    post_request = HTTParty.post(ENV['GET_TOKEN_URL'],
                                 :headers =>
                                     { 'Content-Type' => 'application/x-www-form-urlencoded',
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
    @athletes = get_data

    # get_data.each do |athlete|
    #   #byebug
    #   # @athletes = athlete['athlete']
    #   # @tests = athlete['test']
    #   # @summaries = athlete['summary']
    # end
  end

end
