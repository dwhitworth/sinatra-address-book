require 'sinatra/base'
require 'slim'

class AddressBook < Sinatra::Base
  get '/' do
    slim :home
  end

  get '/photos' do
    slim :photos
  end

  post '/photos' do
    if params[:photo].nil?
      redirect '/photos'
      return
    end
    filename = File.join(settings.root, 'files', params[:photo][:filename])
    File.open(filename, 'w') do |file|
      file.write params[:photo][:tempfile].read
    end
    "OK, photo saved"
  end
end
