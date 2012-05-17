class DammitController < Devise::SessionsController

  def create
    head :ok
  end

end
