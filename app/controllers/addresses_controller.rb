class AddressesController < ApplicationController
  include ResourcesController

  allow_unauthenticated_access only:
    [ :index, :show, :new, :create, :edit, :update, :destroy ]

  private

  def resource_params
    params.expect(address:
      [ :street1, :street2, :city, :state, :country, :zipcode ])
  end
end
