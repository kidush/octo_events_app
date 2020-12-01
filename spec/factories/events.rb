FactoryBot.define do
  factory :event do
    issue_number { 1 }
    body { File.read("#{Rails.root}/spec/support/webhooks/github/body.json") }
  end
end