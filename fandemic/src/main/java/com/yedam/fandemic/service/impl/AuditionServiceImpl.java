package com.yedam.fandemic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.AuditionMapper;
import com.yedam.fandemic.service.AuditionService;
import com.yedam.fandemic.vo.Aboard;
import com.yedam.fandemic.vo.Activity;
import com.yedam.fandemic.vo.Audition;
import com.yedam.fandemic.vo.Trainee;



@Service
public class AuditionServiceImpl implements AuditionService {
	@Autowired AuditionMapper auditionmapper;
	@Override
	public int insertac(Activity activity) {
		// TODO Auto-generated method stub
		return auditionmapper.insertac(activity);
	}
	@Override
	public int inserttr(Trainee trainee) {
		// TODO Auto-generated method stub
		return auditionmapper.inserttr(trainee);
	}
	@Override
	public int activityUpdate(Activity activity) {
		
		return auditionmapper.activityUpdate(activity);
	}
	@Override
	public Activity activityUpdateselect(Activity activity) {
		
		return auditionmapper.activityUpdateselect(activity);
	}
	@Override
	public int activityDelete(Activity activity) {
		
		return auditionmapper.activityDelete(activity);
	}
	@Override
	public List<Aboard> auditionlist() {
		
		return auditionmapper.auditionlist();
	}
	@Override
	public List<Aboard> getComList(Aboard aboard) {
		
		return auditionmapper.getComList(aboard);
	}
	@Override
	public Aboard getAboardInfo(Aboard aboard) {
		
		return auditionmapper.getAboardInfo(aboard);
	}
	@Override
	public int insertau(Audition audition) {
		// TODO Auto-generated method stub
		return auditionmapper.insertau(audition);
	}
	@Override
	public int getactivityCount(Activity activity) {
		// TODO Auto-generated method stub
		return auditionmapper.getactivityCount(activity);
	}
	@Override
	public List<Activity> selectac(Activity activity) {
		// TODO Auto-generated method stub
		return auditionmapper.selectac();
	}
	@Override
	public void traineeUpdate(Trainee trainee) {
		auditionmapper.traineeUpdate(trainee);
		
	}
	@Override
	public Trainee traineeUpdateselect(Trainee trainee) {
		// TODO Auto-generated method stub
		return auditionmapper.traineeUpdateselect(trainee);
	}

	@Override
	public int updateActivityhits(Activity activity) {
		// TODO Auto-generated method stub
		return auditionmapper.updateActivityhits(activity);
	}

}
