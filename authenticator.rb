require 'sinatra'
require_relative 'post'
posts = Array.new


get '/' do
  haml :blog_list, :format => :html5, :locals => {:posts => posts}
end

get '/new_blog_entry' do
  haml :blog_entry

end

post '/save_blog' do
  p = Post.new
  p.author = params[:author]
  p.title = params[:title]
  p.textarea = params[:textarea]
  #posts << p
  posts.unshift(p)

  #pass data to blog_list
  haml :blog_list, :locals => {:posts => posts}
end

  get '/read_blog' do
    index = params[:i].to_i
    haml :full_blog_post, :locals => {:the_post => posts[index]}
  end


