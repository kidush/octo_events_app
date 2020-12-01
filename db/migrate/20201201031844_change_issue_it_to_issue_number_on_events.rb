class ChangeIssueItToIssueNumberOnEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :issue_id, :issue_number
  end
end
