package com.yedam.fandemic.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.fandemic.impl.MainMapper;
import com.yedam.fandemic.vo.Goods;
import com.yedam.fandemic.vo.Melon;

@Controller
public class MainController {
	@Autowired
	MainMapper dao;

	@RequestMapping(value = "/")
	public ModelAndView Main(Model model) throws IOException {

		return new ModelAndView("redirect:index");
	}

	@RequestMapping(value = "/index")
	public ModelAndView index(Model model, Goods goods, HttpSession session) throws IOException {

		model.addAttribute("goods", dao.ticketList()); // 행사리스트

		String URL = "https://www.melon.com/chart/index.htm";  // 실시간 차트
		Document doc = Jsoup.connect(URL).userAgent("Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36").get();
		
		Elements Esong = doc.select("div.rank01>span>a");  // 노래제목
		Elements Esing = doc.select("div.rank02>span");  // 가수
		Elements Eimg = doc.select("div.wrap>a>img");
		
		List<Melon> list = new ArrayList<Melon>();
		
		
		
		int i=0;
		
		for (Element e : Esong) {
			if(i == 10) { break;}
			Melon melon = new Melon();
			melon.setSong(e.text());
			melon.setNo(i+1);
			list.add(melon);
			i++;
		}
		i=0;
		
		for (Element e : Esing) {
			if(i == 10) { break;}
			list.get(i).setSing(e.text());
			i++;
		}
		i=0;
		
		for (Element e : Eimg) {
			if(i == 10) { break;}
			list.get(i).setImg(e.attr("src"));
			i++;
		}

		model.addAttribute("melon", list);
		return new ModelAndView("index");
	}

}
