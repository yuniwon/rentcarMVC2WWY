package com.basic.rentcar.controller.rentcar;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import com.basic.rentcar.dao.RentcarDao;
import com.basic.rentcar.vo.RentcarVO;

/**
 * Servlet implementation class carInfoUploadController
 */
@WebServlet("/carUpload.do")
public class carInfoUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("차량정보업로드중");
		
		//이미지 경로설정
		String saveDirectory = req.getServletContext().getRealPath("/img");
		String sd2 = "rentcarMVC2WWY/src/main/webapp/img";
		Path saveDirPath = Paths.get(saveDirectory); // path에 경로를 저장
		Path saveDirPath2 = Paths.get(sd2);
		if (!Files.isDirectory(saveDirPath)) { // 만약 경로에 폴더가 없다면
			Files.createDirectories(saveDirPath); // 폴더를 생성해줘
		}
		if (!Files.isDirectory(saveDirPath2)) { // 만약 경로에 폴더가 없다면
			Files.createDirectories(saveDirPath2); // 폴더를 생성해줘
		}
		System.out.println("saveDirectory=" + saveDirectory);
		System.out.println("sd2 : " + saveDirPath2);
		
		//톰캣 10버전에서는 part를 사용해야 함
		
		Part part = req.getPart("uploadFile"); // 업로드할 파일의 정보를 불러온다
		String partHeader = part.getHeader("content-disposition"); // 파일정보중 헤더부분만 따로 불러온다
		String[] phArr = partHeader.split("filename="); // 헤더에서 파일네임을 기준으로 분리
		String originalFileName = phArr[1].trim().replace("\"", ""); // 파일네임부분만을 가져온다
		System.out.println("이미지파일이름=" + originalFileName);
		
		if (!originalFileName.isEmpty()) { // 파일경로를 설정하고 복사한다.
			Path targetPath = Paths.get(saveDirectory, originalFileName);
			Path targetPath2 = Paths.get(sd2, originalFileName);
			Files.copy(part.getInputStream(), targetPath, StandardCopyOption.REPLACE_EXISTING);
			Files.copy(part.getInputStream(), targetPath2, StandardCopyOption.REPLACE_EXISTING);
			System.out.println("targetPath =" + targetPath.toString());
			System.out.println("targetPath2 =" + targetPath2.toString());
		}
		
		RentcarVO car = new RentcarVO();
		car.setName(req.getParameter("name"));
		car.setCategory(Integer.parseInt(req.getParameter("category")));
		car.setPrice(Integer.parseInt(req.getParameter("price")));
		car.setUsepeople(Integer.parseInt(req.getParameter("usepeople")));
		car.setTotalQty(Integer.parseInt(req.getParameter("qty")));
		car.setCompany(req.getParameter("company"));
		car.setInfo(req.getParameter("info"));
		if (!originalFileName.isEmpty()) {
		car.setImg(originalFileName);
		}
		if(req.getParameter("no") != null) {
			System.out.println("정보수정");
			int no = Integer.parseInt(req.getParameter("no"));
			car.setNo(no);
			int cnt = RentcarDao.getInstance().updateCarInfo(car);
			if(cnt >0) {
				System.out.println("정보수정 성공");
			}
		}else {
			System.out.println("신차등록");
			RentcarDao.getInstance().setCarInfo(car);
		}
		String ctx= req.getContextPath();
		res.sendRedirect(ctx+"/allcarlist.do");

	}

}
