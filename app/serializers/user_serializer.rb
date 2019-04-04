class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :username
  has_many :posts
  has_many :comments
  type "user"
end
