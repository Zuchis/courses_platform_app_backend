# frozen_string_literal: true

module Mutations
  class UserUpdate < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: false
    argument :email, String, required: false

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(id:, name: nil, email: nil)
      user = User.find(id)

      name = user.name if name.nil?
      email = user.email if email.nil?

      if user.update(name:, email:)
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
