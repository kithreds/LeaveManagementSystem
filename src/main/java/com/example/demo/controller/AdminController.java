package com.example.demo.controller;


import java.util.List;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Employee;
import com.example.demo.model.Holiday;
import com.example.demo.model.Leave;
import com.example.demo.model.Project;
import com.example.demo.repository.EmployeeRepository;
import com.example.demo.repository.HolidayRepository;
import com.example.demo.repository.LeaveRepository;
import com.example.demo.repository.ProjectRepository;
import com.example.demo.service.EmployeeLeavePolicyService;
import com.example.demo.service.PasswordGenerationService;
import com.example.demo.service.emailSender;


@Controller
public class AdminController{
	@Autowired
	EmployeeRepository emprepo;
	@Autowired
	HolidayRepository hrepo;
	@Autowired
	LeaveRepository lrepo;
	@Autowired
	ProjectRepository proRepo;
	@Autowired
	private PasswordGenerationService pwdService;
	
	@Autowired
	private emailSender senderService;
	
	@RequestMapping("/Admindashboard")
	public String adminDashboard(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		List<Leave> leave =  lrepo.findAllByEmpId(id);
		request.setAttribute("leave", leave);
		Employee employee = emprepo.getReferenceById(id);
		request.setAttribute("employee", employee);
		return "/Admin dashboard.jsp";
	}
	  @RequestMapping("/applyLeaveAdmin")
	  public ModelAndView applyLeaveAdmin(Leave leave,HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("ids"));
		Employee employee = emprepo.getReferenceById(id);
		request.setAttribute("employee", employee);
		  lrepo.save(leave);
		  System.out.println("Leave applied successfully");
		  return new ModelAndView("redirect:/Admindashboard?id="+id);
	  } 
	
	@RequestMapping("/viewProjectAdmin")
	public String viewProjects(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Employee employee = emprepo.getReferenceById(id);
		request.setAttribute("employee", employee);
		return "/viewProjects.jsp";
	}
	@RequestMapping("/viewLeaveformAdmin")
	public String viewLeaveFormAdmin(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Employee employee = emprepo.getReferenceById(id);
		request.setAttribute("employee", employee);
		return "/leaveform.jsp";
	}
	@RequestMapping("/viewAddEmployee")
	public String viewAddEmployee(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Employee employee = emprepo.getReferenceById(id);
		request.setAttribute("employee", employee);
		return "/addEmployee.jsp";
	}
	@GetMapping("/viewEmployee")
	public ModelAndView viewEmployeeDetails(HttpServletRequest request) {
		//List<Employee> employee = emprepo.findAll();
		int id = Integer.parseInt(request.getParameter("id"));
		Employee employee = emprepo.getReferenceById(id);
		request.setAttribute("employee", employee);
		List<Employee> employe = emprepo.findByStatus("active");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("view Employee details Admin.jsp");
		modelAndView.addObject("employe", employe);
		System.out.println(modelAndView);
		return modelAndView;
	}
	@RequestMapping("/viewApproveLeave")
	public String viewApproveLeave(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Employee employee = emprepo.getReferenceById(id);
		request.setAttribute("employee", employee);
		return "/Admin leave approve.jsp";
	}
	@RequestMapping("/viewAddHoliday")
	public String viewAddHoliday(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Employee employee = emprepo.getReferenceById(id);
		request.setAttribute("employee", employee);
		return "/addHoliday.jsp";
	}
	@RequestMapping("/viewAddProject")
	public String viewAddProject(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Employee employee = emprepo.getReferenceById(id);
		request.setAttribute("employee", employee);
		return "/addProject.jsp";
	}
	@PostMapping("/addHoliday")
	public ModelAndView newholiday(Holiday hld) {
		hrepo.save(hld);
		return new ModelAndView("redirect:/leaveform.jsp");
	}

	@GetMapping("/viewHoliday")
	public ModelAndView viewHoliday(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Employee employee = emprepo.getReferenceById(id);
		request.setAttribute("employee", employee);
		List<Holiday> holiday = hrepo.findAll();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("view holiday admin.jsp");
		modelAndView.addObject("holiday", holiday);
		System.out.println(modelAndView);
		return modelAndView;
	}
	 @RequestMapping("/viewProjects")
	  public ModelAndView viewProject(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Employee employee = emprepo.getReferenceById(id);
		request.setAttribute("employee", employee);
		List<Project> project = proRepo.findAll();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("viewProjects.jsp");
		modelAndView.addObject("project", project);
		System.out.println(modelAndView);
		return modelAndView;
	}
	 @RequestMapping("/viewAdminResetPassword")
		public String viewAdminResetPassword(HttpServletRequest request) {
			int id = Integer.parseInt(request.getParameter("id"));
			Employee employee = emprepo.getReferenceById(id);
			request.setAttribute("employee", employee);
			return "/resetpassword.jsp";
		}
	@GetMapping("/deleteHoliday")
	public ModelAndView deleteHoliday(HttpServletRequest request) {
		int hid = Integer.parseInt(request.getParameter("hid"));
		System.out.println(hid);
		hrepo.deleteById(hid);
		return new ModelAndView("/viewHoliday");
	}
	
	@PostMapping("/addEmployee")
	public ModelAndView addEmployee(Employee emp) {
		EmployeeLeavePolicyService empservice = new EmployeeLeavePolicyService();
		String password=pwdService.generatePassword();
		System.out.println(password);
		emp.setPassword(password);
		String email = emp.getEmail();
		//senderService.sendEmail(email,"Username and Password from LMS","Your profile has been successfully created in Leave management portal.Your credentials to access the portal are : "+"\n"+"Username ="+email+"\n"+"Password ="+password);
		empservice.setLeaveDays(emp);
		emprepo.save(emp);
		return new ModelAndView("redirect:/Admin dashboard.jsp");
	}
	@RequestMapping("/edit")
	public String editForm(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Employee employee = emprepo.getReferenceById(id);
		request.setAttribute("employee", employee);
		return "/updateform.jsp";
	}
	@RequestMapping("/adminProfile")
	public String viewAdminProfile(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Employee employee = emprepo.getReferenceById(id);
		request.setAttribute("employee", employee);
		return "/adminProfile.jsp";
	}
	
	@RequestMapping("/update")
	public ModelAndView updateEmployee(Employee emp) {
		Employee currentData = emprepo.getReferenceById(emp.getId());
		String pwd=currentData.getPassword();
		int sickleave=currentData.getSickleave();
		int casualleave=currentData.getCasualleave();
		int personalleave=currentData.getPersonalleave();
		int maternityleave=currentData.getMaternityleave();
		int paternityleave=currentData.getPaternityleave();
		int marriageleave=currentData.getMarriageleave();
		int adoptionleave=currentData.getAdoptionleave();
		
		emp.setSickleave(sickleave);
		emp.setCasualleave(casualleave);
		emp.setPersonalleave(personalleave);
		emp.setMaternityleave(maternityleave);
		emp.setPaternityleave(paternityleave);
		emp.setMarriageleave(marriageleave);
		emp.setAdoptionleave(adoptionleave);
		emp.setPassword(pwd);
		emprepo.save(emp);
		return new ModelAndView("redirect:/viewEmployee");
	}
	
	@GetMapping("/delete")
	public ModelAndView deleteEmployee(HttpServletRequest request,Employee emp) {
		int id = Integer.parseInt(request.getParameter("id"));
		Employee employee = emprepo.getReferenceById(id);
		employee.setStatus("inactive");
		emprepo.save(employee);
		return new ModelAndView("/viewEmployee");
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		if(session !=null) {
			session.invalidate();
		}
		return "login.jsp";

	}
	
	// reset password 
		  @RequestMapping("/resetPassword")
			public ModelAndView resetPassword (HttpServletRequest request,HttpSession session) {
				
				String oldpassword=request.getParameter("password");

				String password=request.getParameter("newpassword");
				Employee currentData = emprepo.getRefrencedByPassword(oldpassword);

				currentData.setPassword(password);
				
				emprepo.save(currentData);
				
				ModelAndView mv =new ModelAndView();
				mv.setViewName("login.jsp");
				mv.addObject("employee",currentData);
				session.invalidate();
				return mv;
			}

//	@RequestMapping("/applyLeaveAdmin")
//	public ModelAndView applyLeaveAdmin (@RequestParam("leavetype") String leaveType,@RequestParam("Total") String Total,HttpServletRequest request,HttpSession session,Employee emp) {
//		ModelAndView mv = new ModelAndView();
//		int totalDays = Integer.parseInt(Total);
//		Employee employee = emprepo.getReferenceById(emp.getId());
//		if (leaveType.equals("SickLeave")) {
//		    employee.setSickleave(employee.getSickleave() - totalDays); //reduce the number of sick leave days
//		} else if (leaveType.equals("CasualLeave")) {
//			employee.setCasualleave(employee.getCasualleave() - totalDays); //reduce the number of casual leave days
//		} else if (leaveType.equals("PersonalLeave")) {
//			employee.setPersonalleave(employee.getPersonalleave() - totalDays); //reduce the number of personal leave days
//		} else if (leaveType.equals("MaternityLeave")) {
//			employee.setMaternityleave(employee.getMaternityleave() - totalDays); //reduce the number of maternity leave days
//		} else if (leaveType.equals("PaternityLeave")) {
//			employee.setPaternityleave(employee.getPaternityleave() - totalDays); //reduce the number of paternity leave days
//		} else if (leaveType.equals("MarriageLeave")) {
//			employee.setMarriageleave(employee.getMarriageleave() - totalDays); //reduce the number of marriage leave days
//		} else if (leaveType.equals("AdoptionLeave")) {
//			employee.setAdoptionleave(employee.getAdoptionleave() - totalDays); //reduce the number of adoption leave days
//		}
//
//		emprepo.save(employee); 
//		return new ModelAndView("redirect:/leaveform.jsp");
//
//	
//}
		
	
	// add project 
 	 @RequestMapping("/addProject")
	 public ModelAndView addProject(Project project) {
 	proRepo.save(project);	
    return new ModelAndView("/viewProjects");
  	 }
   
}
