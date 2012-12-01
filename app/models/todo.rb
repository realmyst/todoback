class Todo < ActiveRecord::Base
  attr_accessible :state, :title

  scope :active, lambda { without_state :deleted }
  scope :web, lambda { active }

  state_machine :state, :initial => :active do
    state :active
    state :completed
    state :deleted

    event :complete do
      transition :active => :completed
    end

    event :uncomplete do
      transition :completed => :active
    end

    event :hide do
      transition any => :deleted
    end

  end
end
