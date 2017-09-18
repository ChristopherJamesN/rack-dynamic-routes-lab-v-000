class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Item not found"
      resp.status = 400
    end
  end

end
