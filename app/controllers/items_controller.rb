# app/controllers/items_controller.rb
class ItemsController < ApplicationController
  # Pula a autenticação para a página de listagem, mas não para a atualização
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @owned_items = Item.where(owned: true).order(:category, :rarity, :name)
    @missing_items = Item.where(owned: false).order(:category, :rarity, :name)
  end

  def update
    @item = Item.find(params[:id])
    # Inverte o status 'owned' (se era true, vira false, e vice-versa)
    @item.update(owned: !@item.owned)

    # Redireciona de volta para a lista
    redirect_to items_path
  end
end

