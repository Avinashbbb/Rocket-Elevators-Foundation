class CustomersController < ApplicationController
  before_action :authenticate_user!
    def index
      
    end
    def create
        

        pp "hello we r in"
        pp " "
        pp $leadname
        pp $leademail 
        pp $leadPhone 
        pp $leadcompany 
        pp $leaddescription 
        pp $leadfile
        pp " "
        pp " "
        pp " "
        pp " "
        pp " we r in "
         
        @customer = Customer.new()
        #@customer.date = DateTime.now
        @customer.fullName = $leadname
        @customer.companyName = $leadcompany 
        @customer.contactPhone = $leadPhone 
        @customer.email = $leademail
        @customer.description = $leaddescription 
        customerfile = $leadfile
        pp customerfile
        
        if @customer.save
            
            check_for_file()
            
        end
    end
    
 ########################################################################################################################
    def check_for_file

        pp "loooooooooooooooook      here"
        
        customerfile = $leadfile
        pp customerfile
        if customerfile.file != nil
            dropbox_api()
        end
    end

###################################################################################################################
    def dropbox_api
    

    fileurl = $leadfile.file.file
    name = @customer.fullName
    company = @customer.companyName

    #connects with the api
    client = DropboxApi::Client.new(ENV['DROPBOX_OAUTH_BEARER'])
    #Searches to check if a folder exeist in the name of the companey and project name
    searchResult = client.search("#{company}")
    
    if searchResult.matches.length == 0
      pp "folder doesnt exist"
      client.create_folder("/Apps/#{company}")
      pp "created a new folder"
      client.upload("/Apps/#{company}/#{name}",fileurl)
      pp "saved the file to the new foder"
      #@leads.email = nil 
      pp "deleted the local copy "
    elsif
      pp "folder exist"
      client.upload("/Apps/#{company}/#{name}",fileurl)
      pp "saved the file to the existing folder"
      #@leads.email = nil 
      pp "deleted the local copy "
    end
  end
#####################################################################################################################################
    
end
