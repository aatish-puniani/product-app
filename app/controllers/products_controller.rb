class ProductsController < ApplicationController
  def index
    @products = Product.all
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    if sort_attribute != nil
      @products = Product.order(sort_attribute => sort_order)
    end
    discount = params[:discount]
    if discount
      @products = Product.where('price > ?', 500)
    end
    random = params[:random]
    if random
      @products = Product.all(limit: 1)
    end
  end

  def new
  end

  def create
    Product.create(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      stock: params[:stock]
    )
    redirect_to '/products'
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.update(
    name: params[:name],
    price: params[:price],
    description: params[:description],
    stock: params[:stock]
    )
    flash[:success] = "Synth successfully updated!"
    redirect_to "/products/#{@product.id}"
    end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    flash[:danger] = "Synth successfully deleted!"
    redirect_to "/products"
  end
end