require 'http'
require 'json'
require 'date'
include ConnectHttp

class ApicontrolController < ApplicationController
 

  def apicontrol #accessguest呼び出しアクション作成,表用のデータ抽出
    authtoken = "Bearer " + $access_token
    res = HTTP.headers(:accept => "vnd.lockstate.v1+json",:Authorization => authtoken)
    .get("https://api.lockstate.jp/access_persons?type=access_guest", :ssl_context => CTX)
    @res = ActiveSupport::JSON.decode(res.body)
    
    @res = @res['data'] 
    puts @res
    
   
    return @res
  end
  
  
  
end
