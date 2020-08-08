module ErrorHandlers
  extend ActiveSupport::Concern

  included do # このモジュールが読み込まれたクラスで評価される。
    rescue_from StandardError, with: :rescue500 # P.92 StandardError( 例外クラス)を rescue500メソッドで処理する。(We're Sorryにしない。)
    rescue_from ApplicationController::Forbidden, with: :rescue403  #P.99 Forbiddeクラスは、ApplicationController内で定義されているクラスのためモジュール名を付ける。
    rescue_from ApplicationController::IpAddressRejected, with: :rescue403
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404
  end

  private def rescue403(e)
    @exception = e
    render "errors/forbidden", status: 403
  end

  private def rescue404(e)
    render "errors/not_found", status: 404
  end

  private def rescue500(e)
    render "errors/internal_server_error", status: 500
  end
end

