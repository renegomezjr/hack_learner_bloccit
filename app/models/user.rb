class User < ActiveRecord::Base

  before_save :normalize_name, :downcase_email, on: :create
      def normalize_name
      name_array = []
      self.name.split.each do |f|
        name_array << f.capitalize
        end
      self.name = name_array.join(" ")
      end

      def downcase_email
        self.email = email.downcase
      end


  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 100 },
            format: { with: EMAIL_REGEX }

  has_secure_password

end
