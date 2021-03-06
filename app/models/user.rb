class User < ActiveRecord::Base
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  has_secure_password

  has_many :relationships
  has_many :players, :through => :relationships

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    # TODO
    Item.all
  end

  def following?(player)
    relationships.find_by(player_id: player.id)
  end

  def follow!(player)
    relationships.create!(player_id: player.id)
  end

  def follow(player)
    relationships.create(player_id: player.id)
  end

  def unfollow!(player)
    relationships.find_by(player_id: player.id).destroy
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
