class PostTag

  include ActiveModel::Model
  attr_accessor :message, :name

  with_options presence: true do
    validates :message
    validates :name
  end

  def save
    post = Post.create(message: message)
    tag = Tag.create(name: name)

    PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end


end