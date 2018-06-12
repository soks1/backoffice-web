package com.penta.backoffice.base.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class JsonParserUtil {

	@Deprecated
	public static Map<String, Object> parserJson(JSONObject jsonObj) {

		Map<String, Object> map = new HashMap<String, Object>();

		Iterator<?> iter = jsonObj.keySet().iterator();

		while (iter.hasNext()) {
			String key = (String) iter.next();
			map.put(key, parseJSONData(jsonObj.get(key)));
		}

		return map;
	}

	@Deprecated
	static Object parseJSONData(Object object) {
		System.out.println((object instanceof JSONArray) + " / " + object);
		if (object instanceof JSONArray) {

			List<Object> list = new ArrayList<Object>();
			JSONArray jsonArray = (JSONArray) object;

			for (int i = 0; i < jsonArray.length(); i++) {

				Map<String, Object> map = new HashMap<String, Object>();

				JSONObject json = jsonArray.getJSONObject(i);
				Iterator<?> iter = json.keySet().iterator();
				while (iter.hasNext()) {
					String key = (String) iter.next();
					map.put(key, parseJSONData(json.get(key)));
				}
				list.add(map);
			}

			return list;
		}
		else {
			return object;
		}
	}

	public static Map<String, Object> jsonToMap(JSONObject json) {
		Map<String, Object> retMap = new HashMap<String, Object>();

		if (json != JSONObject.NULL) {
			retMap = toMap(json);
		}
		return retMap;
	}

	@SuppressWarnings("unchecked")
	public static Map<String, Object> toMap(JSONObject object) throws JSONException {
		Map<String, Object> map = new HashMap<String, Object>();

		Iterator<String> keysItr = object.keySet().iterator();
		while (keysItr.hasNext()) {
			String key = keysItr.next();
			Object value = object.get(key);

			if (value instanceof JSONArray) {
				value = toList((JSONArray) value);
			}

			else if (value instanceof JSONObject) {
				value = toMap((JSONObject) value);
			}
			map.put(key, value);
		}
		return map;
	}

	public static List<Object> toList(JSONArray array) {
		List<Object> list = new ArrayList<Object>();
		for (int i = 0; i < array.length(); i++) {
			Object value = array.get(i);
			if (value instanceof JSONArray) {
				value = toList((JSONArray) value);
			}

			else if (value instanceof JSONObject) {
				value = toMap((JSONObject) value);
			}
			list.add(value);
		}
		return list;
	}

}
