class TranslationsController < ApplicationController
  admin_section

  def create
    key = params[:key]
    locale = params[:locale]

    traslation = Translation.find_by_key_and_locale(key, locale) || Translation.new(:key => key, :locale => locale)
    traslation.text = params[:value]

    if traslation.save
      render :text => "OK"
    else
      render :text => traslation.errors.full_messages
    end
  end
end
