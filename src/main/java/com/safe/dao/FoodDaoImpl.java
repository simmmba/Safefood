package com.safe.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.safe.vo.Food;

@Repository
public class FoodDaoImpl implements FoodDao {

	@Autowired
	SqlSession session;
	
	List<Food> list;
	

	public int foodCount(String key, String word) {
		// 구현하세요.
		int cnt = 0;
		return cnt;
	}

	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 식품 정보(Food)를 검색해서 반환.
	 * 
	 * @param bean 검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	public List<Food> searchAll(String key, String word) {

		if (key.equals("상품명"))
			key = "name";
		else if (key.equals("제조사"))
			key = "maker";
		else if (key.equals("재료명"))
			key = "material";

		Map<String, String> m = new HashMap<String, String>();
		m.put("key", key);
		m.put("word", word);
		return session.selectList("food.selectAll", m);

	}

	public Food search(int code) {
		
		return (Food) session.selectOne("food.selectOne", code);

	}

	public List<Food> searchBest() {
		return null;
	}

	public List<Food> searchBestIndex() {
		return null;
	}

	public static void print(List<Food> foods) {
		for (Food food : foods) {
			System.out.println(food);
		}
	}

	public static int n, r;
	public static double min = Double.MAX_VALUE;
	public static double cal;
	public static Food[] arr;
	public static List<Food> listCal = new ArrayList<Food>();

	public void comb(int start, int flag, int count) {
		if (count == r) {
			double tmp = 0;
			for (int i = 0; i < arr.length; i++) {
				tmp += arr[i].getCalory();
			}
			if (min > (cal - tmp) && tmp < cal) {
				listCal.clear();
				for (int i = 0; i < arr.length; i++) {
					listCal.add(arr[i]);
				}
				min = cal - tmp;
			}
			return;
		}
		for (int i = start; i < n; i++) {
			if ((flag & 1 << i) == 0) {
				arr[count] = list.get(i);
				comb(i + 1, flag | 1 << i, count + 1);
			}
		}
	}

	@Override
	public List<Food> searchCal(String word) {
		list = searchAll("all", null);
		n = list.size();
		cal = Double.parseDouble(word);
		for (int i = 0; i < n; i++) {
			r = i;
			arr = new Food[r];
			comb(0, 0, 0);
		}
		return listCal;
	}
}
