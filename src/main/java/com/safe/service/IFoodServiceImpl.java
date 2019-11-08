package com.safe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safe.dao.FoodDao;
import com.safe.vo.Food;



@Service
public class IFoodServiceImpl implements FoodService {
	
	@Autowired
	FoodDao dao;

	@Override
	public int foodCount(String key, String word) {
		return 0;
	}

	@Override
	public List<Food> searchAll(String key, String word) {
		return dao.searchAll(key, word);
	}

	@Override
	public Food search(int code) {
		return dao.search(code);
	}

	@Override
	public List<Food> searchBest() {
		return dao.searchBest();
	}

	@Override
	public List<Food> searchBestIndex() {
		return dao.searchBestIndex();
	}

	@Override
	public List<Food> searchCal(String word) {
		return dao.searchCal(word);
	}
	



}
