class InterventionsController < ApplicationController
before_action :authenticate_user!
before_action do
  if request.format == Mime::ALL
    request.format = request.xhr? ? :js : :html
  end
end

  #before_action :set_intervention, only: %i[ show edit update destroy ]
  
  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all
  end

  # GET /interventions/customer_buildings
  # Return a list of buildings own by a customer (by id)
  def customer_buildings
    @customer_buildings = Customer.find_by(fullName: params[:selectedCustomer]).buildings
    pp @customer_buildings.to_json
    render plain: @customer_buildings.to_json
  end

  def building_battery
    @building_battery = Building.find_by(id: params[:selectedBuildingId]).batterie
    pp @building_battery.to_json
    render plain: @building_battery.to_json
  end

  def battery_column
    @battery_column = Batterie.find(params[:selectedBatteryId]).columns
    pp @battery_column
    render plain: @battery_column.to_json
  end

  def column_elevator
    @column_elevator = Column.find(params[:selectedcolumnId]).elevators
    pp @column_elevator
    render plain: @column_elevator.to_json
  end

  def employee 
    @employee = Employee.all
    render plain: @employee.to_json
  end
  
  def show
  end

  # GET /interventions/new
  def new
    @customers = Customer.all 
  end

  

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new
    @intervention.result = "Incomplete"
    @intervention.status = "pending"
    @intervention.authour = warden.user.email
    @intervention.report = params[:description]
    @intervention.customer_id = Customer.find_by(fullName: params[:customer]).id
    @intervention.employee_id = params[:employeeId]
    @intervention.building_id = params[:buildingId]
    @intervention.batterie_id = params[:batteryId]
    @intervention.column_id = params[:columnId]
    @intervention.elevator_id = params[:elevatorId]
    @intervention.interventionDateStart = "nil"
    @intervention.interventionDateEnd = "nil"
    @intervention.save
    pp "saved"
    render plain: @intervention.to_json 
  end

  

  private
 
    # Only allow a list of trusted parameters through.
    def intervention_params
      params.fetch(:intervention, {})
    end
end
