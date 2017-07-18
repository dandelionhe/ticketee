class AddAuthorToTickets < ActiveRecord::Migration[5.1]
  def change
    add_reference :tickets, :author, index: true
    add_foreign_key :tickets,:users,column: :author_id
  end
end
