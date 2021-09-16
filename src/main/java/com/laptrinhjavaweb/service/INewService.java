package com.laptrinhjavaweb.service;

import java.util.List;

import com.laptrinhjavaweb.model.NewModel;
import com.laptrinhjavaweb.paging.Pageble;

public interface INewService {
	
	NewModel findOne(long id);
	
	List<NewModel> findByCategoryId(Long categoryId);

	NewModel save(NewModel newModel);

	NewModel update(NewModel updateNew);

	void delete(long[] ids);

	List<NewModel> findAll(Pageble pageble);

	int getTotalItem();
//	by me
	//new
	List <NewModel> getAllNew();

	List<NewModel> get4New();
	
	List<NewModel> getHeroNew();
	
	List<NewModel> get2HeroNew();
	//video
	List<NewModel> getAllVideo();
	
	List<NewModel> getHeroVideo();

	List<NewModel> get4Video();
}
