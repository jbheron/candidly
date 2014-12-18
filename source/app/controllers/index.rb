# home page
get '/?' do
  @users = User.all
  erb :home
end

get '/users/new' do
  erb :sign_up
end

# from new POST == go to show page 
post '/users' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  
  redirect '/'
end

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  if User.find_by_email(params[:email]) 
    user = User.find_by_email(params[:email])
    if user.password == params[:password]
      session[:user_id] = user.id
      redirect '/users/:id'
    else
      erb :bad_login
      erb :index
    end
  else
    redirect '/'
  end
end

get '/users/:id' do
    
  "USERS Show page!"
end


# ==========================================================
                  # FROM P1 
# ==========================================================

# index
get '/notes/?' do
  @notes = Note.all || "Why not make a note?"
  erb :index
end

# new
get '/notes/new/?' do
  erb :new
end

# create
post '/notes/?' do
  note = Note.create params
  redirect '/notes'
end

# show
get '/notes/:id/?' do
  @note = Note.find params[:id]
  erb :show
end

# edit
get '/notes/:id/edit/?' do
  @note = Note.find params[:id]
  erb :edit
end

# update
put '/notes/:id/edit/?' do
  note = Note.find params[:id]
  note.description = params[:description]
  note.title = params[:title]
  note.save!
  redirect '/notes'
end

get '/notes/:id/confirm/?' do
  @note = Note.find params[:id]
  erb :destroy
end

# destroy
delete '/notes/:id/delete/?' do
  @note = Note.find params[:id]
  @note.delete
  redirect to '/notes'
end

