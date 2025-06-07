require "erb"

module MiniRubyWeb
  class BaseController
    attr_reader :req, :res

    def initialize(req, res)
      @req = req
      @res = res
    end

    def render(template_name, locals = {})
      template_path = File.join("views", "#{template_name}.erb")
      template = File.read(template_path)
      erb_template = ERB.new(template)
      content = erb_template.result_with_hash(locals)
      res.write content
    end
  end
end
