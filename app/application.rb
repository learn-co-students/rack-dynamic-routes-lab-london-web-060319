class Application

    @@item = [Item.new("Figs", 3.42), Item.new("Pears", 0.99)]

    def call(env)

        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            searched_item = req.path.split("/items/").last
            if item = @@item.detect { |i| i.name == searched_item}
                resp.write item.price
            else
                resp.status = 400
                resp.write "Item not found"
            end        
        else
            resp.status = 404
            resp.write "Route not found"
        end
        resp.finish
    end

end