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
  <link rel="stylesheet" href="css/registerstyle.css">
  <title>Admin | Add Employee | LMS</title>
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

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle second-text fw-bold" href="#" id="navbarDropdown" role="button"
                data-bs-toggle="dropdown" aria-expanded="false">
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
      <div class="container shadow" style="margin-top: 30px;">
        <div class="title">Add Employee</div>
        <form action="/addEmployee" method="POST" onsubmit="return validateForm()">
        <input type="hidden" name="status" value="active">
          <div class="Employe-Details">
            <div class="input-box">
              <span class="details">Name</span>
              <input type="text" id="name" name="name" class="form-control">
              <span id="nameError" class="text-danger"></span>
            </div>
            <div class="input-box">
              <span class="details">Reporting Manager</span>
              <input type="text" id="name" name="reportingmanager" class="form-control">
              <span id="nameError" class="text-danger"></span>
            </div>
            <div class="input-box">
              <span class="details">Email</span>
              <input type="email" id="email" name="email" class="form-control">
              <span id="emailError" class="text-danger"></span>
            </div>

            <div class="input-box">
              <span class="details">Contact</span>
              <input type="text" id="contact" name="contact" class="form-control">
              <span id="contactError" class="text-danger"></span>
            </div>

            <div class="input-box">
              <span class="details">Date of Birth</span>
              <input type="date" id="dob" name="dob" class="form-control">
              <span id="dobError" class="text-danger"></span>
            </div>
            <!-- drop-down for gender -->
            <div class="input-box">
              <span class="details">Gender</span>
              <select name="gender" id="gender" class="form-control">
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
              </select>
            </div>

            <div class="input-box">
              <span class="details">Date of Joining</span>
              <input type="date" name="doj" id="doj" class="form-control">
              <span id="jdError" class="text-danger"></span>
            </div>
            <!-- drop-down for designation -->
            <div class="input-box">
              <span class="details">Designation</span>
              <select name="designation" id="designation" class="form-control">
                <option value="Manager">Manager</option>
                <option value="Deputy Manager">Deputy Manager</option>
                <option value="President">President</option>
                <option value="Assistant Vice President">Assistant Vice President</option>
                <option value="Deputy Vice President">Deputy Vice President</option>
              </select>
            </div>
            <div class="input-box">
              <span class="details">Role</span>
              <select name="role" class="form-control" required>
                <option value="manager">manager</option>
                <option value="admin">admin</option>
                <option value="employee">employee</option>
              </select>
            </div>

            <div class="input-box">
              <span class="details">Location</span>
              <select name="location" id="location" class="form-control">
                <option value="Mumbai">Mumbai</option>
                <option value="Banglore">Bangalore</option>

              </select>
            </div>



            <!-- input box for address -->

            <div class="input-box">
              <span class="details">Address</span>
              <textarea maxlength="50" id="address" name="address" class="form-control"
                placeholder="Street name, City, Pin code, State and Country."></textarea>
              <span id="addressError" class="text-danger"></span>

            </div>
          </div>
          <div>
            <button type="submit" class="btn btn-dark btn-block Btn">Submit</button><br>
          </div>
        </form>
      </div>

      <!-- javaScript start from here  -->

      <script>
        let name = document.getElementById("name");
        let email = document.getElementById("email");
        let contact = document.getElementById("contact");
        let dob = document.getElementById("dob");
        let hiringDate = document.getElementById("hiringDate");
        let address = document.getElementById("address");
        let emailcheck = /^[A-Za-z_.0-9]{6,30}@[A-Za-z]{2,12}.[A-Za-z.]{2,8}$/;
        let namecheck = /^[A-Za-z. ]{2,20}$/;
        let phonecheck = /^[6789][0-9]{9}$/;
        let flag = 1;

        // start Dob validation 
        var todayDate = new Date();
        var month = todayDate.getMonth() + 1;
        var year = todayDate.getUTCFullYear() - 18;
        var year1 = todayDate.getUTCFullYear() - 60;
        var tdate = todayDate.getDate();
        if (month < 10) {
          month = "0" + month
        }
        if (tdate < 10) {
          tdate = "0" + tdate;
        }
        var maxDate = year + "-" + month + "-" + tdate;
        var maxDate1 = year1 + "-" + month + "-" + tdate;
        // min dob select from here 
        document.getElementById("dob").setAttribute("max", maxDate);
        console.log(maxDate);
        // max dob select from here 
        document.getElementById("dob").setAttribute("min", maxDate1);
        console.log(maxDate1);


        // end dob validation 
        /* ---------------------------------------Strat validation for date of joining----------------- */
        var JtodayDate = new Date();
        var JnextDate = new Date();
        var Jmonth = JtodayDate.getMonth();
        var Jnextmonth = JnextDate.getMonth() + 1;
        var Jyear = JtodayDate.getUTCFullYear();
        var Jnextyear = JnextDate.getUTCFullYear();
        var Jtdate = JtodayDate.getDate();
        var Jnexttdate = JnextDate.getDate();
        if (Jmonth < 10) {
          Jmonth = "0" + Jmonth
        }
        if (Jtdate < 10) {
          Jtdate = "0" + Jtdate;
        }
        if (Jnextmonth < 10) {
          Jnextmonth = "0" + Jnextmonth
        }
        if (Jnexttdate < 10) {
          Jnexttdate = "0" + Jnexttdate;
        }
        var JmaxDate = Jyear + "-" + Jmonth + "-" + Jtdate;
        var JnextmaxDate = Jnextyear + "-" + Jnextmonth + "-" + Jnexttdate;
        document.getElementById("hiringDate").setAttribute("min", JmaxDate);
        console.log(JmaxDate);
        document.getElementById("hiringDate").setAttribute("max", JnextmaxDate);
        console.log(JnextmaxDate);

        /* end validation for joining date */


        function validateForm() {

          if (name.value == "") {

            document.getElementById("nameError").innerHTML = "Name is required.";
            flag = 0;

          } else if (name.value.length < 2) {
            document.getElementById("nameError").innerHTML = "Minimum length should be 2 characters.";
            flag = 0;
          } else if (name.value.length > 20) {
            document.getElementById("nameError").innerHTML = "Maximum length should be 20 characters.";
            flag = 0;
          } else if (!namecheck.test(name.value)) {
            document.getElementById("nameError").innerHTML = " This should be in characters only.";
            flag = 0;
          } else {
            document.getElementById("nameError").innerHTML = "";
            flag = 1;
          }

          // email validation 
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


          }

          // contact validation 
          if (contact.value == "") {
            document.getElementById("contactError").innerHTML = "Contact number is required.";
            flag = 0;
          }
          else if (!phonecheck.test(contact.value)) {
            document.getElementById("contactError").innerHTML = "Please provide a valid contact number.";
            flag = 0;
          }
          else {
            document.getElementById("contactError").innerHTML = "";

          }
          // dob validation 
          if (dob.value.length == "") {
            document.getElementById("dobError").innerHTML = "Date of Birth is required.";
            flag = 0;
          }
          else if (maxDate1 - dob.value > "60") {
            document.getElementById("dobError").innerHTML = "Date should be less than 60 year";
            flag = 0;

          } else {
            document.getElementById("dobError").innerHTML = "";

          }

          // joining date  validation 
          if (hiringDate.value.length == "") {
            document.getElementById("jdError").innerHTML = "Date of Joining is required.";
            flag = 0;
          } else {
            document.getElementById("jdError").innerHTML = "";

          }

          // address validation 
          if (address.value.length == " ") {
            document.getElementById("addressError").innerHTML = "Address is required.";
            flag = 0;

          }
          else if (address.value.length < 20) {
            document.getElementById("addressError").innerHTML = "Please provide complete details.";
            flag = 0;

          } else {
            document.getElementById("addressError").innerHTML = "";

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