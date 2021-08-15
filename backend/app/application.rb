class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # Routes (Index, Create, Show, Update, Delete)
    # Index
    if req.path == '/single_fishes'  && req.get?
      return [200, {'Content-Type' => 'application/json'}, [SingleFish.all.to_json]]

    elsif req.path == '/rivers' && req.get?
      return [200, {'Content-Type' => 'application/json'}, [River.all.to_json]]
    
    elsif req.path.match(/rivers/) && req.get?
      id = req.path.split('/')[2]
      river = River.find_by(id: id)
      if river
        fish = river.single_fishes
        river_res = {name: river.name, country: river.country, fish: fish}
        return [200, {'Content-Type' => 'application/json'}, [river_res.to_json]]
      else
        return [204, {'Content-Type' => 'application/json'}, [{error: 'river not found'}]]
      end
    
    else
      resp.write "Path Not Found"

    end

    # Create
    if req.path.match(/single_fishes/) && req.post?
      body = JSON.parse(req.body.read)
      single_fishes = SingleFish.create(body)
      return [201, {'Content-Type' => 'application/json'}, [single_fishes.to_json]]
    end

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end
