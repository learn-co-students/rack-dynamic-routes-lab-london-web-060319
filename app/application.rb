class Application 
    @@items=[] 

def call(env) 
    resp= Rack::Response.new 
    req=Rack::Request.new(env)

    if req.path.match(/items/)
        item_find = req.path.split("/items/").last
        if item = @@items.find {|i| i.name == item_find}
            resp.write item.price
        else  
            resp.write "Item not found"
            resp.status = 400 
        end 
    else  
        resp.status = 404
        resp.write "Route not found"
    end 
      resp.finish 



end
end