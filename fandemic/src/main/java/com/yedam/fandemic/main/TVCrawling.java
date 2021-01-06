package com.yedam.fandemic.main;

import java.util.ArrayList;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class TVCrawling {
	
	public ArrayList<HashMap<String, String>> TvRating() throws Exception {
		
		String URL = "https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&mra=blUw&query=01%EC%9B%9405%EC%9D%BC%20%EC%A7%80%EC%83%81%ED%8C%8C%20%EC%8B%9C%EC%B2%AD%EB%A5%A0";  // 시청률 검색
		Document doc = Jsoup.connect(URL).userAgent("Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36").get();
		
		Elements Ename = doc.select("tr>td>p>a");  // 프로그램명
		Elements Erating = doc.select("p.rate");  // 시청률
		
		
		
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		
		int i=0, j=0;
		
		for (Element e : Erating) {
			if(i == 10) { break;}
			HashMap<String, String> map = new HashMap<>();
			map.put("rat", e.text());
			map.put("no", Integer.toString(i+1));
			list.add(map);
			i++;
		}
		
		i=0;
		for (Element e : Ename) {
			if(j == 20) { break;}
			if(j %2 == 0) {
				list.get(i).put("name", e.text());
			} else {
				list.get(i).put("ct", e.text());
				i++;
			}
			j++;
		}

		return list;
	}

}
