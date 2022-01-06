class User < ActiveRecord::Base
has_many :articles
before_save {self.email = email.downcase }
validates :username, presence: true,
        length: {minimum:3, maximum:25},
        uniqueness: { case_sensitive: false }
validates :email, presence: true,
        length: {minimum:3, maximum:25},
        uniqueness: { case_sensitive: false },
        email: true
end