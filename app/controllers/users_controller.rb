class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @wikis = current_user.wikis
    @private_wikis = @wikis.where(private: true)
    @public_wikis = @wikis.where(private: false)
  end

  def downgrade
    current_user.standard!
  end
end
