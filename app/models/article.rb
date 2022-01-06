class Article < ActiveRecord::Base 
    puts "this is model class calling 0000000000000000000000000000000000000"
    validates :title, presence: true, length: {minimum:3, maximum:50}
        validates :description,presence: true ,length: {minimum:3, maximum:100}
end