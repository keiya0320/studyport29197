class PostTag
  include ActiveModel::Model



  attr_accessor :message, :name, :user_id

  with_options presence: true do
    validates :message
    validates :name
    validates :user_id
  end

  def save
      post = Post.new(message: message, user_id: user_id)
      post.save
      tag = Tag.where(name: name).first_or_initialize
      tag.save

      PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end

end