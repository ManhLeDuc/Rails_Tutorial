module MicropostsHelper
  def load_feed_page user, page, page_size = Settings.page_size
    user.feed.includes([:user, image_attachment: :blob])
        .page(page).per page_size
  rescue StandardError
    nil
  end

  def load_user_feed_page user, page, page_size = Settings.page_size
    user.microposts.newest.includes([:user, image_attachment: :blob])
        .page(page).per page_size
  rescue StandardError
    nil
  end
end
