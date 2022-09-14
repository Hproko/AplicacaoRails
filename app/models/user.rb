class User < ActiveRecord::Base
    validates :username, presence: true, length: {minimum:3, maximum: 50}, uniqueness: {case_sensitive: false}
    validates :password, presence: true, length: {minimum:3}
end
