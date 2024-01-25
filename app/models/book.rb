class Book < ApplicationRecord
   validates :book, 
          :presence => {:message => "Title can't be blank." },
          :length => { :maximum => 100, :message => "Must be less than 100 characters"}
#   validates :book, presence:true ,length: {minimum:3 ,maximum: 30}
   #validates :author , presence:true ,lenth: {minimum:3 ,maximum :30}
end
