require_relative "../lib/base_controller"

module MiniRubyWeb
  class UsersController < BaseController
    def show
      user_id = req.params["params"]["id"]
      render "user_show", { id: user_id }
    end
  end
end