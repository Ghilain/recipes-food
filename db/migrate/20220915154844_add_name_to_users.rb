# frozen_string_literal: true

# rubocop:todo Style/Documentation

class AddNameToUsers < ActiveRecord::Migration[7.0] # rubocop:todo Style/Documentation
  # rubocop:enable Style/Documentation
  def change
    add_column :users, :name, :string
  end
end
