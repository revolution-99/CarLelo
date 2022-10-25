models = $('#car_model').html()
var carBrand = document.getElementById('car_brand')

carBrand.addEventListener('change', function() {
  brand = $('#car_brand :selected').text()
  options=$(models).filter(`optgroup[label='${brand}']`).html()
  if (options){
    $('#car_model').html(options)
  }
  else{
    $('#car_model').empty()
  }
})
