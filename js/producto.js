document.getElementById("formulario").addEventListener("submit", crear);

//Agrega Productos
function crear(e){
  nombre = document.getElementById("nombrep").value
  categoria = document.getElementById("categoriap").value
  magnitud = document.getElementById("magnitudp").value
  precio = document.getElementById("preciop").value
  existencias = document.getElementById("existenciasp").value
  min = document.getElementById("minp").value
  max = document.getElementById("maxp").value

  let producto = {
    nombre,
    categoria,
    magnitud,
    precio,
    existencias,
    min,
    max
  }

  if(localStorage.getItem("Productos") == null){
    let productos = []
    productos.push(producto)
    localStorage.setItem("Productos",JSON.stringify(productos))
  } else{
    let productos = JSON.parse(localStorage.getItem("Productos"))
    productos.push(producto)
    localStorage.setItem("Productos",JSON.stringify(productos))
  }
  document.getElementById("formulario").reset();
  e.preventDefault();
  console.log("Producto Guardado Correctamente")
  leer()
  
}


//funcion leer Productos
function leer(){
  let productos = JSON.parse(localStorage.getItem("Productos"));
  document.getElementById("tbody").innerHTML = ""
  for(let i=0; i<productos.length; i++){
    let nombre = productos[i].nombre
    let categoria = productos[i].categoria
    let magnitud = productos[i].magnitud
    let precio = productos[i].precio
    let existencias = productos[i].existencias
    let estado = productos[i].existencias <= productos[i].min ? "Bajo" :
                productos[i].existencias <= productos[i].max && 
                productos[i].existencias > productos[i].min? "Normal" : "Sobreexistencias"

    document.getElementById("tbody").innerHTML += 
      `<tr>
      <td>${i+1}</td>
      <td>${nombre}</td>
      <td>${categoria}</td>
      <td>${magnitud}</td>
      <td>${precio}</td>
      <td>${existencias}</td>
      <td>${estado}</td>
      
      <td><div class="dropdown show">
		  <a class="btn dropdown-toggle" src="images/puntos.png" href="#" role="button" id="desplegable" data-toggle="dropdown" aria-haspopup="true"> 
		  	<img src="../images/puntos.png" class="align-right" height="30px" width="30px"> 
		  </a>

			  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			    <a class="dropdown-item" data-toggle="modal" onclick="productoeliminar('${nombre}')" style="background-color:#FFFFFF" href="#ventana">Eliminar</a>
			    <a class="dropdown-item" data-toggle="modal" onclick="editar('${nombre}')" href="#ventana3">Editar</a>
          <a class="dropdown-item" data-toggle="modal" onclick="añadirexistencias('${nombre}', ${existencias})" href="#ventana2">Añadir Existencias</a>          
			  </div>
			  </div>
			</div></td>
    </tr>`
  }
}


//funcion editar
function editar(nombre){
  let productos = JSON.parse(localStorage.getItem("Productos"));
  for(let i=0; i<productos.length; i++){
    if(productos[i].nombre == nombre){
      document.getElementById("ventana3").innerHTML =   
    ` <div class="modal-dialog">
        <div class="modal-content">
          <div class="model-header">
            <button tyle="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin-right: 10px">&times;</button><br>
          </div>
            <div style="text-align: center;" id="vent"><h4 align="center">Editar Producto</h4>
<br>
<div>
    <tr>
      <form id="formulario">
      <td><label> Nombre </label></td>
      <td><Input width="80px" type = "text" id ="nombrenew"  placeholder="${productos[i].nombre}" style="margin-left: 85px"/></td>
    </tr> <br>
    <tr>
      <td><label> Precio </label></td>
      <td><Input width="80px" type = "number" id ="precionew"  placeholder="${productos[i].precio}" style="margin-left: 100px"/></td><br>
    </tr>
      <td><label> Magnitud </label></td>
      <td><Input width="80px" type = "text" id ="magnitudnew"  placeholder="${productos[i].magnitud}" style="margin-left: 76px"/></td><br>
    </tr>
    <tr>
      <td><label> Cantidad Minima en bodega </label></td>
      <td><Input type = "number" id ="minnew" placeholder="${productos[i].min}" style="margin-left: 20px;width:50px"/></td>
    </tr>   <br>        
  <tr>
    <td><label style="margin-left: 0px"> Cantidad maxima en bodega </label></td>
    <td><Input type = "number" id ="maxnew" placeholder="${productos[i].max}" style="margin-left: 20px;width:50px"/></td>
  </tr>
</div>            
  
 <br>
<button id="editarp" onclick="actualizar(${i})" class="btn btn-primary">Editar Producto</button>
</form>
<br><br>
            </div>
          
        </div>
      </div>
</div>
    ` 
    }
  }
}

//funcion actualizar
function actualizar(i){
  let productos = JSON.parse(localStorage.getItem("Productos"));
  productos[i].nombre = document.getElementById("nombrenew").value;
  productos[i].precio = document.getElementById("precionew").value;
  productos[i].magnitud = document.getElementById("magnitudnew").value;
  productos[i].min = document.getElementById("minnew").value;
  productos[i].max = document.getElementById("maxnew").value;
  localStorage.setItem("Productos",JSON.stringify(productos));
  $('#ventana3').modal('hide');
  leer();
}

//funcion producto a eliminar
function productoeliminar(nombre){
  let eliminadoP = {
    nombre
  }

  if(localStorage.getItem("EliminadosP") == null){
    let eliminadosP = []
    eliminadosP.push(eliminadoP)
    localStorage.setItem("EliminadosP",JSON.stringify(eliminadosP))
  } else{
    let eliminadosP = JSON.parse(localStorage.getItem("EliminadosP"))
    eliminadosP.unshift(eliminadoP)
    localStorage.setItem("EliminadosP",JSON.stringify(eliminadosP))
  }
  
}

//funcion eliminar
function eliminar(){
  let productos = JSON.parse(localStorage.getItem("Productos"));
  let eliminadosP = JSON.parse(localStorage.getItem("EliminadosP"));
  for(let i = 0; i<productos.length; i++){
    if(eliminadosP[0].nombre != null &&  productos[i].nombre === eliminadosP[0].nombre){
      productos.splice(i,1);
      eliminadosP.splice(0,1);
    }
    
  }
  
  localStorage.setItem("Productos",JSON.stringify(productos));
  localStorage.setItem("EliminadosP",JSON.stringify(eliminadosP));
  
  
  console.log("Producto Eliminado Correctamente")
  $('#ventana').modal('hide');
  leer();

}

//funcion añadir existencias
function añadirexistencias(nombre, existencias){
  let deudores = JSON.parse(localStorage.getItem("Deudores"));
  document.getElementById("ventana2").innerHTML =  
    `<div class="modal-dialog">
        <div class="modal-content">
          <div class="model-header">
            <button tyle="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin-right: 10px">&times;</button><br>
            </div>
            <div style="text-align: center;" id="vent"><h4 align="center">Añadir existencias</h4><br>
              <label> N° Existencias entrantes </label>
              <Input type = "number" id ="existenciasn" value = "0" style="margin-left: 70px"/></label><br><br>
              <button type="button" onclick="añadirEx('${nombre}',${existencias})" id="btnexistencias" class="btn btn-primary">Añadir</button>
              </div> <br>
          
          </div>
        </div>
      </div>`
  
}


//funcion de Añadir Existencias pt2
function añadirEx(nombre, existencias){
  let productos = JSON.parse(localStorage.getItem("Productos"));
  let existenciasAñadidas = document.getElementById("existenciasn").value;
  let nuevasExistencias = parseInt(existencias) + parseInt(existenciasAñadidas);   
  for(let i = 0; i<productos.length; i++){
    if(productos[i].nombre === nombre){
      productos[i].existencias = nuevasExistencias;
    }
    localStorage.setItem("Productos",JSON.stringify(productos));
    leer();
    }
  console.log("Existencias añadidas Correctamente")
  $('#ventana2').modal('hide');
}


leer();