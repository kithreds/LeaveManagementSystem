package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Employee;
import com.example.demo.model.Manager;
import com.example.demo.repository.ManagerRepository;

@Service
public class ManagerLeavePolicyService {
	@Autowired
	ManagerRepository mrepo;
	public void setLeaveDays(Manager mng) {
		mng.setAdoptionleave(30);
		mng.setCasualeave(15);
		mng.setSickleave(15);
		mng.setPersonalleave(15);
		mng.setMaternityleave(180);
		mng.setPaternityleave(30);
		mng.setMarriageleave(15);
	}

//	public int calculateLeave(String leaveType,int totalDays,int id){
//		Manager manager= mrepo.findById(id);
//		int count=0;
//		
//		if (leaveType.equals("SickLeave")) {
//			count=manager.getSickleave() - totalDays;
//			if(count>=0) {
//			manager.setSickleave(count);}
//			
//		} else if (leaveType.equals("CasualLeave")) {
//			count=manager.getCasualeave() - totalDays;
//			if(count>=0)
//			manager.setCasualeave(count);
//		} else if (leaveType.equals("PersonalLeave")) {
//			count=manager.getPersonalleave() - totalDays;
//			if(count>=0)
//			manager.setPersonalleave(count);
//		} else if (leaveType.equals("MaternityLeave")) {
//			count=manager.getMaternityleave() - totalDays;
//			if(count>=0)
//			manager.setMaternityleave(count); 
//		} else if (leaveType.equals("PaternityLeave")) {
//			count=manager.getPaternityleave() - totalDays;
//		    manager.setPaternityleave(count); 
//		} else if (leaveType.equals("MarriageLeave")) {
//			count=manager.getMarriageleave() - totalDays;
//			if(count>=0)
//			manager.setMarriageleave(count); 
//		} else if (leaveType.equals("AdoptionLeave")) {
//			count=manager.getAdoptionleave() - totalDays;
//			if(count>=0)
//			manager.setAdoptionleave(count); 
//		}
//		return count;
//		
//	} 
}