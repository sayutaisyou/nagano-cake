class Admins::HomesController < ApplicationController
  before_action :authenticate_customer!

  def top
  end
end
