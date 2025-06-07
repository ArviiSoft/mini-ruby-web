require_relative 'lib/mini_ruby_web'
require_relative 'controllers/users_controller'

app = MiniRubyWeb::App.new

app.get "/merhaba" do |req, res|
  res.write "Merhaba ArviS."
end

app.get "/users/:id" do |req, res|
  controller = MiniRubyWeb::UsersController.new(req, res)
  controller.show
end

run app