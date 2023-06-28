# frozen_string_literal: true

module Mutations
  class UserDelete < Mutations::BaseMutation
    # accepting arguments
    argument :id, ID, required: true

    # Fields to return after object creation
    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(id:)
      user = User.find(id)

      if user.destroy
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
