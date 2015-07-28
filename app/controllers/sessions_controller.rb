class SessionsController < ApplicationController
  before_action :authenticate_user!, only: [:add]
end
