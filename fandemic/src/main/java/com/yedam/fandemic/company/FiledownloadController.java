package com.yedam.fandemic.company;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FiledownloadController {

	@RequestMapping("cnotice/filedown")
	public void cnoticeFiledown(HttpServletResponse response, HttpServletRequest request, @RequestParam String uFile)
			throws IOException {
		String fn = URLEncoder.encode(uFile, "utf-8");
		response.setContentType("application/octet-stream;charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fn + "\"");
		BufferedInputStream in = null;
		BufferedOutputStream out = null;
		try {
			String path = request.getSession().getServletContext().getRealPath("images/cnotice");
			in = new BufferedInputStream(new FileInputStream(path + "/" + uFile));
			out = new BufferedOutputStream(response.getOutputStream());
			FileCopyUtils.copy(in, out);
			out.flush();
		} catch (IOException ex) {
		} finally {
			in.close();
			response.getOutputStream().flush();
			response.getOutputStream().close();
		}
	}
	
	@RequestMapping("aboard/filedown")
	public void aboardFiledown(HttpServletResponse response, HttpServletRequest request, @RequestParam String uFile)
			throws IOException {
		String fn = URLEncoder.encode(uFile, "utf-8");
		response.setContentType("application/octet-stream;charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fn + "\"");
		BufferedInputStream in = null;
		BufferedOutputStream out = null;
		try {
			String path = request.getSession().getServletContext().getRealPath("images/aboard");
			in = new BufferedInputStream(new FileInputStream(path + "/" + uFile));
			out = new BufferedOutputStream(response.getOutputStream());
			FileCopyUtils.copy(in, out);
			out.flush();
		} catch (IOException ex) {
		} finally {
			in.close();
			response.getOutputStream().flush();
			response.getOutputStream().close();
		}
	}

}
