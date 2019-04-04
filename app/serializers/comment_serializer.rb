class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :user_id, :post_id
  belongs_to :post
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  type "comment"
end
