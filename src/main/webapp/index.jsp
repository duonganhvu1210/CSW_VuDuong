<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<div class="container mt-5">

    <h2 class="text-center mb-4">
        Employee Management
    </h2>

    <table class="table table-bordered table-striped">

        <thead class="table-dark">

        <tr>

            <th>ID</th>

            <th>Name</th>

            <th>Salary</th>

        </tr>

        </thead>

        <tbody id="employeeTable">

        </tbody>

    </table>

    <hr>

    <h4>Add Employee</h4>

    <div class="mb-3">

        <input type="number" id="id" class="form-control" placeholder="ID">

    </div>

    <div class="mb-3">

        <input type="text" id="name" class="form-control" placeholder="Name">

    </div>

    <div class="mb-3">

        <input type="number" id="salary" class="form-control" placeholder="Salary">

    </div>

    <button class="btn btn-success" onclick="addEmployee()">

        Add Employee

    </button>

    <hr>

    <h4>Update Employee</h4>

    <div class="mb-3">

        <input type="number" id="uid" class="form-control" placeholder="ID">

    </div>

    <div class="mb-3">

        <input type="text" id="uname" class="form-control" placeholder="Name">

    </div>

    <div class="mb-3">

        <input type="number" id="usalary" class="form-control" placeholder="Salary">

    </div>

    <button class="btn btn-primary" onclick="updateEmployee()">

        Update Employee

    </button>

</div>

<script>

    loadEmployees();

    function loadEmployees(){

        fetch("employees")

            .then(response => response.json())

            .then(data=>{

                let html="";

                data.forEach(e=>{

                    html+=`
                    <tr>
                        <td>${e.id}</td>
                        <td>${e.name}</td>
                        <td>${e.salary}</td>
                    </tr>
                    `;

                });

                document.getElementById("employeeTable").innerHTML=html;

            });

    }

    function addEmployee(){

        const employee={

            id:parseInt(document.getElementById("id").value),

            name:document.getElementById("name").value,

            salary:parseFloat(document.getElementById("salary").value)

        };

        fetch("employees",{

            method:"POST",

            headers:{
                "Content-Type":"application/json"
            },

            body:JSON.stringify(employee)

        })

        .then(res=>res.text())

        .then(msg=>{

            alert(msg);

            loadEmployees();

        });

    }

    function updateEmployee(){

        const employee={

            id:parseInt(document.getElementById("uid").value),

            name:document.getElementById("uname").value,

            salary:parseFloat(document.getElementById("usalary").value)

        };

        fetch("employees",{

            method:"PUT",

            headers:{
                "Content-Type":"application/json"
            },

            body:JSON.stringify(employee)

        })

        .then(res=>res.text())

        .then(msg=>{

            alert(msg);

            loadEmployees();

        });

    }

</script>

</body>

</html>
