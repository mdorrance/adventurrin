class User < ActiveRecord::Base
  validates :uid, :token, presence: true, uniqueness: true

  def self.find_or_create_from_auth(oauth_data)
    user = User.find_or_create_by(provider: oauth_data.provider, uid: oauth_data.uid)

    user.name = oauth_data.info.name
    user.nickname = oauth_data.info.nickname
    user.image_url = oauth_data.info.image
    user.bio = oauth_data.info.bio
    user.website = oauth_data.info.website
    user.token = oauth_data.credentials.token
    user.uid = oauth_data.uid
    user.provider = oauth_data.provider
    user.save
    user
  end

  def client
    @client ||= Instagram.client(access_token: token)
  end

end
