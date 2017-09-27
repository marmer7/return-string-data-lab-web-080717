class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new

  end

  def create
    Product.create(name: params[:name], price: params[:price], inventory: params[:inventory], description: params[:description])
    redirect_to "/products"
  end


  def inventory
    product = Product.find(params[:id])
    if (product.inventory && product.inventory > 0)
      render plain: "true"
    else
      render plain: "false"
    end
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end


end
