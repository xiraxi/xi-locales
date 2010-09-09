Rails.application.class.routes.draw do
  scope "admin" do
    resources :translations, :path => "locales/texts"
  end
end
