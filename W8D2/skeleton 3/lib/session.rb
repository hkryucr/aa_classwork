require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    @req = req
    
    # @cookies = @req.cookies
    # _rails_lite_app
    # Rack::Request.cookies???
  end

  def [](key)
    @req.cookies[key]
  end

  def []=(key, val)
    
    @req.cookies[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    cookie = self["_rails_lite_app"]
    cookie_val = JSON.parse(cookie)

    res.set_cookie("_rails_lite_app", {path:"/", value:{food:food}.to_json})

  end
end
