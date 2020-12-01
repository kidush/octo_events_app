class Event < ApplicationRecord
  scope :by_issue_number, ->(issue_number) { where(issue_number: issue_number) }
end
