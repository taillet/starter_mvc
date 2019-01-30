class ApplicationController < Sinatra::Base

  set :method_override, true

  get '/' do
    redirect '/memes'
  end

  get '/memes' do
    @memes = Meme.all
    erb :index
  end

  get '/memes/new' do
    @meme = Meme.new
    erb :new
  end

  post '/memes' do
    @meme = Meme.create(title: params[:title], link: params[:link], caption: params[:caption])
    redirect "/memes/#{@meme.id}"
  end

  get '/memes/:id' do
    @meme = Meme.find(params[:id])
    erb :show
  end

  get '/memes/:id/edit' do
    @meme = Meme.find(params[:id])
    erb :edit
  end

  patch '/memes/:id' do
    @meme = Meme.find(params[:id])
    @meme.update(title: params[:title], caption: params[:caption], link: params[:link])
    redirect "/memes/#{@meme.id}"
  end

  delete '/memes/:id' do
    Meme.delete(params[:id])
    redirect '/memes'
  end

end
