class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :thumbnail_url, :avatar_url
 
  def avatar_url
    if object.avatar.attached?
      Rails.application.routes.url_helpers.url_for(object.avatar)
    end
  end
end