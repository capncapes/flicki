class UsersController < ApplicationController
  def show
    @wikis = current_user.wikis
    @private_wikis = @wikis.where(private: true)
    @public_wikis = @wikis.where(private: false)
  end

  def downgrade
    current_user.standard!

    @wikis = current_user.wikis
    @wikis.each do |wiki|
    	wiki.update_attribute(:private, false)
	end
  end
end
