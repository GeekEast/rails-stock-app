class HomeController < ApplicationController
  def index
    @company_code = params[:code]
    if !@company_code.blank?
      begin
        @stock = StockQuote::Stock.quote(@company_code)
      rescue
        @err_msg = "Stock code doesn't exist"
      end
    end
  end

  def about
  end
end
