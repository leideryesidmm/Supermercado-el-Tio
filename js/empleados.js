document.getElementById("formulario").addEventListener("submit", crear);

//Agrega Empleados
function crear(e){
  nombre = document.getElementById("nombreE").value
  usuario = document.getElementById("usuarioE").value
  telefono = document.getElementById("telefonoE").value
  direccion = document.getElementById("direccionE").value
  cargo = document.getElementById("cargoE").value

  let empleado = {
    nombre,
    usuario,
    telefono,
    direccion,
    cargo
  }

  if(localStorage.getItem("Empleados") == null){
    let empleados = []
    empleados.push(empleado)
    localStorage.setItem("Empleados",JSON.stringify(empleados))
  } else{
    let empleados = JSON.parse(localStorage.getItem("Empleados"))
    empleados.push(empleado)
    localStorage.setItem("Empleados",JSON.stringify(empleados))
  }

  
  document.getElementById("formulario").reset();
  e.preventDefault();
  console.log("Empleado Guardado Correctamente")
  e.preventDefault()
  leer();  
}

function leer() {
    let empleados = JSON.parse(localStorage.getItem("Empleados"));
    document.getElementById("tbody").innerHTML = ""
    for (let i = 0; i < empleados.length; i++){
        let nombre = empleados[i].nombre
        let usuario = empleados[i].usuario
        let telefono = empleados[i].telefono
        let direccion = empleados[i].direccion
        let cargo = empleados[i].cargo
        
        document.getElementById("tbody").innerHTML += 
        ` <tr>
        <td>${nombre}</td>
        <td>${usuario}</td>
        <td>${telefono}</td>
        <td>${direccion}</td>
        <td>${cargo}</td>
        <td>
          <div class="dropdown show">
            <a class="btn dropdown-toggle" src="images/puntos.png" href="#" role="button" id="desplegable"
              data-toggle="dropdown" aria-haspopup="true">
              <img src="../images/puntos.png" class="align-right" height="30px" width="30px">
            </a>


            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
              <a class="dropdown-item" onclick="usarliminar('${nombre}')" data-toggle="modal" style="background-color:#FFFFFF"
                href="#ventana1">Eliminar</a>
              <a class="dropdown-item" onclick="editar('${nombre}')" data-toggle="modal" style="background-color:#FFFFFF" id="btn-abrir-popup2"
                href="#ventana2">Editar información</a>
              <a class="dropdown-item" data-toggle="modal" style="background-color:#FFFFFF" id="btn-abrir-popup3"
                href="#ventana3">Restablecer contraseña</a>
            </div>
          </div>
        </td>
      </tr>

        `
    }  
}
leer();

function usarliminar(nombre){
    let eliminadop = {
      nombre
    }
  
    if(localStorage.getItem("eliminados") == null){
      let u_eliminados = []
      u_eliminados.push(eliminadop)
      localStorage.setItem("eliminados",JSON.stringify(u_eliminados))
    } else{
      let u_eliminados = JSON.parse(localStorage.getItem("eliminados"))
      u_eliminados.unshift(eliminadop)
      localStorage.setItem("eliminados",JSON.stringify(u_eliminados))
    }
  }

  function eliminar(){
    let empleados = JSON.parse(localStorage.getItem("Empleados"));
    let u_eliminados = JSON.parse(localStorage.getItem("eliminados"));
    for(let i = 0; i<empleados.length; i++){
      if(u_eliminados[0].nombre != null &&  empleados[i].nombre === u_eliminados[0].nombre){
        empleados.splice(i,1);
        u_eliminados.splice(0,1);
      }
      
    }
    
    localStorage.setItem("Empleados",JSON.stringify(empleados));
    localStorage.setItem("eliminados",JSON.stringify(u_eliminados));
    
    leer();
    console.log("Empleado Eliminado Correctamente")
    $('#Empleado eliminado').modal('hide');
  }
  leer();

  function editar(nombre){
    let empleados = JSON.parse(localStorage.getItem("Empleados"));
    for(let i=0; i < empleados.length; i++){
      if(empleados[i].nombre == nombre){
        document.getElementById("ventana2").innerHTML = 
      `<div class="modal-dialog">
      <div class="modal-content">
        <div class="model-header">
          <button tyle="button" class="close" data-dismiss="modal"  aria-hidden="true" style="margin-right: 10px">&times;</button><br>
        </div>  
        <div  style="text-align: center;" id="empl"><h5 align="center">Editar Empleado</h5>
        </div>  
<br>
<div>
  <tr>
    <form id="formularioE">
    <td><label style="margin-left: 10px"> Nombre </label></td>
    <td><Input width="80px" type = "text" id ="nombrew" placeholder="${empleados[i].nombre}" style="margin-left: 85px"/></td>
  </tr>	<br>
  <tr>
    <td><label style="margin-left: 10px"> Usuario </label></td>
    <td><Input width="80px" type = "text" id ="usuariow"  placeholder="${empleados[i].usuario}" style="margin-left: 89px"/></td><br>
  </tr>
  <tr>
    <td><label style="margin-left: 10px"> Direccion </label></td>
    <td><Input width="80px" type = "text" id ="direccionw"  placeholder="${empleados[i].direccion}" style="margin-left: 77px"/></td><br>
  </tr>
  <tr>
    <td><label style="margin-left: 10px"> Telefono </label></td>
    <td><Input width="80px" type = "number" id ="telefonow"  placeholder="${empleados[i].telefono}" style="margin-left: 84px"/></td><br>
  <tr>
    <td> <label style="margin-left: 10px"> Cargo  </label> </td>
    <select width="80px" id="cargow" placeholder="${empleados[i].cargo}" style="margin-left: 101px">
    <option>Administrador</option>
    <option>Cajero</option>
    <option>Domiciliario</option>
    <option>Bodeguero</option>                       
  
</select>
</tr>
</div>						

<br>
<button id="editare" onclick="actualizarr(${i})" class="btn btn-primary">Editar Empleado</button>
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

  function actualizarr(i){
    let empleados = JSON.parse(localStorage.getItem("Empleados"));
    empleados[i].nombre = document.getElementById("nombrew").value;
    empleados[i].usuario = document.getElementById("usuariow").value;
    empleados[i].direccion = document.getElementById("direccionw").value;
    empleados[i].telefono = document.getElementById("telefonow").value;
    empleados[i].cargo = document.getElementById("cargow").value;
    localStorage.setItem("Empleados",JSON.stringify(empleados));
    $('#ventana2').modal('hide');
    leer();
  }
  
