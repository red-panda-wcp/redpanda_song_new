class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def destroy
    @user = current_user
    @user.active = 1
    @user.save
    signed_out = Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    redirect_to root_path
  end

end
