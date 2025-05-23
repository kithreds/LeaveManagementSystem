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
    <link rel="stylesheet" href="css/leavestyle.css">
    <title>Manager | Leave Form | LMS</title>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
       <div class="bg-white" id="sidebar-wrapper">
            <div class="list-group list-group-flush my-3 mt-5">
               <a href="/managerDashboard?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text active me-2"><i
                        class="fas fa-tachometer-alt "></i> Manager Dashboard</a>

                        
                <a href="/viewLeaveformManager?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-house-add"></i> Apply Leave</a>


                <a href="/viewHolidayManager?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-calendar-day"></i> View Holidays</a>


                <a href="/viewEmployeeManager?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-person-plus"></i>
                     View Employee </a>


               <a href="/viewApproveLeaveManager?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-check2-circle"></i> Approve Leave</a>


                <a href="/viewProjectsManager?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-card-list "></i> View Projects</a>


                <a href="/viewResetPasswordManager?id=${employee.id}"
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
                                <i class="fas fa-user me-2"></i>Manager
                            </a>
                          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item"
									href="ManagerProfile?id=${employee.id}">Profile</a></li>
								<li><a class="dropdown-item" href="/logout">Logout</a></li>
							</ul>
                        </li>
                    </ul>
                </div>
            </nav>



            <!-- page content main -->
            <div class="container shadow" style="margin-top: 60px;">
                <div class="title">Apply Leave</div>
                <form action="/applyLeaveManager" method="POST" onsubmit="return validateForm()">
                    <div class="Employe-Details">
                        <!-- <div class="input-box">
                            <span class="details">Employee Id</span>
                            <input type="number" id="id" name="id" class="form-control" readonly>
                        </div>-->
				<input type="hidden" name="status" value="pending" class="form-control" readonly>
				<input type="hidden" id="id" name="empId" value="${employee.id}" class="form-control" readonly>
				<input type="hidden" id="id" name="ids" value="${employee.id}" class="form-control" readonly>
				<input type="hidden" id="id" name="role" value="${employee.role}" class="form-control" readonly>
				<input type="hidden" id="id" name="reportingmanager" value="${employee.reportingmanager}" class="form-control" readonly>
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input type="email" id="email" name="email" value="${employee.email}" class="form-control" readonly>
                            <span id="emailError" class="text-danger"></span>
                        </div> 

                        <div class="input-box">
                            <span class="details">From Date</span>
                            <input type="date" id="from" name="fromDate" class="form-control datepicker">
                            <span id="fromError" class="text-danger"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">To Date</span>
                            <input type="date" id="To" name="endDate" class="form-control ">
                            <span id="ToError" class="text-danger"></span>
                        </div>

                        <div class="input-box">
                            <span class="details">Total Days</span>
                            <input type="text" id="Total" name="totalDays" class="form-control " readonly>
                            <!-- <span id="caldate" class="text-danger"></span> -->
                        </div>

                        <!-- drop-down for leave type -->

                        <div class="input-box">
                            <span class="details">Leave Type</span>
                            <select name="leaveType" id="leave type" class="form-control">
                                <option value="SickLeave">Sick Leave</option>
                                <option value="CasualLeave">Casual Leave</option>
                                <option value="PersonalLeave">Personal Leave</option>
                                <option value="MaternityLeave">Maternity Leave</option>
                                <option value="PaternityLeave">Paternity Leave</option>
                                <option value="MarriageLeave">Marriage Leave</option>
                                <option value="AdoptionLeave">Adoption Leave</option>
                            </select>
                        </div>
                        <!-- input box for Reason -->
                        <div class="input-box">
                            <span class="details">Reason</span>
                            <textarea maxlength="100" id="reason" name="reason" class="form-control"
                                placeholder="Describe Reason here..."></textarea>
                            <span id="resError" class="text-danger"></span>
                        </div>
                        <button type="submit" class="btn btn-dark btn-block Btn mt-3">Submit</button>


                </form>
                <!-- weekend validation bootstrap -->

                <!-- javaScript validation start from here  -->



                <script>                                    // 31 sunday          31 is public holidays 
                    var flag = 1;
                    //  yyyy-mm-dd
                    //  jan 1 2023 ==> 2023-01-01
                    //   const holidays = ['2023-01-01', '2022-07-04', '2022-12-25'];
                    const holidays = ['2023-01-23', '2023-01-26', '2023-02-26', '2023-02-05', '2023-02-18', '2023-03-08', '2023-03-22', '2023-03-30', '2023-04-04', '2023-04-07', '2023-04-14', '2023-04-22', '2023-05-01', '2023-05-05', '2023-06-29', '2023-07-29', '2023-08-15', '2023-12-25', '2023-11-27', '2023-11-15', '2023-11-13', '2023-11-12', '2023-10-24', '2023-10-23', '2023-10-22', '2023-10-21', '2023-10-02', '2023-09-28', '2023-09-19', '2023-09-07', '2023-08-31', '2023-08-16', '2023-01-01', '2022-07-04', '2022-12-25'];

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
                            document.getElementById("fromError").innerHTML = "You can't' select weekend date.";
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


                    // end bvalidation for weekend and holidays 

                    let email = document.getElementById("email");
                    let emailcheck = /^[A-Za-z_.0-9]{6,30}@[A-Za-z]{2,12}.[A-Za-z.]{2,8}$/;
                    let reason = document.getElementById("reason");
                    let reasoncheck = /^[A-Za-z. ]{20,100}$/;
                    var from = document.getElementById("from");
                    var To = document.getElementById("To");
                    //From date validation 

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


                        // email validation start from here.  
                        if (email.value == "") {

                            document.getElementById("emailError").innerHTML = "Email is required.";
                            flag = 0;
                        }
                        else if (!emailcheck.test(email.value)) {
                            document.getElementById("emailError").innerHTML = "Please input a valid Email.";
                            flag = 0;
                        }
                        else {
                            document.getElementById("emailError").innerHTML = "";
                            flag = 1;

                        }

                        // validation for reason 
                        if (reason.value == "") {

                            document.getElementById("resError").innerHTML = "Reason is required.";
                            flag = 0;

                        } else if (reason.value.length < 20) {
                            document.getElementById("resError").innerHTML = "Minimum length should be 20 characters.";
                            flag = 0;
                        } else if (reason.value.length > 100) {
                            document.getElementById("resError").innerHTML = "Maximum length should be 100 characters.";
                            flag = 0;
                        } else if (!reasoncheck.test(reason.value)) {
                            document.getElementById("resError").innerHTML = "This should be in characters only.";
                            flag = 0;
                        } else {
                            document.getElementById("resError").innerHTML = "";

                        }

                        // from date validation start from here. 
                        if (from.value.length == "") {
                            document.getElementById("fromError").innerHTML = "Start Date is required.";
                            flag = 0;
                        }
                        else {
                            document.getElementById("fromError").innerHTML = "";

                        }


                        // To date validation start from here.

                        if (To.value.length == "") {
                            document.getElementById("ToError").innerHTML = "End Date is required";
                            flag = 0;
                        }
                        else if (from.value > To.value) {

                            document.getElementById("ToError").innerHTML = "You can't select this date!";
                            flag = 0;
                        }
                        else {
                            document.getElementById("ToError").innerHTML = "";

                        }
                        // calculate date 
                        const date1 = new Date(inputfrom.value);
                        const date2 = new Date(inputto.value);
                        const time = Math.abs(date2 - date1);
                        const days = Math.ceil(time / (1000 * 60 * 60 * 24));

                        let numWeekdays = 0;

                        for (let date = date1; date <= date2; date.setTime(date.getTime() + 86400000)) {
                            let dateString = date.toISOString().slice(0, 10);
                            if (!holidays.includes(dateString) && date.getDay() !== 0 && date.getDay() !== 6) {
                                numWeekdays++;
                            }
                        }
                        document.getElementById("Total").value = numWeekdays;

                        if (flag) {
                            return true;
                        } else {
                            return false;
                        }



                    }

                </script>
            </div>

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
</body>

</html>