# MiniRubyWeb

A lightweight Ruby web framework inspired by Sinatra, designed for educational purposes and simplicity.

---

## 🚀 Features

| Feature              | Description                                |
|----------------------|--------------------------------------------|
| 🛣️ Routing           | Supports static and dynamic routes         |
| 🧭 Controllers        | BaseController structure for logic separation |
| 🧾 Views              | ERB rendering system for templates         |
| ✅ Rack Compatible    | Works with `rackup` and middleware         |
| 🔍 Testable           | Designed with RSpec and modularity in mind |

---

## 🗂️ Project Structure

```
mini_ruby_web/
├── lib/
│   ├── base_controller.rb
│   ├── mini_ruby_web.rb
│   └── router.rb
├── controllers/
│   └── users_controller.rb
├── views/
│   └── user_show.erb
├── app.rb
└── config.ru
```

---

## 🔧 Usage

### Start the server

```bash
rackup
```

### Example Routes

```ruby
app.get "/merhaba" do |req, res|
  res.write "Merhaba ArviS."
end

app.get "/users/:id" do |req, res|
  controller = UsersController.new(req, res)
  controller.show
end
```

---

## 📦 Future Improvements

- Middleware support
- Sessions and cookies
- ORM integration (e.g., ActiveRecord)
- CLI tool
- RESTful routing