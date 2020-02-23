class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
end


def authorize
  redirect_to '/login' unless current_user
end