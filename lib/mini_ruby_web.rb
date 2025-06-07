require_relative "router"

module MiniRubyWeb
  class App
    def initialize
      @router = Router.new
    end

    def get(path, &block)
      @router.get(path, &block)
    end

    def post(path, &block)
      @router.post(path, &block)
    end

    def call(env)
      @router.call(env)
    end
  end
end
