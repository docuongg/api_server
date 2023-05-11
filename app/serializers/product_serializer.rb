class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit, :price, :thumbnail_url, :avatar_url, :category_name, :category_id
 
  def category_name
    object.category.name
  end

  def category_id
    object.category.id
  end
  
  def avatar_url
    if object.avatar.attached?
      Rails.application.routes.url_helpers.url_for(object.avatar)
    end
  end
end