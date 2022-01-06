class Article < ActiveRecord::Base 
    belongs_to :user
    puts "this is model class calling 0000000000000000000000000000000000000"
    validates :title, presence: true, length: {minimum:3, maximum:50}
    validates :user_id,presence: true
    validates :description,presence: true ,length: {minimum:3, maximum:100}
end