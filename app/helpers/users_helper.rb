module UsersHelper
  def render_profile_picture(feed)
    feed.user.profile_picture if feed.caption
  end

  def render_username(feed)
    feed.caption.from.username if feed.caption
  end

  def render_text(feed)
    feed.caption.text if feed.caption
  end

  def render_location(feed)
    feed.location.name if feed.location
  end

  def render_latitude(feed)
    feed.location.latitude
  end

  def render_longitude(feed)
    feed.location.longitude
  end
end
