function getCustomerBuildings() {
  let selectedCustomer =$("#selectedCustomer").val()
   res = $.ajax({
    url: 'http://localhost:3000/interventions/customer_buildings',
    method: 'GET',
    async: true,
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: {
      selectedCustomer: selectedCustomer
    },
    dataType: 'json',
    success: function (result) {
      display(result)
      console.log(1)
      $("#selectedBuilding").empty()
      for(let i=0; i<Object.keys(result).length;i++){
        $("#selectedBuilding").append("<option value=" + result[i].id + ">" + result[i].addressOfBuilding + "</option>");
      }
    }
  })
};


function getBuildingbatteries() {
  let selectedBuildingId =$("#selectedBuilding").val()
   res = $.ajax({
    url: 'http://localhost:3000/interventions/building_battery',
    method: 'GET',
    async: true,
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: {
      selectedBuildingId: selectedBuildingId
    },
    dataType: 'json',
    success: function (result) {
      console.log(2)
      console.log(JSON.parse(JSON.stringify(result)))
      $("#selectedBattery").empty()
      $('#selectedBattery').append("<option >None</option>")
        $("#selectedBattery").append("<option value=" + result.id + ">" + result.id+ "</option>");
    }
  })
}  

function getbatterycolumn() {
  let selectedBatteryId =$("#selectedBattery").val()
   res = $.ajax({
    url: 'http://localhost:3000/interventions/battery_column',
    method: 'GET',
    async: true,
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: {
      selectedBatteryId: selectedBatteryId
    },
    dataType: 'json',
    success: function (result) {
      console.log(3)
      $("#selectedColumn").empty()
      $('#selectedColumn').append("<option >None</option>")
      for(let i=0; i<result.length;i++){
        $("#selectedColumn").append("<option value=" + result[i].id + ">" + result[i].id + "</option>");
      }
    }
  })
};

function getColumnElevator(){
  let selectedcolumnId = $("#selectedColumn").val()
  res = $.ajax({
    url: 'http://localhost:3000/interventions/column_elevator',
    method: "GET",
    async: true,
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data: {
      selectedcolumnId: selectedcolumnId
    },
    dataType: "json",
    success: function(result){
      console.log(4)
      console.log(result)
      $("#selectedElevator").empty()
      $("#selectedElevator").append("<option >None</option>")
      for(let i=0; i <result.length;i++){
         $("#selectedElevator").append("<option value=" + result[i].id + ">" + result[i].id + "</option>");
      }
    }
  })
};

function employee(){
  res = $.ajax({
    url: 'http://localhost:3000/interventions/employee',
    method: 'GET',
    async: true,
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    dataType: 'json',
    success: function(result){
      for(let i=0; i < result.length;i++){
        $('#employee').append("<option value=" + result[i].id + ">" + result[i].firstNname + "</option>")
      }
    }
  })
}

function submit(){
  let customer = $("#selectedCustomer").val()
  let buildingId = $("#selectedBuilding").val()
  let batteryId = $("#selectedBattery").val()
  let columnId = $("#selectedColumn").val()
  let elevatorId = $("#selectedElevator").val()
  let employeeId = $("#employee").val()
  let description = $("#description").val()
  
  res = $.ajax({
    url:'http://localhost:3000/interventions/create',
    method: "POST",
    async: true,
    beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
    data:{
      customer: customer,
      buildingId: buildingId,
      batteryId: batteryId,
      columnId: columnId,
      elevatorId: elevatorId,
      employeeId: employeeId,
      description: description
    },
    dataType: 'json',
    success: ()=>{
      alert("Intervention saved!")
    }
  })
}



function display(result){
  
  let displaytest = JSON.parse(JSON.stringify(result))
  let displayfinal = JSON.stringify(displaytest)
  $("#readonly").append(displayfinal)
}



employee();
$("#selectedCustomer").change(function() {
  getCustomerBuildings()
});

  $("#selectedBuilding").change(function() {
    getBuildingbatteries()
  });

  $("#selectedBattery").change(function() {
    getbatterycolumn()
  });
  $("#selectedColumn").change(function(){
    getColumnElevator()
  });
  $('#submit').click(function(){
    submit()
  });