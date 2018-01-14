class ChargesController < ApplicationController
  before_action :amount

  def new
  	@stripe_btn_data = {
  		key: "#{ Rails.configuration.stripe[:publishable_key] }",
  		description: "Flicki Membership - #{current_user.first_name} #{current_user.last_name}",
  		amount: @amount
  	}
  end

  def create
  	customer = Stripe::Customer.create(
  		email: current_user.email,
  		card: params[:stripeToken]
  	)

  	charge = Stripe::Charge.create(
  		customer: customer.id,
  		amount: @amount,
  		description: "Flicki Membership - #{current_user.email}",
  		currency: 'usd'
  	)

  	current_user.premium!
  	flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
  	redirect_to edit_user_registration_path(current_user)

  rescue Stripe::CardError => e
  	flash[:alert] = e.message
  	redirect_to new_charge_path
  end

  private

  def amount
  	@amount = 1500
  end
end
