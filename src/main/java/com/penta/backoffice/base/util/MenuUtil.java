package com.penta.backoffice.base.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class MenuUtil {
	
	private Object sessionMenu;
	
	private String menuKey;
	
	private Map<String, Object> map;
	
	private boolean chkF;
	
	public MenuUtil(Object sessionMenu, String menuKey) {
		this.sessionMenu = sessionMenu;
		this.menuKey = menuKey;
		this.chkF = true;
		map = new HashMap<String, Object>();
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getMenuAuth() {
		
		Map<String, Object> rtnMap = new HashMap<String, Object>();
		
		Map<String, Object> menuTree = (Map<String, Object>)sessionMenu;
		
		Iterator<?> iter = menuTree.keySet().iterator();
		while (iter.hasNext()) {
			String key = (String) iter.next();
			recursiveMap(menuTree.get(key), menuKey);
		}
		
		rtnMap = map;
		
		return rtnMap;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private void recursiveMap(Object obj, String menuKey) {
		
		if (chkF && obj instanceof List) {
			
			List list = (List) obj;
			
			for(int i = 0; i < list.size(); i ++) {
				
				Map<String, Object> objMap = (Map<String, Object>) list.get(i);
				
				if(objMap.containsValue(menuKey)) {
					
					String auth = (String)objMap.get("menu_role_type_crud");
					String[] authArray = auth.split(",");
					
					for(int j = 0; j < authArray.length; j++) {
						map.put(authArray[j], "Y");
					}
					
					chkF = false;
				} 
				else {
					Iterator<?> iter = objMap.keySet().iterator();
					while (iter.hasNext()) {
						String key = (String) iter.next();
						recursiveMap(objMap.get(key) ,menuKey);
					}
				}
			}
		}
	}
}
