class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end

  post '/figures' do
    # binding.pry
    @figure = Figure.create(params['figure'])
    title = Title.create(params[:title])
    FigureTitle.create(figure: @figure, title: title)
    # binding.pry
    landmark = Landmark.create(params[:landmark])
    @figure.landmarks << landmark
    @figure.save
    redirect to "figures/#{@figure.id}"
  end

  get "/figures/:id" do
    # binding.pry
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    @titles = Titles.all
    binding.pry
    erb :"figures/edit"
  end


end
