models = $('#model').html()
var carBrand = document.getElementById('brand')

carBrand.addEventListener('change', function() {
  brand = $('#brand :selected').text()
  options=$(models).filter(`optgroup[label='${brand}']`).html()
  if (options){
    $('#model').html(options)
  }
  else{
    $('#model').empty()
  }
})
