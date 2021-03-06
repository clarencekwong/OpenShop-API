class Api::V1::StripeController < ApplicationController

    def charge
        Stripe.api_key = ENV['stripe_secret_key']        
        token = stripe_params[:token_id]
        if token
        charge = Stripe::Charge.create({
            amount: stripe_params[:amount] * 100,
            currency: 'cad',
            description: 'TESTING CHARGE',
            source: token,
        })
        render json: {message: "Successfully Charged"}
        else 
            render json: {errors: "Charge failed"}
        end
    end

    private

    def stripe_params
        params.permit(:token_id, :amount)
    end
end
