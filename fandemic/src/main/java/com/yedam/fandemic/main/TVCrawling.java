package com.yedam.fandemic.main;

import java.util.ArrayList;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class TVCrawling {
	
	public ArrayList<HashMap<String, String>> TvRating() throws Exception {
		String URL = "http://www.nielsenkorea.co.kr/tv_terrestrial_day.asp?menu=Tit_1&sub_menu=1_1&area=01";  // 시청률 검색
		Document doc = Jsoup.connect(URL).userAgent("Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36").get();
		
		Elements Ename = doc.select("table.ranking_tb>tbody>tr>td.tb_txt");  // 프로그램명
		Elements Ecenter = doc.select("table.ranking_tb>tbody>tr>td.tb_txt_center");  // 방송사
		Elements Erating = doc.select("table.ranking_tb>tbody>tr>td.percent");  // 시청률
		
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		
		int i=0, j=0;
		
		for (Element e : Ename) {
			if(i == 10) { break;}
			HashMap<String, String> map = new HashMap<>();
			map.put("name", e.text());
			map.put("no", Integer.toString(i+1));
			list.add(map);
			i++;
			System.out.println("프로그램명 : " + e.text());
		}

		
		i=0;
		
		for (Element e : Erating) {
			if(i == 10) { break;}
			list.get(i).put("rat", e.text());
			i++;
			System.out.println("시청률 : " + e.text());
		}
		
		i=0;
		for (Element e : Ecenter) {
			if(j == 20) { break;}
			if(j %2 == 0) {
				e.text();
			} else {
				list.get(i).put("ct", e.text());
				i++;
				System.out.println("채널 :" + e.text());
			}
			j++;
		}

		
		return list;
	}

}
