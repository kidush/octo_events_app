class Issues::Events::IndexSerializer < ActiveModel::Serializer
  attributes :issue_number, :body
end