class Post < ApplicationRecord
belongs_to :category
validates :title, presence: true, length: { minimum: 7 }
# uniqueness:{case_sensitive:false,
#                                                 message: "must be unique"}

validates :body, presence: true


# after_initialize :body_snippet
# Test drive a method `body_snippet`  that returns a maximum of a
# 100 characters with "..." of the body if it's more than a 100 characters long.

 def body_snippet
   body_length = self.body.length
   if body_length > 100
      self.body.slice(0,100) + "..."
   end
 end



end
