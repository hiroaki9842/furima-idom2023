class ApplicationController < ActionController::Base
  before_action :basic_auth   #Basic認証機能を有効化

  private
  
  def basic_auth  #Basic認証機能の実装
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数でname/passを設定
    end
  end
end
