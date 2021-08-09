class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  delegate :name, prefix: "user", to: :user

  POST_ATTRS = %i(content image).freeze

  scope :newest, ->{order created_at: :desc}
  validates :user_id, presence: true
  validates :content, presence: true,
            length: {maximum: Settings.micropost.content.max}
  validates :image, content_type: {in: Settings.micropost.image.content_types,
                                   message: :invalid_format},
                    size: {less_than: Settings.micropost.image.max_size
                                              .megabytes,
                           message: I18n.t("invalid_size",
                                           size: Settings.micropost
                                                          .image.max_size)}
  def display_image
    image.variant resize_to_limit: Settings.micropost.resize
  end
end
