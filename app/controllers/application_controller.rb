# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # ADICIONE ESTE MÉTODO AQUI
  protected

  def after_sign_in_path_for(resource)
    # Esta linha diz ao Devise para onde ir após o login.
    # Neste caso, para a sua lista de itens (items_path).
    items_path
  end
end

