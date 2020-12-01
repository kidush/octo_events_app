class Event < ApplicationRecord
  scope :by_issue_number, ->(issue_number) { select(:issue_number, :body).where(issue_number: issue_number).group(:id, :issue_number) }
end
