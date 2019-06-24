require "pry"

class Application
    @@items = []
 
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
      item = @@items.select {|item| item.name == req.path.split("/items/").last}
      if req.path.match(/items/)
        if @@items.map {|i| i}.include?(item.first)
            @@items.each {|i| resp.write "#{i.price}"}
        else 
            resp.write "Item not found"
            resp.status = 400
        end
      else
        resp.write "Route not found"
        resp.status = 404
      end
   
      resp.finish
    end
end