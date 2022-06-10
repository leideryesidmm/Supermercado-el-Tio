// alert("hola mundo");
// class producto {
//     constructor(id_producto, nombre, precio, existencias, cant_minima, id_magnitud,
//         id_tipoProducto, cant_maxima) {
//         this.id_producto = id_producto;
//         this.nombre = nombre;
//         this.precio = precio;
//         this.existencias = existencias;
//         this.cant_minima = cant_minima;
//         this.id_magnitud = id_magnitud;
//         this.id_tipoProducto = id_tipoProducto;
//         this.cant_maxima = cant_maxima;
//     }
// }
// new producto(1, 'Panela La renta', 700, 32, 10, 3, 5, 50);
// new producto(2, 'Arroz Zulia', 3600, 43, 15, 1, 5, 70);
// new producto(3, 'Harina Arepasan', 3700, 28, 12, 1, 5, 50);
// new producto(4, 'Arroz Ideal', 3500, 32, 15, 1, 5, 70);
const factura = [];

const newOptions = [
    { id: 1, nombre: 'Panela La renta', precio: 700 },
    { id: 2, nombre: 'Arroz Zulia', precio: 3600 },
    { id: 3, nombre: 'Harina Arepasan', precio: 3700 },
];

class facproducto{
    constructor(nombre,cantida,precio,total){
        this.nombre = nombre;
        this.cantida = cantida;
        this.precio = precio;
        this.total = total;
    }
}

function llenarSelect(list) {
    const select = document.getElementById('select');
    console.log(select.length);
    if (select.length==1) {
        for (let index = 0; index < newOptions.length; index++) {
            console.log(newOptions[index].nombre);
            const option = document.createElement('option');
            option.text = newOptions[index].nombre;
            option.value = index.id;
            select.appendChild(option);
        }   
    }
}

let creartabla = function (lista) {
    var cantida = document.getElementById("recipient-cant").value;
    let stringtabla = "<tr><th></th><th width='50%' class='text-center'>Productos</th><th class='text-center'>Cantidad</th><th class='text-center'>Valor Unitario</th><th class='text-center'>Subtotal</th></tr>";
    for (const factura of lista){
        let fila = "<tr><td><input class='form-check-input' type='checkbox' value='' id='flexCheckDefault' style='margin-left: 3px'></td><td>"
        fila += factura.nombre;
        fila += "</td>"

        fila += "<td>"
        fila += factura.cantida;
        fila += "</td>"
        
        fila += "<td>"
        fila += factura.precio;
        fila += "</td>"
        
        fila += "<td>"
        fila += cantida * factura.precio;
        fila += "</td>"

        fila += "</tr>";
        stringtabla += fila;
        console.log(stringtabla);
    }
    return stringtabla;
}

function resultado() {
    var selecionSelect = select.selectedIndex;
    var cantida = document.getElementById("recipient-cant").value;
    console.log("Selec " + selecionSelect);
    console.log("can " + cantida);
    for (let index = 0; index < newOptions.length; index++) {
        if (selecionSelect == newOptions[index].id) {
            var precio = cantida * newOptions[index].precio;
            factura.push(new facproducto(newOptions[index].nombre,cantida,newOptions[index].precio,precio));
        }
    }
    console.log(factura);
    document.getElementById("table-factura").innerHTML = creartabla(factura);
}

document.getElementById("btn-abrir-popupselectproducto").addEventListener("click", llenarSelect, true);
document.getElementById("agregar-producto").addEventListener("click", resultado, false);


