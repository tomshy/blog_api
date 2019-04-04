class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :user_id, :post_id    
end
