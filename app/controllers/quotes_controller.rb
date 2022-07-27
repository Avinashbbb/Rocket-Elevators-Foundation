require 'net/http'
require 'uri'
require 'json'
require 'rest_client'

class QuotesController < ApplicationController
  def create 
    @quotes = Quote.new(quote_params)
    
    if @quotes.save

      data = {
        status: 2, 
        priority: 1,
        subject: "#{@quotes.companyName}",
        email: "#{@quotes.email}",
        description: "hi"
      }
  
      data_json = JSON.generate(data)
      
      puts data_json
  
      request = RestClient::Request.execute(
        method: :post,
        url: 'https://rocketelevators-support.freshdesk.com/api/v2/tickets',
        user: "iohhGOT939hTYz9tk2",
        password: 'X',
        payload: data_json,
        headers: {"Content-Type" => 'application/json'}
      )

      
      
        flash[:notice] = 'Quote created successfully'
        redirect_to pages_quote_url action: :new
  
            
    end


  end

  private
  def quote_params
    params.require(:quotes).permit(:type_building, :numApartment, :numFloor, :numElevator, :numOccupant, :companyName, :email) 
  end
end
