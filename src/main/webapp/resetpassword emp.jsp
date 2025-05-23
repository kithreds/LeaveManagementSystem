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
    <link rel="stylesheet" href="./css/reset.css">


    <title>Employee | Reset Password | LMS</title>
</head>

<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
          <div class="bg-white" id="sidebar-wrapper">

            <div class="list-group list-group-flush my-3 mt-5">
                 <a  href="/employeeDashboard?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text active me-2"><i
                        class="fas fa-tachometer-alt "></i> Dashboard</a>

                 <a  href="/viewLeaveformEmployee?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-house-add"></i> Apply Leave</a>


                 <a  href="/viewHolidayEmployee?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-calendar-day"></i> View Holidays</a>

                <a  href="/viewProjectsEmployee?id=${employee.id}"
                    class="list-group-item list-group-item-action bg-transparent second-text fw-bold me-2"><i
                        class="bi bi-card-list "></i> View Projects </a>


               <a  href="/viewResetPasswordEmployee?id=${employee.id}"
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
                                <i class="fas fa-user me-2"></i>Employee
                            </a>
                             <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="employeeProfile?id=${employee.id}">Profile</a></li>
                                <li><a class="dropdown-item" href="/logout">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>


            <!-- start -->
            <div class="container shadow" style="margin-top: 55px;">
                <div class="title">Reset Password</div>
                <form action="login" onsubmit="return validateForm()">
                    <div class="Employe-Details">
                        <div class="input-box">
                            <span class="details mt-4">Email</span>
                            <input type="email" id="email" name="email" class="form-control">
                            <span id="emailError" class="text-danger"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Current Password</span>
                            <input type="password" id="password" name="password" class="form-control">
                            <span id="passError" class="text-danger"></span>
                        </div>
                        <div class="input-box">
                            <span class="details">New Password</span>
                            <input type="password" id="newpassword" name="newpassword" class="form-control">
                            <span id="newpassError" class="text-danger"><small style="color:green;"><b>Password should
                                        be strong</b></small></span>
                        </div>
                        <div class="input-box">
                            <span class="details">Confirm Password</span>
                            <input type="password" id="confirmpassword" name="confirmpassword" class="form-control">
                            <span id="confirmpassError" class="text-danger"></span>
                        </div>


                        <!-- <div>
                            <button type="submit" class="btn btn-dark btn-block Btn">Reset</button><br>
                        </div> -->
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-dark btn-block Btn mt-3">Submit</button>
                        </div>

                    </div>
                </form>
            </div>

            <script>
                let email = document.getElementById("email");
                let emailcheck = /^[A-Za-z_.0-9]{6,30}@[A-Za-z]{2,12}.[A-Za-z.]{2,8}$/;
                let password = document.getElementById("password");
                let reg = /^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$/;
                let newpassword = document.getElementById("newpassword");
                let confirmpassword = document.getElementById("confirmpassword");
                let UppercaseReg = /[A-Z]/;
                let LowerCaseReg = /[a-z]/;
                let SpecialReg = /[!\@\#\%\^\&\*\(\)\_\-\+\=\<\,\>\?]/;
                let NumericReg = /[0-9]/;
                let flag = 1;
                function validateForm() {


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

                    // password validation 
                    if (password.value == "") {

                        document.getElementById("passError").innerHTML = "Password is required.";
                        flag = 0;

                    } else if (password.value.length < 8) {
                        document.getElementById("passError").innerHTML = "Incorrect password!. Please enter the correct password."; 
                        flag = 0;
                    } else if (password.value.length > 14) {
                        document.getElementById("passError").innerHTML = "Incorrect password!. Please enter the correct password."; 
                        flag = 0;
                    }
                    else if (password.value.search(UppercaseReg) == -1) {
                        document.getElementById("passError").innerHTML = "Incorrect password!. Please enter the correct password."; 
                        flag = 0;

                    } else if (password.value.search(SpecialReg) == -1) {
                        document.getElementById("passError").innerHTML = "Incorrect password!. Please enter the correct password."; 
                        flag = 0;

                    } else if (password.value.search(LowerCaseReg) == -1) {
                        document.getElementById("passError").innerHTML = "Incorrect password!. Please enter the correct password."; 
                        flag = 0;

                    }
                    else if (password.value.search(NumericReg) == -1) {
                        document.getElementById("passError").innerHTML = "Incorrect password!. Please enter the correct password."; 
                        flag = 0;

                    }
                    else {
                        document.getElementById("passError").innerHTML = "";

                    }
                    // new password 
                    if (newpassword.value == "") {

                        document.getElementById("newpassError").innerHTML = "Password is required.";
                        flag = 0;

                    } else if (newpassword.value.length < 8) {
                        document.getElementById("newpassError").innerHTML = "Minimum length should be 8 characters."; 
                        flag = 0;
                    } else if (newpassword.value.length > 14) {
                        document.getElementById("newpassError").innerHTML = "Maximum length should be 14 characters.";
                        flag = 0;
                    }
                    else if (newpassword.value.search(UppercaseReg) == -1) {
                        document.getElementById("newpassError").innerHTML = "Password should be strong.";
                        flag = 0;

                    } else if (newpassword.value.search(SpecialReg) == -1) {
                        document.getElementById("newpassError").innerHTML = "Password should be strong.";
                        flag = 0;

                    } else if (newpassword.value.search(LowerCaseReg) == -1) {
                        document.getElementById("newpassError").innerHTML = "Password should be strong.";
                        flag = 0;

                    }
                    else if (newpassword.value.search(NumericReg) == -1) {
                        document.getElementById("newpassError").innerHTML = "Password should be strong.";
                        flag = 0;

                    }
                    else {
                        document.getElementById("newpassError").innerHTML = "";

                    }

                    // confirm password 

                    if (confirmpassword.value == "") {

                        document.getElementById("confirmpassError").innerHTML = "Password is required.";
                        flag = 0;

                    } else if (confirmpassword.value != newpassword.value) {
                        document.getElementById("confirmpassError").innerHTML = "Password doesn't match";
                        flag = 0;
                    } else {
                        document.getElementById("confirmpassError").innerHTML = "";

                    }

                    if (flag) {
                        return true;
                    } else {
                        return false;
                    }

                }


            </script>
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