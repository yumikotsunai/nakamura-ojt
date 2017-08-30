require 'http'
require 'json'
require 'date'
include ConnectHttp

class SendmailController < ApplicationController
 

  def sendmail
    
    #id受け渡し確認用コード(APIにうけわたされているかどうかを確認する必要がある。)
    #puts($list) 
    
    #こっからforループ
    
    for id in $list do
    
    authtoken = "Bearer " + $access_token
    res = HTTP.headers(:accept => "vnd.lockstate.v1+json",:Authorization => authtoken)
    .post("https://api.lockstate.jp/access_persons/" + id + "/email/notify",:ssl_context => CTX)
    
    end
    
    return res #これいるかな？
    
  end

end
