class RootController < ApplicationController
  def index
    if not current_user
      redirect_to new_user_session_path
    end
  end
end
