let dataTable, dataTable2;
let dataTableIsInitialized = false;

const dataTableOptions = {
    lengthMenu: [10, 25, 50],
    columnDefs: [
        {className: "centered", targets: [0, 1, 2, 3, 4]},
        {orderable: false, targets: [3, 4]}
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
        {className: "centered", targets: [0, 1, 2, 3, 4, 5, 6, 7]},
        {orderable: false, targets: [6, 7]}
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

    dataTable = $("#datatable_checkpoints").DataTable(dataTableOptions2);
    dataTable2 = $("#datatable_users").DataTable(dataTableOptions);

    dataTableIsInitialized = true;
};

const listUsers = async() => {
    try {
        const response = await fetch("https://jsonplaceholder.typicode.com/users");
        const data = await response.json();

        let content2 = ``;
        data.forEach((user, users) => {
            content2 += `
            <tr>
                <td>${user.id}</td>
                <td>${user.address.street}</td>
                <td>Q1200</td>
                <td>500</td>
                <td>0</td>
                <td>${users + 1}</td>
                <td><i class="bi bi-check-lg" style="color: green;"> Activo</i></td>
                <td>
                    <button class="btn btn-sm btn-outline-success"><i class="bi bi-pencil-square"></i></button>
                    <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                </td>
            </tr>`;
        });

        let content = ``;
        data.forEach((user, users) => {
            content += `
            <tr>
                <td>${user.name}</td>
                <td>${user.company.name}</td>
                <td>${user.id}</td>                
                <td><i class="bi bi-check-lg" style="color: green;"> Activo</i></td>
                <td>
                    <button class="btn btn-sm btn-outline-success"><i class="bi bi-pencil-square"></i></button>
                    <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                </td>
            </tr>`;
        });

        table_checkpoints.innerHTML = content2;
        table_users.innerHTML = content;
    } catch (ex) {
        alert(ex);
    }
};
window.addEventListener("load", async() => {
    await initDataTable();
});