package com.example.demo.controller;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.example.demo.model.Employee;
import com.example.demo.model.Holiday;
import com.example.demo.repository.EmployeeRepository;
import com.example.demo.repository.HolidayRepository;


@Controller
public class EmployeeController{
	@Autowired
	EmployeeRepository emprepo;
	@Autowired
	HolidayRepository hrepo;
	

	@GetMapping("/")
	public ModelAndView welcome() {
		ModelAndView modelAndView = new ModelAndView("login.jsp");
		return modelAndView;
	}

	@PostMapping("/login")
	public ModelAndView login(@RequestParam("email") String email,@RequestParam("password") String password,HttpSession session,Model model) {
		ModelAndView mv = new ModelAndView();

		System.out.println(email);
		System.out.println(password);

		Employee employee = emprepo.findByEmailAndPassword(email, password);
		if (employee==null) {
			return new ModelAndView("login.jsp");
		}
		else {
			if (employee.getRole().equals("manager")) {
				session.setAttribute("email", email);
				mv.setViewName("Manager dashboard.jsp");
				mv.addObject("employee",employee);
				return mv;
			}
			else if (employee.getRole().equals("admin")) {
				session.setAttribute("email", email);
				mv.setViewName("Admin dashboard.jsp");
				mv.addObject("employee",employee);
				return mv;
			}
			else if (employee.getRole().equals("employee")) {
				session.setAttribute("email", email);
				mv.setViewName("user dashboard.jsp");
				mv.addObject("employee",employee);
				return mv;
			}else {

				System.out.println("failed to login");
				return new ModelAndView("login.jsp");
			}
		}
	}	

	@GetMapping("/fetchdata")
	public ResponseEntity<List<Date>> getData() {
		List<Holiday> holidays = hrepo.findAll();
		List<Date> dates=new ArrayList<>();
		for(Holiday h:holidays) {
			dates.add(h.getDates());
		}
		return ResponseEntity.ok(dates);
	}


}
