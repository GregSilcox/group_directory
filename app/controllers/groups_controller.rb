class GroupsController < ApplicationController
  include ResourcesController

  allow_unauthenticated_access only:
    [ :index, :show, :new, :create, :edit, :update, :destroy ]

  private
    def resource_params
      params.expect(group:
        [ :name, :description ])
    end
end
