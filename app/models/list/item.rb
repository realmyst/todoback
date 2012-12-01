class List::Item < ActiveRecord::Base
  attr_accessible :list_id, :state, :title
end
