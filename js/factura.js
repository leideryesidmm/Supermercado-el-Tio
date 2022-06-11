const factura = [];
const ventasRealizadas = [];
var fecha = new Date();
let fechahoy = ""
fechahoy += fecha.getDate() + "/";
fechahoy += fecha.getDay() + "/";
fechahoy += fecha.getFullYear();
fechahoy += "";

const newOptions = [
    { id: 1, nombre: 'Panela La renta', precio: 700 },
    { id: 2, nombre: 'Arroz Zulia', precio: 3600 },
    { id: 3, nombre: 'Harina Arepasan', precio: 3700 },
];

class registarVenta {
    constructor(id, fecha, vendedor, total) {
        this.id = id;
        this.fecha = fecha;
        this.vendedor = vendedor;
        this.total = total;
    }
}
class facproducto {
    constructor(nombre, cantida, precio, total) {
        this.nombre = nombre;
        this.cantida = cantida;
        this.precio = precio;
        this.total = total;
    }
}

function createfecha() {
    let stringlabe = "<label ><strong>Fecha:</strong></label><label id='fecha-hoy' style='margin-left: 5px'> "
    stringlabe += fechahoy;
    stringlabe += " </label>";
    let stringfechafia = "<label id='saldo' ><strong>Fecha:</strong></label><label id='Fecha' class='form-control' aria-readonly=''> "
    stringfechafia += fechahoy;
    stringfechafia += " </label>";    document.getElementById("crear-fecha").innerHTML = stringlabe;
    document.getElementById("fecha-fiada").innerHTML = stringfechafia;
    document.getElementById("id-venta").innerHTML = ventasRealizadas.length + 1;
}

function solonumeros(e) {

    key = e.keycode || e.which;

    teclado = String.fromCharCode(key);

    numeros = "0123456789";

    especiales = "8-37-38-46";

    teclado_especial = false;

    for (var i in especiales) {
        if (key == especiales[i]) {
            teclado_especial = true;
        }
    }

    if (numeros.indexOf(teclado) == -1 && !teclado_especial) {
        return false;
    }
}

function llenarSelect(list) {
    const select = document.getElementById('select');
    console.log(select.length);
    if (select.length == 1) {
        for (let index = 0; index < newOptions.length; index++) {
            console.log(newOptions[index].nombre);
            const option = document.createElement('option');
            option.text = newOptions[index].nombre;
            option.value = index.id;
            select.appendChild(option);
        }
    }
}

let createTotal = function () {
    var totalApagar = 0;
    for (let index = 0; index < factura.length; index++) {
        totalApagar += factura[index].total;
    }
    let stringlabe = "<label class='total'><strong>Total a Pagar:</strong></label><label id='totalVenta' class='total' style='margin-left: 5px'> "
    stringlabe += totalApagar;
    stringlabe += " </label>";

    return stringlabe;
}



let creartabla = function (lista) {
    var cantida = document.getElementById("recipient-cant").value;
    let stringtabla = "<tr><th></th><th width='50%' class='text-center'>Productos</th><th class='text-center'>Cantidad</th><th class='text-center'>Valor Unitario</th><th class='text-center'>Subtotal</th></tr>";
    for (const factura of lista) {
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
        fila += factura.total;
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
            factura.push(new facproducto(newOptions[index].nombre, cantida, newOptions[index].precio, precio));

        }
    }
    if (facproducto.length != 0) {
        document.getElementById("total-apagar").innerHTML = createTotal();
    }
    console.log(factura);
    document.getElementById("table-factura").innerHTML = creartabla(factura);
}

function guardarVenta() {
    var numeroventa = document.getElementById("id-venta").innerHTML;
    var vendedor = document.getElementById("nombreVendedor").value;
    var fechaVenta = fechahoy;
    var total = parseInt(document.getElementById("totalVenta").innerHTML);
    alert(total);
    if (vendedor != '') {
        if (total != 0) {
            ventasRealizadas.push(new registarVenta(numeroventa, vendedor, fechaVenta, total));
            console.log(ventasRealizadas);
        } else {
            alert("Agrega productos al venta");
        }
    } else {
        alert("Debe llenar el campo vendedor");
    }

}


createfecha();
document.getElementById("btnRegVenta").addEventListener("click", guardarVenta, true);
document.getElementById("btn-abrir-popupselectproducto").addEventListener("click", llenarSelect, true);
document.getElementById("agregar-producto").addEventListener("click", resultado, false)

