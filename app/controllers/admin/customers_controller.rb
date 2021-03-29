class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    end 
  end
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :postal_code, :last_name_kana, :first_name_kana, :address, :telephone_number) 
  end
end
