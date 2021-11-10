package com.daol.library.mypage.controller;

import java.io.File;
import java.sql.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.daol.library.book.domain.WishBook;
import com.daol.library.member.controller.MemberController;
import com.daol.library.member.domain.Member;
import com.daol.library.mypage.domain.Qna;
import com.daol.library.mypage.service.MypageService;
import com.daol.library.readingRoom.domain.ReadingRoom;

@Controller
public class MypageController {

	@Autowired
	private MypageService service;
	@Autowired
	private MemberController mController;
	

	// 마이페이지 회원정보 조회 화면
	@RequestMapping(value = "mypageInfo.do", method = RequestMethod.GET)
	public String mypageInfoView(@ModelAttribute Member member, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		// 택배 주소 추가하기!!!!
		try {
			Member memberOne = service.printOneInfo(member);
			session.setAttribute("loginUser", memberOne);
			return "mypage/mypageInfo";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원 정보 조회 실패!");
			return "common/errorPage";
		}

	}

	// 마이페이지 정보 수정 화면
	@RequestMapping(value = "modifyInfoView.do", method = RequestMethod.GET)
	public String modifyInfoView(@ModelAttribute Member member, HttpServletRequest request) {
		return "mypage/modifyInfo";
	}

	// 회원 정보 수정
	@RequestMapping(value = "modifyInfo.do", method = RequestMethod.POST)
	public String modifyInfo(@ModelAttribute Member member, @RequestParam("enrollDate2") String enrollDate2,
			HttpServletRequest request, Model model,
			@RequestParam(value = "reloadFile", required = false) MultipartFile reloadFile) {
		HttpSession session = request.getSession();
		member.setEnrollDate(Date.valueOf(enrollDate2));
		if (reloadFile != null) {
			// 기존 파일 삭제
			if (member.getProfilePic() != "") {
				deleteFile(member.getProfilePic(), request);
			}
			// 새파일업로드
			String fileRename = mController.saveFile(reloadFile, request);
			if (fileRename != null) {
				member.setProfilePic(reloadFile.getOriginalFilename());
			}
		}
		int result = service.modifyMember(member);
		try {
			if (result > 0) {
				session.setAttribute("loginUser", member);
				return "mypage/mypageInfo";
			} else {
				model.addAttribute("msg", "회원 정보 수정 실패");
				return "common/errorPage";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}

	public void deleteFile(String fileName, HttpServletRequest request) {// 경로를 만들어주기 위한 작업(경로를 알아야 해당 파일을 삭제할 수 있음)
		String root = request.getSession().getServletContext().getRealPath("resources");
		String fullPath = root + "\\muploadFiles";
		File file = new File(fullPath + "\\" + fileName); // 파일객체를 이용해서
		if (file.exists()) {
			file.delete(); // 파일 삭제
		}
	}

	// 마이페이지 회원탈퇴 화면
	@RequestMapping(value = "leaveAccount.do", method = RequestMethod.GET)
	public String leaveAccountView(@ModelAttribute Member member, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member memberOne = service.printOneInfo(member);
		session.setAttribute("loginUser", memberOne);
		return "mypage/leaveAccount";

	}

	@RequestMapping(value = "removeMember.do", method = RequestMethod.GET)
	public String removeMember(@ModelAttribute Member member, Model model, HttpServletRequest request) {
		int result = service.removeMember(member);
		HttpSession session = request.getSession();
		if (result > 0) {
			session.invalidate();
			return "home";
		} else {
			model.addAttribute("msg", "회원 탈퇴 실패");
			return "common/errorPage";
		}
	}

	// 비밀번호 일치 여부 검사
	@ResponseBody
	@RequestMapping(value = "checkDupPwd.do", method = RequestMethod.GET)
	public String pwdDuplicateCheck(@ModelAttribute Member member, HttpServletRequest request) {
		int result = service.checkPwdDup(member);
		return String.valueOf(result);
	}

	// 대출현황
	@RequestMapping(value = "lendingStatus.do", method = RequestMethod.GET)
	public String lendingStatus() {
		return "mypage/lendingStatus";
	}

	// 예약현황 조회
	@RequestMapping(value = "bookingList.do", method = RequestMethod.GET)
	public String bookingList() {
		return "mypage/bookingList";
	}

	// 희망도서 내역
	@RequestMapping(value = "wishList.do", method = RequestMethod.GET)
	public String wishList(HttpServletRequest request, Model model, @ModelAttribute Member member, @ModelAttribute WishBook wishbook) {
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", member);
		/* String userId = (String)session.getAttribute("userId"); */
		try {
			List<WishBook> wList = service.printWishBook(member.getUserId());
			if (!wList.isEmpty()) {
				model.addAttribute("wList", wList);
				/* session.setAttribute("newList", wList); */
			} else {
				model.addAttribute("wList", null);
			}
			return "mypage/wishList";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "희망 도서 정보 조회 실패!");
			return "common/errorPage";
		}
	}



	
	// 희망도서 신청
	@RequestMapping(value = "applyBook.do", method = RequestMethod.POST)
	public String applyBook(HttpServletRequest request, @ModelAttribute Member member,
			@ModelAttribute WishBook wishbook, String div, Model model) throws Exception {

		//db 삽입 
		int result = service.registerWishBook(wishbook);

		try {

			if(result>0) { 
				HttpSession httpsession = request.getSession();
				httpsession.setAttribute("loginUser", member);

				final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory"; // 이메일 객체생성하기
				Properties props = System.getProperties(); 
				props.put("mail.smtp.user","daollibrary@gmail.com"); 
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.port", "465"); 
				props.put("mail.smtp.starttls", "true");
				props.put("mail.smtp.ssl.enable", "true"); 
				props.put("mail.smtp.auth","true"); 
				props.put("mail.debug", "true");
				props.put("mail.smtp.socketFactory.port", "465");
				props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
				props.put("mail.smtp.socketFactory.fallback", "false"); 

				final String username = "daollibrary@gmail.com";//발신자의 이메일 아이디 입력
				final String password = "daol1234"; //발신자의 패스워드

				try {
					Session session = Session.getDefaultInstance(props, new Authenticator() { protected
						PasswordAuthentication getPasswordAuthentication() { return new
								PasswordAuthentication(username, password); }}); //메세지 설정 
					Message msg = new MimeMessage(session);

					//보내는사람 받는사람 설정 
					msg.setFrom(new InternetAddress("daollibrary@gmail.com"));
					msg.setRecipients(Message.RecipientType.TO,
							InternetAddress.parse("daollibrary@gmail.com",false));
					msg.setSubject(member.getUserId() + "님의 희망 도서 신청");
					msg.setText("======  " + member.getUserId() + "님의 희망 도서 신청 내역   ====="  + "\n 도서명 : " +
							wishbook.getBookName() + "\n 출판사 : " + wishbook.getPublisher() + "\n 저자명 : " +
							wishbook.getBookWriter() +"입니다"); Transport.send(msg);
							System.out.println("발신성공!");  

							return "redirect: wishList.do?userId="+wishbook.getUserId();

				}catch (Exception e){ 
					model.addAttribute("msg", "희망 도서 신청 메일 전송 실패"); 
					return "common/errorPage"; 
				}
			}else { 
				model.addAttribute("msg", "희망 도서 등록 실패"); 
				return "common/errorPage"; } 
		}catch(Exception e) {
			e.printStackTrace();
			return "common/errorPage"; 
		}

	}
	
	
	
	// 관심 도서 내역
	@RequestMapping(value = "likeList.do", method = RequestMethod.GET)
	public String likeList() {
		return "mypage/likeList";
	}

	// 취향분석설문 화면
	@RequestMapping(value = "tasteSurvey.do", method = RequestMethod.GET)
	public String tasteSurveyView() {
		return "mypage/tasteSurvey";
	}

	
	
	
	
	// 열람실 이용내역
	@RequestMapping(value = "readingroomHistory.do", method = RequestMethod.GET)
	public String readingroomHistory(@ModelAttribute ReadingRoom readingRoom, @RequestParam("userId") String userId, Model model) {
		
		try {
			List<ReadingRoom> rList = service.printAllrList(userId);
			if(!rList.isEmpty()) {
				model.addAttribute("rList", rList);
			}else {
				model.addAttribute("rList", null);
			}
			
			return "mypage/readingroomHistory";
		}catch(Exception e) {
			model.addAttribute("msg", "열람실 내역 조회 실패");
			return "common/errorPage";
		}
		
	}
	
	//열람실 이용 취소
	@RequestMapping(value="cancelReadingRoom.do", method=RequestMethod.GET)
	public String cancleReadingRoom(@ModelAttribute ReadingRoom readingRoom, Model model) {
		int rReservationNo = readingRoom.getrReservationNo();
		int result = service.cancelReadingRoom(rReservationNo);
		try {
			if(result > 0) {
				return "mypage/readingroomHistory";
			}else {
				model.addAttribute("msg", "예약 취소 실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}

	}

	// 스터디룸 이용내역
	@RequestMapping(value = "studyroomHistory.do", method = RequestMethod.GET)
	public String studyroomHistory() {
		return "mypage/studyroomHistory";
	}
	
	//문의페이지
	@RequestMapping(value="qnaList.do",method = RequestMethod.GET)
	public ModelAndView qnaList(ModelAndView mv,HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		if(userId != null) {
			mv.addObject("userId",userId);
		}
		List<Qna> qList = service.printAllQna(userId);
		if(!qList.isEmpty()) {
			mv.addObject("qList",qList);
		}
		mv.setViewName("mypage/qna");
		return mv;
	}
	
	//문의작성페이지이동
	@RequestMapping(value="registQnaView.do",method=RequestMethod.GET)
	public ModelAndView registViewQna(ModelAndView mv,HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		if(userId != null) {
			mv.addObject("userId",userId);
			mv.setViewName("mypage/qnaRegistView");
		}
		return mv;
	}
	//문의 작성
	@RequestMapping(value="qnaRegist.do",method=RequestMethod.POST)
	public String registQna(Model model,@ModelAttribute Qna qna){
		int result = service.registQna(qna);
		if(result>0) {
			return "redirect:qnaList.do";
		}else {
			model.addAttribute("msg","등록실패");
			return "common/errorPage";
		}
	}
	//문의 디테일 페이지 이동
	@RequestMapping(value="qnaDetail.do",method=RequestMethod.GET)
	public ModelAndView qnaDetail(ModelAndView mv,@RequestParam("qnaNo") int qnaNo, HttpSession session) {
		String member = (String)session.getAttribute("userId");
		if(member != null) {
			mv.addObject("userId",member);
		}
		Qna qna = service.printOneQna(qnaNo);
			if(qna!=null) {
				mv.addObject("qna", qna);
				mv.setViewName("mypage/qnaDetail");
			}else {
				mv.addObject("msg","조회실패");
				mv.setViewName("common/errorPage");
			}
		return mv;
	}
	//문의 수정페이지 이동
	@RequestMapping(value="qnaModifyView.do",method=RequestMethod.GET)
	public ModelAndView qnaModifyView(ModelAndView mv,@RequestParam("qnaNo") int qnaNo, HttpSession session) {
		String member = (String)session.getAttribute("userId");
		if(member != null) {
			mv.addObject("userId",member);
		}
		Qna qna = service.printOneQna(qnaNo);
			if(qna!=null) {
				mv.addObject("qna", qna);
				mv.setViewName("mypage/qnaModifyView");
			}else {
				mv.addObject("msg","조회실패");
				mv.setViewName("common/errorPage");
			}
		return mv;
	}
	//문의 수정
	@RequestMapping(value="qnaModify.do",method=RequestMethod.POST)
	public String qnaModify(@ModelAttribute Qna qna) {
		int result = service.modifyQna(qna);
		if(result > 0) {
			return "redirect:qnaList.do";
		}else {
			return "common/errorPage";
		}
	}
	//문의 삭제
	@RequestMapping(value="qnaRemove.do",method=RequestMethod.GET)
	public String qnaRemove(@RequestParam("qnaNo")int qnaNo) {
		int result = service.removeQna(qnaNo);
		if(result > 0) {
			return "redirect:qnaList.do";
		}else {
			return "common/errorpage";
		}
	}
}
