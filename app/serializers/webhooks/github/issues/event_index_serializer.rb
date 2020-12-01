class Webhooks::Github::Issues::EventIndexSerializer < ActiveModel::Serializer
  attributes :issue_number, :body
end