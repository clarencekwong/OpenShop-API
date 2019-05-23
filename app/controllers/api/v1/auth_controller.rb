class Api::V1::AuthController < ApplicationController
  def userlogin
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      jwt = encode_token({user_id: user.id})
      render json: {user: UserSerializer.new(user), jwt: jwt}
    else
      render json: {errors: "Please enter the correct email and password!"}
    end
  end

  def vendorlogin
    user = Vendor.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      jwt = encode_token({vendor_id: user.id})
      render json: {vendor: VendorSerializer.new(user), jwt: jwt}
    else
      render json: {errors: "Please enter the correct email and password!"}
    end
  end

  def auto_userlogin
    user = curr_user
    if user
      render json: user
    else
      render json: {errors: "Please log in first"}
    end
  end

  def auto_vendorlogin
    vendor = curr_vendor
    if vendor
      render json: vendor
    else
      render json: {errors: "Please log in first"}
    end
  end
end
