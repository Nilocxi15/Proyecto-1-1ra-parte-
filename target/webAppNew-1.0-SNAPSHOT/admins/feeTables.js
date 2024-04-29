let dataTable, dataTable2;
let dataTableIsInitialized = false;

const dataTableOptions = {
    lengthMenu: [5, 10, 25],
    columnDefs: [
        {className: "centered", targets: [0, 1, 2]},
        {orderable: false, targets: [2]}
    ],
    pageLength: 4,
    destroy: true,
    language: {
        lengthMenu: "Mostrar _MENU_ registros por página",
        zeroRecords: "Ningún usuario encontrado",
        info: "Mostrando de _START_ a _END_ de un total de _TOTAL_ registros",
        infoEmpty: "Ningún usuario encontrado",
        infoFiltered: "(filtrados desde _MAX_ registros totales)",
        search: "Buscar",
        loadingRecords: "Cargando..."
    }
};

const dataTableOptions2 = {
    lengthMenu: [10, 25, 50],
    columnDefs: [
        {className: "centered", targets: [0, 1, 2, 3]},
        {orderable: false, targets: [2, 3]}
    ],
    pageLength: 4,
    destroy: true,
    language: {
        lengthMenu: "Mostrar _MENU_ registros por página",
        zeroRecords: "Ningún usuario encontrado",
        info: "Mostrando de _START_ a _END_ de un total de _TOTAL_ registros",
        infoEmpty: "Ningún usuario encontrado",
        infoFiltered: "(filtrados desde _MAX_ registros totales)",
        search: "Buscar",
        loadingRecords: "Cargando..."
    }
};

const initDataTable = async() => {
    if (dataTableIsInitialized) {
        dataTable.destroy();
        dataTable2.destroy();
    }

    await listUsers();
    await listUsers2();

    dataTable = $("#datatable_weight").DataTable(dataTableOptions);
    dataTable2 = $("#datatable_routesFee").DataTable(dataTableOptions2);

    dataTableIsInitialized = true;
};

const listUsers = async() => {
    try {
        const response = await fetch("https://jsonplaceholder.typicode.com/users");
        const data = await response.json();

        let content = ``;
        data.forEach((user, users) => {
            content += `
            <tr>
                <td>${user.id}</td>
                <td>Q${user.address.geo.lat}</td>
                <td>
                    <button class="btn btn-sm btn-outline-success"><i class="bi bi-pencil-square"></i></button>
                    <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                </td>
            </tr>`;
        });

        table_weight.innerHTML = content;
    } catch (ex) {
        alert(ex);
    }
};

const listUsers2 = async() => {
    try {
        const response = await fetch("https://jsonplaceholder.typicode.com/todos");
        const data = await response.json();

        let content = ``;
        data.forEach((todo, todos) => {
            content += `
            <tr>
                <td>${todo.userId}</td>
                <td>${todo.id}</td>            
                <td style="color: blue;">${todo.completed}</td>
                <td>
                    <button class="btn btn-sm btn-outline-success"><i class="bi bi-pencil-square"></i></button>
                    <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                </td>
            </tr>`;
        });

        table_routesFee.innerHTML = content;
    } catch (ex) {
        alert(ex);
    }
};

window.addEventListener("load", async() => {
    await initDataTable();
});