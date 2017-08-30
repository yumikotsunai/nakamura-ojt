include ConnectHttp
require 'http'
require 'net/https'
require 'time'
CTX = OpenSSL::SSL::SSLContext.new
CTX.verify_mode =OpenSSL::SSL::VERIFY_NONE

class HoockupController < ApplicationController
    
  def setup
  end
  
  def getcode
    @@client = params[:clientId].presence
    @@secret = params[:clientSecret].presence
    @@callbackuri = params[:redirecturi].presence
    
    
    req = 'https://connect.lockstate.jp/oauth/'+'authorize?'+'client_id='+@@client+'&response_type=code&redirect_uri='+@@callbackuri
    redirect_to req
  end 
  
  def callback
   tmp_token = params[:code]
   postform = {'code' => tmp_token \
   ,'client_id' => @@client \
   ,'client_secret' => @@secret \
   ,'redirect_uri' => @@callbackuri \
   ,'grant_type' => 'authorization_code'}
  
   res = HTTP.headers("Content-Type" => "application/x-www-form-urlencoded")
   .post("https://connect.lockstate.jp/oauth/token", :ssl_context => CTX , :form => postform)
   
   @res = ActiveSupport::JSON.decode(res) #アクセストークン確認用
   puts @res
   j = ActiveSupport::JSON.decode(res)
   $access_token = j["access_token"]
 
   if res.code!=200
    @res = res
     @error = res
　   @state = "認証に失敗しました"
　   render
   else 
   @res = res
   @error = ""
     @state = "認証に成功しました"
     render
   end 

  end #callback defのend

end #クラスのend