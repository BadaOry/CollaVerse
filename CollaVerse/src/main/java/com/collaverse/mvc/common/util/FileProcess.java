package com.collaverse.mvc.common.util;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FileProcess {
	
	public static String save(MultipartFile upfile, String location) {
		
		String renamedFileName = null;
		String originalFileName = upfile.getOriginalFilename();
		
		log.info("[FileProcessor] 넘어온 upfile의 OriginalFileName : {}", originalFileName);
		log.info("[FileProcessor] 넘어온 upfile의 Upfile location : {}", location);
		
		// ▼ location 이 존재하지 않으면 폴더를 생성하는 로직
		File folder = new File(location);
		
		if (!folder.exists()) {
			folder.mkdirs();
		}
		
		// ▼ renamedFileName 명명 규칙 설정
		renamedFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS"))
				+ originalFileName.substring(originalFileName.lastIndexOf("."));
		log.info("새로 만들어진 renamedFileName 출력 : {}", renamedFileName);
		try {
			// ▼ 업로드한 파일 데이터를 명명 규칙으로 지정한 파일에 저장
			upfile.transferTo(new File(location + "/" + renamedFileName));
		
		} catch (IllegalStateException | IOException e) {
			log.error("파일 전송 에러");
			e.printStackTrace();
		}
		
		return renamedFileName;
	}
}
