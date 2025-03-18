class EmailAddressesController < ApplicationController
  include ResourcesController

  allow_unauthenticated_access only:
    [ :index, :show, :new, :create, :edit, :update, :destroy ]

  private

  def resource_params
    params.expect(email_address:
      [ :address, :kind, :status ])
  end
end
