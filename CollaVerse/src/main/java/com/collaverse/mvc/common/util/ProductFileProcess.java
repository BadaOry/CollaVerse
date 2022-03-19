package com.collaverse.mvc.common.util;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ProductFileProcess {
	public static String productsave1(MultipartFile[] prodImg, String location, int productNo1) {
		
		String renamedFileName = null;
		String originalFileName = prodImg[0].getOriginalFilename();
		
		log.info("[FileProcessor] 넘어온 prodImg[0]의 OriginalFileName : {}", originalFileName);
		log.info("[FileProcessor] 넘어온 prodImg[0]의 Upfile location : {}", location);
		
		// ▼ location 이 존재하지 않으면 폴더를 생성하는 로직
		File folder = new File(location);
		folder.setWritable(true);
		folder.setReadable(true);
		
		if (!folder.exists()) {
			folder.mkdirs();
		}
		
		// ▼ renamedFileName 명명 규칙 설정
		renamedFileName = "/product" + String.valueOf(productNo1);
		
		try {
			// ▼ 업로드한 파일 데이터를 명명 규칙으로 지정한 파일에 저장
			prodImg[0].transferTo(new File((location + renamedFileName) + ".jpg"));
		
		} catch (IllegalStateException | IOException e) {
			log.error("파일 전송 에러");
			e.printStackTrace();
		}
		
		return renamedFileName;
	}
	
	public static String productsave2(MultipartFile[] prodImg, String location, int productNo2) {
		
		String renamedFileName = null;
		String originalFileName = prodImg[1].getOriginalFilename();
		
		log.info("[FileProcessor] 넘어온 prodImg[1]의 OriginalFileName : {}", originalFileName);
		log.info("[FileProcessor] 넘어온 prodImg[1]의 Upfile location : {}", location);
		
		// ▼ location 이 존재하지 않으면 폴더를 생성하는 로직
		File folder = new File(location);
		folder.setWritable(true);
		folder.setReadable(true);
		
		if (!folder.exists()) {
			folder.mkdirs();
		}
		
		// ▼ renamedFileName 명명 규칙 설정
		renamedFileName = "/product" + String.valueOf(productNo2);
		
		try {
			// ▼ 업로드한 파일 데이터를 명명 규칙으로 지정한 파일에 저장
			prodImg[1].transferTo(new File((location + renamedFileName) + ".jpg"));
		
		} catch (IllegalStateException | IOException e) {
			log.error("파일 전송 에러");
			e.printStackTrace();
		}
		
		return renamedFileName;
	}
	
	public static String productsave3(MultipartFile[] prodImg, String location, int productNo3) {
		
		String renamedFileName = null;
		String originalFileName = prodImg[2].getOriginalFilename();
		
		log.info("[FileProcessor] 넘어온 prodImg[2]의 OriginalFileName : {}", originalFileName);
		log.info("[FileProcessor] 넘어온 prodImg[2]의 Upfile location : {}", location);
		
		// ▼ location 이 존재하지 않으면 폴더를 생성하는 로직
		File folder = new File(location);
		folder.setWritable(true);
		folder.setReadable(true);
		
//		log.info("폴더가 있긴한거니?: {}", folder.exists());
		
		if (!folder.exists()) {
			folder.mkdirs();
//			if(folder.mkdirs()) {
//				log.info("mkdrs 성공!");
//			} else {
//				log.info("아무것도 모르쥬?");
//			}
//			
//			log.info("폴더가 있긴거니?: {}", folder.exists());
//			log.info("보여줄거니?: {}", folder.getPath().toString());
//		} else if(folder.exists()) {
//			
//			log.info("있긴 있는?");
		}
		
		// ▼ renamedFileName 명명 규칙 설정
		renamedFileName = "/product" + String.valueOf(productNo3);
		
		try {
			// ▼ 업로드한 파일 데이터를 명명 규칙으로 지정한 파일에 저장
			prodImg[2].transferTo(new File((location + renamedFileName) + ".jpg"));
		
		} catch (IllegalStateException | IOException e) {
			log.error("파일 전송 에러");
			e.printStackTrace();
		}
		
		return renamedFileName;
	}
}
