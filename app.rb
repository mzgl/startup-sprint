require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    @error = params['error']
    erb :home
  end

  post '/subscribe' do
    @full_name = params[:full_name]
    @email = params[:email]
    @city = params[:city]

    if !@email.match(/.+@.+/)
      redirect to('/?error=email')
    end

    erb :subscribe
  end

  get '/reddit' do

    require 'httparty'

    url = 'http://reddit.com/.json'
    response = HTTParty.get(url)
    parsed = response.parsed_response
    @listings = Array.new

    for x in 1..24
      title = parsed['data']['children'][x]['data']['title']
      puts x
      puts @listings
      @listings.push(title)
    end

    @listings

    erb :reddit
  end

  get '/schedule' do
    @today = [
      ['7:00am', 'Wake up'],
      ['8:00am', 'Work Out'],
      ['9:00am', 'Product Meeting'],
      ['11:00am', 'Ping Pong Break'],
      ['1:00pm', 'Lunch'],
      ['3:00pm', 'Coffee Time'],
      ['6:30pm', 'Call it a day'],
    ]

    @tomorrow = [
      ['7:00am', 'Wake up'],
      ['8:00am', 'Work Out'],
      ['9:00am', 'Inbox Zero'],
      ['11:00am', 'Ping Pong Break'],
      ['1:00pm', 'Lunch'],
      ['3:00pm', 'Coffee Time'],
      ['6:30pm', 'Meetup Presentation'],
    ]

    erb :schedule
  end

get '/rainbow' do
  erb :rainbow
end

get '/home' do
  redirect '/'
end



  get '/youtube' do
    erb :youtube
  end

  get '/team' do

    erb :team
  end

  get '/splash' do
    erb :splash
  end

  get '/schedule' do

    erb :schedule
  end
end

class App < Sinatra::Base
  get '/fib/:n' do
    # TODO: implement an algorithm to calculate the fibonacci sequence at
    # the nth position and display
    # (4) points
  end

  get '/team-randomizer' do
    # TODO: provide a form with a textarea that asks for a list of comma
    # separated names. Randomize this list of names and display it as an
    # ordered list (<ol>). 5 points
  end

  def fib(n)
    # TODO: calculate fib
  end
end
