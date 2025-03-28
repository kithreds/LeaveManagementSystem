<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="css/adminstyle.css" />
<link rel="stylesheet" href="css/projectstyle.css">


<title>Admin | Add Project | LMS</title>
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


                <a href="/viewAddEmployee?id=<c:out value="${employee.id}"/>"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-person-fill-add"></i> Add Employee</a>


                <a href="/viewEmployee?id=<c:out value="${employee.id}"/>"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-person-plus"></i>
                    View Employee </a>


                <a href="/viewApproveLeave?id=<c:out value="${employee.id}"/>"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-check2-circle"></i> Approve Leave</a>


                <a href="/viewAddHoliday?id=<c:out value="${employee.id}"/>"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-building-fill-add"></i> Add Holiday</a>


                  <a href="/viewAddProject?id=<c:out value="${employee.id}"/>"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-card-checklist "></i> Add Project</a>


                 <a href="/viewProjects?id=<c:out value="${employee.id}"/>"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-card-list "></i> View Projects </a>


                <a href="/viewAdminResetPassword?id=<c:out value="${employee.id}"/>"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-key-fill"></i> Reset Password</a>

            </div>
        </div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<nav
				class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
				<div class="d-flex align-items-center">
					<i class="fas fa-align-left primary-text fs-4 me-3"
						id="menu-toggle"></i>
					<h2 class="fs-2 m-0">Leave Management</h2>
				</div>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle second-text fw-bold" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> <i class="fas fa-user me-2"></i>Admin
						</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="adminProfile?id=${employee.id}">Profile</a></li>
									</l>
								<li><a class="dropdown-item" href="/logout">Logout</a></li>
							</ul></li>
					</ul>
				</div>
			</nav>



			<!-- start -->
			<div class="container shadow" style="margin-top: 50px;">
				<div class="title">Add Project</div>
				<form action="/addProject" method="POST" onsubmit="return validateForm()">
					<div class="Employe-Details">
						<div class="input-box">
							<span class="details">Project Name</span> <input type="text"
								id="projectname" name="projectname" class="form-control">
							<span id="projectError" class="text-danger"></span>
						</div>

					
							<div class="input-box">
								<span class="details">Assigned Manager</span> 
								<input type="text" name="assignedTeam" id="assignedTeam" class="form-control">
								
								
								<%-- <c:forEach items="employee" var="employee">
									<option value="${employee.name}">${employee.name}</option>
									
								</select>
									</c:forEach> --%>
									
									
									
							</div>
							<span id="AssignedError" class="text-danger"></span>
						</div>
						<div class="input-box">
							<span class="details">Start Date</span> <input type="date"
								id="from" name="fromDate" class="form-control datepicker"> <span
								id="fromError" class="text-danger"></span>
						</div>

						<div class="input-box">
							<span class="details">Description</span>
							<textarea maxlength="100" id="description" name="description"
								class="form-control"
								placeholder="Describe project details here..."></textarea>

							<span id="resError" class="text-danger"></span>
						</div>
						<div class="input-box">
							<span class="details">End Date</span> <input type="date" id="To"
								name="toDate" class="form-control "> <span id="ToError"
								class="text-danger"></span>
						</div>
						<button type="submit" class="btn btn-dark btn-block Btn mt-3">Submit</button>
				</form>
				<!-- /#page-content-wrapper -->
					
			</div>

			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
			<script>
                var el = document.getElementById("wrapper");
                var toggleButton = document.getElementById("menu-toggle");

                toggleButton.onclick = function () {
                    el.classList.toggle("toggled");
                };
            </script>

			<!-- javaScript validation start from here  -->

			<script>
                //const holidays = ['2023-01-23', '2023-01-26', '2023-02-26', '2023-02-05', '2023-02-18', '2023-03-08', '2023-03-22', '2023-03-30', '2023-04-04', '2023-04-07', '2023-04-14', '2023-04-22', '2023-05-01', '2023-05-05', '2023-06-29', '2023-07-29', '2023-08-15', '2023-12-25', '2023-11-27', '2023-11-15', '2023-11-13', '2023-11-12', '2023-10-24', '2023-10-23', '2023-10-22', '2023-10-21', '2023-10-02', '2023-09-28', '2023-09-19', '2023-09-07', '2023-08-31', '2023-08-16', '2023-01-01', '2022-07-04', '2022-12-25'];
				var holidays =[];
					fetch('/fetchdata')
					.then(response => response.json())
					.then(dates => {
					    // process the data
					    
						dates.forEach(date => holidays.push(date));
						 
						 
					})
					.catch(error => {
					    // handle errors
					});                     
					      console.log(holidays);
					      
                function isHoliday(date) {
                    return holidays.includes(date.toISOString().split('T')[0]);
                }
                function isWeekend(date) {
                    const dayOfWeek = date.getDay();
                    return dayOfWeek == 0 || dayOfWeek == 6;
                }
                var inputfrom = document.getElementById('from');
                var inputto = document.getElementById('To');

                inputfrom.addEventListener('change', function (event) {
                    const date = new Date(event.target.value);
                    if (isHoliday(date)) {
                        document.getElementById("fromError").innerHTML = "You can't select public holiday.";
                        event.target.value = event.target.defaultValue;
                    }
                    if (isWeekend(date)) {
                        document.getElementById("fromError").innerHTML = "You can't select weekend date.";
                        event.target.value = event.target.defaultValue;
                    }
                }
                );
                inputto.addEventListener('change', function (event) {
                    const date = new Date(event.target.value);
                    if (isHoliday(date)) {
                        document.getElementById("ToError").innerHTML = "You can't select public holiday.";
                        event.target.value = event.target.defaultValue;
                    }
                    if (isWeekend(date)) {
                        document.getElementById("ToError").innerHTML = "You can't select weekend date.";
                        event.target.value = event.target.defaultValue;
                    }
                });

                //From date validation 

                let projectname = document.getElementById("projectname");
                let assignedteam = document.getElementById("assignedteam");
                let assignedteamcheck = /^[A-Za-z0-9. ]{20,100}$/;
                let projectnamecheck = /^[A-Za-z. ]{2,50}$/;
                let description = document.getElementById("description");
                let descriptioncheck = /^[A-Za-z. ]{20,100}$/;
                var from = document.getElementById("from");
                var To = document.getElementById("To");
                var flag = 1;

                var FtodayDate = new Date();
                var Fmonth = FtodayDate.getMonth();
                var Fyear = FtodayDate.getUTCFullYear();
                var Ftdate = FtodayDate.getDate();
                if (Fmonth < 10) {
                    Fmonth = "0" + Fmonth
                }
                if (Ftdate < 10) {
                    Ftdate = "0" + Ftdate;
                }
                var FmaxDate = Fyear + "-" + Fmonth + "-" + Ftdate;
                document.getElementById("from").setAttribute("min", FmaxDate);

                console.log(FmaxDate);

                // To date validation start from here 
                var TtodayDate = new Date();
                var Tmonth = TtodayDate.getMonth();
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




                function validateForm() {


                    if (projectname.value == "") {

                        document.getElementById("projectError").innerHTML = "Project Name is required. ";
                        flag = 0;

                    } else if (projectname.value.length < 2) {
                        document.getElementById("projectError").innerHTML = " Minimum length should be 2 characters.";
                        flag = 0;
                    } else if (projectname.value.length > 50) {
                        document.getElementById("projectError").innerHTML = "Maximum length should be 50 characters.";
                        flag = 0;
                    } else if (!projectnamecheck.test(projectname.value)) {

                        document.getElementById("projectError").innerHTML = " This should be in characters only.";
                        flag = 0;
                    } else {
                        document.getElementById("hprojectError").innerHTML = "";
                        flag = 1;

                    }
                    // validation for description 
                    if (description.value == "") {

                        document.getElementById("resError").innerHTML = "Project details is required.";
                        flag = 0;

                    } else if (description.value.length < 20) {
                        document.getElementById("resError").innerHTML = " Minimum length should be 20 characters.";
                        flag = 0;
                    } else if (description.value.length > 100) {
                        document.getElementById("resError").innerHTML = " Maximum length should be 100 characters.";
                        flag = 0;
                    } else if (!descriptioncheck.test(description.value)) {
                        document.getElementById("resError").innerHTML = " This should be in characters only.";
                        flag = 0;
                    } else {
                        document.getElementById("resError").innerHTML = "";

                    }

                    // from date validation start from here. 
                    if (from.value.length == "") {
                        document.getElementById("fromError").innerHTML = "Start date is required.";
                        flag = 0;
                    }
                    else {
                        document.getElementById("fromError").innerHTML = "";

                    }


                    // To date validation start from here.

                    if (To.value.length == "") {
                        document.getElementById("ToError").innerHTML = "End date is required.";
                        flag = 0;
                    }
                    else if (from.value > To.value) {

                        document.getElementById("ToError").innerHTML = "You can't select this date.";
                        flag = 0;
                    }
                    else {
                        document.getElementById("ToError").innerHTML = "";

                    }

                    //     // Assigned Team validation
                    //     if (assignedteam.value == "") {

                    //     document.getElementById("AssignedError").innerHTML = "Team Member is required.";
                    //   flag = 0;

                    //   } else if ( assignedteam.value.length < 20) {
                    //   document.getElementById("AssignedError").innerHTML = "  Minimum length should be 20 characters.";
                    //  flag = 0;
                    //  } else if ( assignedteam.value.length > 100) {
                    //  document.getElementById("AssignedErrorr").innerHTML = "  Maximum length should be 100 characters.";
                    //   flag = 0;
                    //  } else if (!assignedteamcheck.test( assignedteam.value)) {
                    //  document.getElementById("AssignedError").innerHTML = "  This should be in characters only.";
                    // flag = 0;
                    // } else {
                    // document.getElementById("AssignedError").innerHTML = "";

                    //    } 


                    if (flag) {
                        return true;
                    } else {
                        return false;
                    }



                }




            </script>
</body>

</html>