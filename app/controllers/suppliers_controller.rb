class SuppliersController < ApplicationController
  
  def new
    @supplier = Supplier.new
  end

  def destroy
    Supplier.find_by(id: params[:id]).update(active: false)
    redirect_to "/suppliers"
  end

  def index
    @suppliers = Supplier.all
  end

  def update
  @supplier = Supplier.find_by(id: params[:id])
    if @supplier.update(params[:supplier])
      redirect_to "/suppliers/#{@supplier.id}"
    else
      render :edit
    end
  end

   def show
    @supplier = Supplier.find_by(id: params[:id]) 
  end

    def create
    @supplier = Supplier.new(params[:supplier])
    if @supplier.save
      redirect_to "/suppliers/#{@supplier.id}"
    else
      render :new
    end
  end  

  def edit
    @supplier = Supplier.find_by(id: params[:id])
  end

end
