package com.daol.library.member.service.logic;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.member.domain.Member;
import com.daol.library.member.service.MemberService;
import com.daol.library.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberStore store;

	@Override
	public int registerMember(Member member) {
		int result = store.insertMember(member);
		return result;
	}

	@Override
	public Member loginMember(Member memberOne) {
		Member mOne = store.selectMember(memberOne);
		return mOne;
	}

	@Override
	public Member printOne(Member member) {
		Member mOne = store.selectId(member);
		return mOne;
	}

	@Override
	public void sendEmail(Member vo, String div) throws Exception {
		// Mail Server 설정
		System.setProperty("https.protocols", "TLSv1,TLSv1.1,TLSv1.2");

		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "seokin6961";
		String hostSMTPpwd = "!!!q2659521";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "seokin6961@gmail.com";
		String fromName = "Daol Homepage";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "Daol Homepage 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getUserId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getUserPwd() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getUserEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
		
	

	@Override
	public void findPw(HttpServletResponse resp, Member vo) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		Member ck = store.readMember(vo.getUserId());
		PrintWriter out = resp.getWriter();
		// 가입된 아이디가 없으면
		if(store.idCheck(vo.getUserId()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!vo.getUserEmail().equals(ck.getUserEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setUserPwd(pw);
			// 비밀번호 변경
			store.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
		
	}

	@Override
	public int checkIdDup(String userId) {
		int result = store.checkIdDup(userId);
		return result;
	}

}
