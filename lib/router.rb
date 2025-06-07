module MiniRubyWeb
  class Router
    def initialize
      @routes = { "GET" => [], "POST" => [] }
    end

    def get(path, &block)
      add_route("GET", path, block)
    end

    def post(path, &block)
      add_route("POST", path, block)
    end

    def add_route(method, path, block)
      if path.include?(":")
        pattern = path.gsub(/:\w+/) { |m| "(?<#{m[1..]}>[^/]+)" }
        regex = Regexp.new("^#{pattern}$")
        @routes[method] << { path: path, regex: regex, block: block }
      else
        @routes[method] << { path: path, regex: nil, block: block }
      end
    end

    def call(env)
      req = Rack::Request.new(env)
      res = Rack::Response.new
      route_info = find_route(req.request_method, req.path_info)

      if route_info
        if route_info[:regex]
          match_data = route_info[:regex].match(req.path_info)
          req.update_param("params", match_data.named_captures)
        end
        route_info[:block].call(req, res)
      else
        res.status = 404
        res.write "404 Not Found"
      end

      res.finish
    end

    def find_route(method, path)
      @routes[method].each do |route|
        if route[:regex]
          return route if route[:regex].match(path)
        else
          return route if route[:path] == path
        end
      end
      nil
    end
  end
end