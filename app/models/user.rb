class User < ActiveRecord::Base
validate :username,presence:true,lenght :{minimum: 3, maximum: 25}
end