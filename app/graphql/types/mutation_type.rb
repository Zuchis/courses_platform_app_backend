module Types
  class MutationType < Types::BaseObject
    field :user_create, mutation: Mutations::UserCreate
    field :user_delete, mutation: Mutations::UserDelete
    field :user_update, mutation: Mutations::UserUpdate
  end
end
