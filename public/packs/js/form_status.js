$('#appointment_status').on('change', (function() {
    var statusValue = document.getElementById('appointment_status').value
    console.log(statusValue)
    var updateButton = document.getElementById('update--btn')
    var getButton = document.getElementById('get--btn')
    console.log(updateButton)
    if (statusValue == "Sold"){
      updateButton.style.display = "none"
      getButton.style.display = "flex"
    }
    if(statusValue == "Processing" || statusValue == "Investigating" || statusValue =="Ready for sell"){
      updateButton.style.display = "flex"
      getButton.style.display = "none"
    }
  }))
