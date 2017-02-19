class WelcomeController < ApplicationController
  def index
    @IS_INDEX = true
    @q = Product.ransack(params[:q])
    @products = @q.result.where(:is_hidden => false).paginate(:page => params[:page], :per_page => 16)
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
