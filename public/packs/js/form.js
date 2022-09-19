optionsMap = {
  'Maruti': ['Swift','Swift Dzire','Baleno','Ciaz','Wagon R','Alto 800','Celerio','Alto K10','Ertiga','Alto','Vitara Brezza','800','Zen Estilo','Ritz','SX4','Zen','Eeco','Ignis','A-Star','Esteem','SX4 S Cross','Baleno RS','Omni','Estilo'],
  'Hyundai': ['i20','Creta','Grand i10','Verna','i10','Santro Xing','EON','Venue','i20 Active','Santro','Xcent','Accent','Getz','Santa Fe','Grand i10 Nios','Tucson','Aura'],
  'Honda': ['Honda City','Jazz','Amaze','Civic','CR-V','WR-V','Brio','Accord','BR-V','Mobilio'],
  'Mahindra': ['XUV500','Scorpio','Thar','TUV 300','XUV300','Bolero','Quanto','Xylo','KUV 100','Alturas G4','Bolero Power Plus','Supro','e2o Plus'],
  'Toyota': ['Innova','Innova Crysta','Fortuner','Corolla Altis','Etios Liva', 'Toyota Etios','Corolla','Yaris','Urban cruiser','Camry','Etios Cross','Land Cruiser','Land Cruiser Prado','Qualis'],
  'Renault': ['Renault Duster','KWID','Triber','Pulse','Fluence','Lodgy','Captur','Kiger'],
  'Ford': ['Ecosport','Figo','Fiesta','Aspire','Endeavour','Ikon','Freestyle'],
  'Tata': ['Tiago','Nexon','Altroz','Harrier','Hexa','Indica','Nano','New Safari','Safari Storme','Manza','Zest','Bolt','Sumo Victa','Indica eV2'],
  'BMW': ['BMW 5 Series','BMW 3 Series','BMW X1','BMW X5','BMW X3','BMW X6','BMW 3 Series GT','BMW 6 Series','BMW 7 Series','BMW Z4','BMW X7'],'Volkswagen' : ['Polo','Vento','Jetta','Ameo','Beetle','CrossPolo','Passat','Taigun'],
  'Skoda' : ['Rapid','Octavia','Superb','Fabia','New Laura','Kodiaq','Kushaq','Slavia'],
  'Mercedes-Benz' : ['C-Class','E-Class','GLE','GLC','CLA','M-Class','GL-Class','GLA'],
  'MG' : ["MG Hector","MG Hector Plus","MG Astor"],
  "Kia" : ["Seltos", "Sonet", "Carnival"],
  "Audi" : ["Q3", "Q5", "A6", "Q7", "A3", "A4"],
  "Chevrolet": ["Beat", "Enjoy", "Spark", "Cruze", "Optra"],
  "Fiat" : ["Punto", "Linea", "Avventura", "Palio"],
  "Nissan" : ['Kicks','Micra','Sunny','Teana','Terrano','X-Trail']
};

var sanu = document.getElementById('brand')
sanu.addEventListener('change', function() {
var category = jQuery(this).val(),
$model = jQuery('#model'),
newOptions = optionsMap[category];

$model.empty();
$.each(newOptions, function(key,value) {
$model.append(jQuery("<option></option>").attr("value", value).text(value));
});
})
