class WelcomeController < ApplicationController
  def index
    @products = Product.where(:is_hidden => false).order("updated_at DESC")
  end
end
