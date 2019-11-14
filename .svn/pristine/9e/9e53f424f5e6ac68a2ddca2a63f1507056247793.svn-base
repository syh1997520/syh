package com.qlgshopping.utils;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;

import com.qlgshopping.entity.MyHistory;

public class MyHistoryDateCollect {
	/**
	 * 将我的浏览历史集合按时间分成一个map
	 * @param hisList
	 * @return
	 */
public static LinkedHashMap<String, ArrayList<MyHistory>> getHisttoryMap(ArrayList<MyHistory> hisList){
	if(hisList==null)
		return null;
	LinkedHashSet<String> dataSet=new LinkedHashSet<>();
	for(MyHistory m:hisList){
		String date=m.getHisDate().substring(5, 10);
		dataSet.add(date);
	}
	LinkedHashMap<String, ArrayList<MyHistory>> hisMap=new LinkedHashMap<>();
	for(String d:dataSet){
		ArrayList<MyHistory> hlist=new ArrayList<>();
		for(MyHistory m:hisList){
			if(d.equals(m.getHisDate().substring(5, 10))){
				hlist.add(m);
			}
		}
		hisMap.put(d, hlist);
	}
	return hisMap;
}
}
