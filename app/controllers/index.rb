RESTRICTED_PATHS = []

RESTRICTED_PATHS.each do |path|
  redirect "/" unless current_user
end

get '/' do
  erb :index
end

