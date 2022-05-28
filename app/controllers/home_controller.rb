class HomeController < ApplicationController
  def index
    @api = StockQuote::Stock.new(api_key: 'pk_76703dbbcc214d258f092e33f9e2c5c8')

    if params[:ticker] == ""
      @nothing = "Hey! You forgot to enter a symbol"
    elsif params[:ticker]
      begin
        @stock = StockQuote::Stock.quote(params[:ticker])
      rescue RuntimeError
        @error = "Hey! That stock symbol doesn't exist! Try again."
      else
        p "No error"
      ensure
        p "Done"
      end
    end

  end

  def about
  end

end
