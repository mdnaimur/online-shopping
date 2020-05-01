package com.mnr.onlineshopping.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtility {

	private static final String ABS_Path = "D:\\SpringPorject\\online-shopping\\onlineshopping\\src\\main\\webapp\\WEB-INF\\assets\\images\\";
	private static String Real_Path = "";
	private static final Logger log = LoggerFactory.getLogger(FileUploadUtility.class);

	public static void uploadFile(HttpServletRequest request, MultipartFile file, String code) {

		Real_Path = request.getSession().getServletContext().getRealPath("/assets/images/");
		log.info(Real_Path);

		if (!new File(ABS_Path).exists()) {
			new File(ABS_Path).mkdirs();
		}

		if (!new File(Real_Path).exists()) {
			new File(Real_Path).mkdirs();
		}

		try {

			// for server upload
			file.transferTo(new File(Real_Path + code + ".jpg"));
			// for project directory
			file.transferTo(new File(ABS_Path + code + ".jpg"));
		} catch (IOException ex) {

		}

	}

}
