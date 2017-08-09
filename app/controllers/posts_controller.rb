class PostsController < ApplicationController

  get '/posts/new' do
    erb :"posts/new"
    # binding.pry

  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    # binding.pry
    erb :"posts/edit"
    # binding.pry
    # redirect 'posts/#{@post.id}'
  end

  get '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    erb :"posts/delete"
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])
    # @post.destroy
    # binding.pry
    redirect "posts/#{@post.id}/delete"
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect "posts/#{@post.id}"
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    # binding.pry
    erb :"posts/info"
  end



  post '/posts' do
    @post = Post.new
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    # binding.pry
    erb :"posts/index"
  end

  get '/posts' do
    erb :"posts/index"
  end



end
