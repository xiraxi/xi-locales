
if Rails.application.class.name == "XiLocalesWorker::Application"
  XiLocalesWorker::Application.config.secret_token = 'ab3f5b2749315455862455ded2a55aa50002020a00a0a0202070ab1aeb501d94368d2f7ae782d0ae92f283b57069f6d46b5e1174cd0813eb2c024694d07cc0b5'
  XiLocalesWorker::Application.config.session_store :cookie_store, :key => '_xi_locales_worker_session'
end
