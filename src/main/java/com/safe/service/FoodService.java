package com.safe.service;

import java.util.List;

import com.safe.vo.Food;

public interface FoodService {
	public int foodCount(String key, String word);
	public List<Food> searchAll(String key, String word);
	public Food search(int code);
	public List<Food> searchBest();
	public List<Food> searchBestIndex();
	public List<Food> searchCal(String word);
}