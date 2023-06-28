# frozen_string_literal: true

module Mutations
  class UserCreate < Mutations::BaseMutation
    # accepting arguments
    argument :name, String, required: true
    argument :email, String, required: true

    # Fields to return after object creation
    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(name:, email:)
      user = User.new(name:, email:)

      if user.save
        {
          user:,
          errors: []
        }
      else
        {
          user: nil,
          errors: users.errors.full_messages
        }
      end
    end
  end
end
