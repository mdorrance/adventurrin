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
    feed.location.latitude if feed.location
  end

  def render_longitude(feed)
    feed.location.longitude if feed.location
  end

  def render_business_image(result)
    result.image_url if result.respond_to?(:image_url)
  end

  def yelp_results(feed)
    params = { term: 'food',limit: 3}
    coordinates = { latitude: render_latitude(feed), longitude: render_longitude(feed)}
    Yelp.client.search_by_coordinates(coordinates, params)
  end
  
  def render_business_name(result)
    result.name if result.respond_to?(:name)
  end

  def render_business_address(result)
    result.location.address[0] if result.respond_to?(:location)
  end

  def render_business_city(result)
    result.location.city if result.respond_to?(:location)
  end

  def render_business_state(result)
    result.location.state_code if result.location.respond_to?(:state_code)
  end

  def render_business_zipcode(result)
    result.location.postal_code if result.location.respond_to?(:postal_code)
  end

  def render_business_phone(result)
    result.display_phone if result.respond_to?(:display_phone)
  end

  def render_busines_rating(result)
    result.rating_img_url_small if result.respond_to?(:rating_img_url_small)
  end

  def render_business_snippet(result)
    result.snippet_text if result.respond_to?(:snippet_text)
  end

end
