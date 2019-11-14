package com.qlgshopping.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

import com.qlgshopping.entity.ShoppingCartInfo;

/**
 * 将购物车详情中同一店铺的整合起来
 * @author Administrator
 *
 */
public class ShopingCartInfoCollect {
public static HashMap<String, ArrayList<ShoppingCartInfo>> getMap(ArrayList<ShoppingCartInfo> shifList){
	HashSet<Integer> stoidSet=new HashSet<>();
	HashMap<String, ArrayList<ShoppingCartInfo>> infoMap=new HashMap<>();
	for(ShoppingCartInfo info:shifList){
		stoidSet.add(info.getStoId());
	}
	for(Integer i:stoidSet){
		ArrayList<ShoppingCartInfo> arr=new ArrayList<>();
		for(ShoppingCartInfo sci:shifList){
			if(sci.getStoId()==i){
				arr.add(sci);
			}
		}
		infoMap.put(arr.get(0).getStore().getStoName(), arr);
	}
	return infoMap;
}

public static HashMap<Integer, ArrayList<ShoppingCartInfo>> getMapOfInt(ArrayList<ShoppingCartInfo> shifList){
	HashSet<Integer> stoidSet=new HashSet<>();
	HashMap<Integer, ArrayList<ShoppingCartInfo>> infoMap=new HashMap<>();
	for(ShoppingCartInfo info:shifList){
		stoidSet.add(info.getStoId());
	}
	for(Integer i:stoidSet){
		ArrayList<ShoppingCartInfo> arr=new ArrayList<>();
		for(ShoppingCartInfo sci:shifList){
			if(sci.getStoId()==i){
				arr.add(sci);
			}
		}
		infoMap.put(arr.get(0).getStore().getStoId(), arr);
	}
	return infoMap;
}
}
