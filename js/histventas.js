const ventasRealizadas = [ 
    { id: 1, nombre: '11/5/2022', vendedor: "Luis", total: 10000},
    { id: 2, nombre: '6/6/2022', vendedor: "Andres", total: 20000 },
    { id: 3, nombre: '4/1/2022', vendedor: "Luis", total: 58000 },
    { id: 1, nombre: '7/5/2022', vendedor: "Maria", total: 41000},
    { id: 2, nombre: '6/2/2022', vendedor: "Diana", total: 25500 },
    { id: 3, nombre: '3/2/2022', vendedor: "Diana", total: 352000 },
];

let creartablaventas = function(lista) {
    let stringtabla = "<tr><th>ID</th><th class='text-center'>Fecha</th><th class='text-center'>Vendedor</th><th class='text-center'>Total</th><th class='text-center'>Fiado</th></tr>";
    for (const ventasRealizadas of lista) {
        let fila = "<tr><td>"
        fila += ventasRealizadas.id;
        fila += "</td>"

        fila += "<td>"
        fila += ventasRealizadas.nombre;
        fila += "</td>"

        fila += "<td>"
        fila += ventasRealizadas.vendedor;
        fila += "</td>"

        fila += "<td>"
        fila += ventasRealizadas.total;
        fila += "</td>"
        fila += "<td><input class='form-check-input' type='checkbox' value='' id='flexCheckDefault' style='margin-left: 3px'></td>"

        fila += "</tr>";
        stringtabla += fila;
        console.log(stringtabla);
    }
    return stringtabla;
}

function generartabla(params) {
    document.getElementById("tabla-ventas-realizadas").innerHTML = creartablaventas(ventasRealizadas);
}

document.getElementById("VentasRealizadas").addEventListener("click", generartabla, true);





