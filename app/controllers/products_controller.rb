class ProductsController < SessionsController
  before_action :get_product, only:[:show]
  before_filter :initialize_cart
  
  def index
    @products = Product.search(params[:search]).paginate(page: params[:page])
  end

  def show
  end

  def get_product
    begin
      @product = Product.find(params[:id])
    rescue
      redirect_to products_path
    end
  end

end
