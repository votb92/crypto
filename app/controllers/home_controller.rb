class HomeController < ApplicationController
  def index
    load "secret.rb"
    key = Secret.key
    require 'net/http'
    require 'json'
    @url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=100'
    @uri = URI(@url)
    params = { :CMC_PRO_API_KEY => key }
    @uri.query = URI.encode_www_form(params)
    @response = Net::HTTP.get(@uri)
    @coins = JSON.parse(@response)
    @mycoin = ["BTC", "XRP", "ADA", "XLM", "STEEM"]


  end

  def lookup
    @symbol = params['sym']
    if @symbol
      @symbol = @symbol.upcase
    end
    if @symbol == ""
      @symbol = "You forgot to enter something"
    end
  end
end
