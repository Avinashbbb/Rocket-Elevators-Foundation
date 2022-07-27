class ApplicationController < ActionController::Base
require 'aws-sdk-polly'

  def after_sign_in_path_for(resource)
      
    # user = warden.user.email
    # elevatorNum = Elevator.count
    # buildingNum = Building.count
    # customerNum = Customer.count
    # elevatorsMaintenance = 0
    # batterieNum =  Batterie.count
    # leadNum = Lead.count
    # cityNum = Addresse.pluck(:city).uniq.count

    # credentials = Aws::Credentials.new('AKIATAAKB5PVDHXSTCYL', 'l/jylKFbiH8DyXP5JxHjifY8nkbLFOCU8qLdz8CI')
    # client = Aws::Polly::Client.new(region: 'us-west-2', credentials: credentials)

    # tts = "Hello user , #{user}. There are currently #{elevatorNum} 
    #     elevators deployed in the #{buildingNum} buildings of your #{customerNum} customers.
    #     Currently, #{elevatorsMaintenance} elevators are not in Running Status and are being serviced.
    #     You currently have #{leadNum} leads in your contact requests.
    #     #{batterieNum} Batteries are deployed across #{cityNum} cities"

    # x = client.synthesize_speech(output_format: 'mp3',text: tts,voice_id: 'Joanna')  
    
    
    #   name = File.basename("tester")
    #   # Split up name so we get just the xyz part
    #   parts = name.split('.')
    #   first_part = parts[0]
    #   mp3_file = first_part + '.mp3'
    
    #   IO.copy_stream(x.audio_stream, mp3_file)


    if  warden.user.emp == true
      rails_admin_path
    else
      main_app.root_path
    end

  end

  

end
