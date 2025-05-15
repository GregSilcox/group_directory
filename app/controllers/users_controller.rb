class UsersController < ApplicationController
  include ResourcesController

  # allow_unauthenticated_access only:
  #   [ :index, :show, :new, :create, :edit, :update, :destroy ]

  private

  def resource_params
    params.expect(user:
      [ :email, :password, :password_confirmation ])
  end
end
