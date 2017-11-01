class ProposalController < ApplicationController

  get '/proposals/new' do
    erb :'/proposals/new'
  end

  post '/proposals/new' do
    @overview = params[:overview].gsub(/(?:\n\r?|\r\n?)/, '<br>')
    t = Time.now
    @time_string = "#{t.strftime("%A")}, #{t.strftime("%B")} #{t.strftime("%d")}"
    params[:time_created] = @time_string
    params[:overview] = @overview
    @proposal = Proposal.new(params)
    @proposal.save
    redirect to "/proposals/#{@proposal.id}"
  end

  post '/proposals/:id/submit' do
    @proposal = Proposal.find(params[:id])
    if @proposal.time_signed == "" && params[:signature] == @proposal.client_name
      t = Time.new
      @time_string = "#{t.strftime("%A")}, #{t.strftime("%B")} #{t.strftime("%d")}"
      @proposal.update(:time_signed => @time_string)
      erb :'/proposals/contract'
    else
      erb :'/proposals/contract'
    end
  end

  get '/proposals' do
    # if logged_in?
      @proposals = Proposal.all
      erb :'/proposals/index'
    # else
    #   redirect to "https://braydonwhitmarsh.com"
    # end
  end

  get '/proposals/:id' do
    @proposal = Proposal.find(params[:id])
    if @proposal.time_signed
      erb :'/proposals/contract'
    else
      erb :'/proposals/show'
    end
  end

  get '/proposals/:id/edit' do
  end

  patch '/proposals/:id' do
  end

  get '/proposals/:id/delete' do
  end
end
