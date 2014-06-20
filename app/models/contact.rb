class Contact < ActiveRecord::Base
 validates :firstname, presence: true
    validates :lastname, presence: true
 validates :mno, presence: true,length: { minimum: 10 }
 validates :emailid, presence: true
 validates :add, presence: true
                



end
