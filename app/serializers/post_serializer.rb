class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  has_many :comments
  # type "post"
  # 	class CommentSerializer < ActiveModel::Serializer
		#   attributes :body		  
		# end
end
