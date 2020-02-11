class User < ActiveRecord::Base
    has_many :collections
    has_many :cats, through: :collections
end