require "sinatra"
require "sinatra/reloader"
$coffees = []

def template
  "
<html>
<body>
<form action='/' method='post'>
What: <input name='what'>
Cost: <input name='cost'>
<button type='submit'>add coffee</button>
</form>
#{ $coffees.inspect }
</body>
</html>
  "
end

get "/" do
  #$coffees << params
  template
end

post "/" do
  $coffees << params
  redirect "/"
end

get "/page-name" do 
 "This is text on the page"
 end