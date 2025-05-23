<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/adminstyle.css" />
    <link rel="stylesheet" href="css/holidaystyle.css">

    <title>Admin | Add Holidays | LMS</title>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
      <div class="bg-white" id="sidebar-wrapper">

            <div class="list-group list-group-flush my-3 mt-5">
               <a  href="/Admindashboard?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text active me-2"><i
                        class="fas fa-tachometer-alt "></i> Admin Dashboard</a>


                <a href="/viewLeaveformAdmin?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-house-add"></i> Apply Leave</a>


               <a href="/viewHoliday?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-calendar-day"></i> View Holidays</a>


                <a href="/viewAddEmployee?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-person-fill-add"></i> Add Employee</a>


               <a href="/viewEmployee?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-person-plus"></i>
                    View Employee </a>


                <a href="/viewApproveLeave?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-check2-circle"></i> Approve Leave</a>


	               <!--  <a href="updateform.jsp"
	                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
	                        class="bi bi-person-add"></i> Update Employee</a> -->


                 <a href="/viewAddHoliday?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-building-fill-add"></i> Add Holiday</a>


                <a href="/viewAddProject?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-card-checklist "></i> Add Project</a>


                <a href="/viewProjects?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-card-list "></i> View Projects </a>


               <a href="/viewAdminResetPassword?id=${employee.id}"				
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-key-fill"></i> Reset Password</a>

            </div>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0">Leave Management</h2>
                </div>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle second-text fw-bold" href="#" id="navbarDropdown"
                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user me-2"></i>Admin
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="adminProfile?id=${employee.id}">Profile</a></li>
                                <li><a class="dropdown-item" href="/logout">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>



            <!-- start -->
            <div class="container shadow" style="margin-top: 70px;">
                <div class="title">Add holiday</div>
                <form action="/addHoliday" method="POST" onsubmit="return validateForm()">
                    <div class="Employe-Details">
                        <div class="input-box">
                            <span class="details">Holiday Name</span>
                            <input type="text" id="holidayname" name="occasion" class="form-control">
                            <span id="holidayError" class="text-danger"></span>
                        </div>
                        <!-- drop-down for leave type -->
                        <!-- <div class="input-box">
                            <span class="details">Description</span>
                            <input type="textarea" id="res" name="res" class="form-control">
                        </div> -->

                        <div class="input-box">
                            <span class="details"> Date </span>
                            <input type="date" id="To" name="dates" class="form-control">
                            <span id="ToError" class="text-danger"></span>
                        </div>

                        <button type="submit" class="btn btn-dark btn-block Btn mt-3">Submit</button>


                </form>
                <!-- /#page-content-wrapper -->
    
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                var el = document.getElementById("wrapper");
                var toggleButton = document.getElementById("menu-toggle");

                toggleButton.onclick = function () {
                    el.classList.toggle("toggled");
                };
            </script>
         <!-- validation for date  -->
         <script>
         
                //  function isHoliday(date) {
                //         return holidays.includes(date.toISOString().split('T')[0]);
                //     }

                    function isWeekend(date) {
                        const dayOfWeek = date.getDay();
                        return dayOfWeek == 0 || dayOfWeek == 6;
                    }
                    var inputto = document.getElementById('To');
                    var flag=1;
                    inputto.addEventListener('change', function (event) {
                        const date = new Date(event.target.value);

                        // if (isHoliday(date)) {
                        //     document.getElementById("ToError").innerHTML = "You cant select public holiday.";
                        //     event.target.value = event.target.defaultValue;
                        // }

                        if (isWeekend(date)) {
                            document.getElementById("ToError").innerHTML = "You can't select weekend date.";
                            event.target.value = event.target.defaultValue;
                        }
                    });
                   // end for weekend validation 
                      
                  
                    // To date validation start from here 
                    var TtodayDate = new Date();
                    var Tmonth = TtodayDate.getMonth()+1;
                    var Tyear = TtodayDate.getUTCFullYear();
                    var Ttdate = TtodayDate.getDate();
                    if (Tmonth < 10) {
                        Tmonth = "0" + Tmonth
                    }
                    if (Ttdate < 10) {
                        Ttdate = "0" + Ttdate;
                    }
                    // wekend validation

                    var TmaxDate = Tyear + "-" + Tmonth + "-" + Ttdate;
                    document.getElementById("To").setAttribute("min", TmaxDate);

                    console.log(TmaxDate);

                    // end validation To date 

                
                    let  holidayname= document.getElementById("holidayname");
                    let holidaynamecheck = /^[A-Za-z. ]{2,50}$/;
                   
                 


                 function validateForm() {

                   

                    // validation for name 
                   if (holidayname.value == "") {

                   document.getElementById("holidayError").innerHTML = "Holiday Name is required.";
                   flag = 0;

                  } else if (holidayname.value.length <2) {
                 document.getElementById("holidayError").innerHTML = " Minimum length should be 2 characters.";
                   flag = 0;
                 } else if (holidayname.value.length >50) {
                   document.getElementById("holidayError").innerHTML = " Maximum length should be 20 characters.";
                   flag = 0;
                 } else if (!holidaynamecheck.test(holidayname.value)) {
                 document.getElementById("holidayError").innerHTML = "  This should be in characters only.";
                 flag = 0;
                 } else {
                  document.getElementById("holidayError").innerHTML = "";
                    flag=1;

                    }

                  // from date validation start from here. 
                  if (inputto.value.length == "") {
                      document.getElementById("ToError").innerHTML = "Date is required.";
                      flag = 0;
                       }
                    else {
                    document.getElementById("ToError").innerHTML = "";

                   }




                  if (flag) {
                    return true;
                    } else {
                  return false;
                 }



            }

// email validation start from here.  




            

       </script>
</body>

</html>