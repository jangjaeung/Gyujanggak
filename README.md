# kujangkak
kh정보교육원 final 프로젝트
# 설계 및 구현기간
+ 21/10/13 ~ 21/11/24
# 실행 화면 설명
https://fierce-form-86b.notion.site/Kujangkak-c22bd835b07d4647b37d2fbb49ed0e0a
# 목차
1. [개발목적 및 목표](#개발목적-및-목표)<br>
2. [팀 구성](#팀-구성)<br>
3. [개발환경](#개발환경)<br>
4. [DB구조](#DB구조)<br>
5. [기능](#기능)<br>
6. [느낀점 및 배운것들](#느낀점-및-배운것들)<br>
# 개발목적 및 목표
##### 목적
도서관을 운영하기 위한 가장 기본적인 인프라로써, 
이용자 중심의 도서관 웹사이트를 구축하여 도서관 이용 활성화에  
기여하기 위함<br>
##### 목표
+ 다양한 IT기술로 이용자 중심의 맞춤형 서비스 제공
+ 방대한 컨텐츠 구축과 검색 제공으로 정보 제공자로서의 역할 강화 및 도서관 이용자의 지식 경쟁력 강화
+ 도서관 서비스 수준을 높여 이용자의 접근성 제고
# 팀 구성
1. 송윤수 : 팀장, 취향추천 및 분석, 도서 추천, 회원정보 조회 및 수정, 회원 탈퇴, 연회비 결제, 대출 내역 및 대출 연장, 희망도서 신청시 이메일 발송, 별점, 서평CRUD
2. 강소연 : 열람실, 스터디룸, 관리자 회원조회, 관리자 회원 상세조회, 연회비 결제 승인처리
3. 장재웅 : 도서관 챗봇, 문의, 자유게시판, 신고관리, 인기키워드, 다독자, 메인페이지
4. 윤석인 : 로그인/로그아웃, 소셜로그인, 회원정보찾기, 공지사항, 관리자 도서관리, 대출통계
5. 정아람 : 도서 대출, 도서 검색(간략, 상세), 도서 예약, 서평 조회, 관심도서, 예약도서 이메일 알림
# 개발환경
![tools](https://user-images.githubusercontent.com/90733948/142962526-3a0dfb50-7864-4763-b811-c855015c5bdf.jpg)
# DB구조
![화면 캡처 2021-11-23 093633](https://user-images.githubusercontent.com/90733948/142962565-d1c73339-8d39-495f-8106-e4ca9eaaa161.jpg)
# 기능
작성한 기능은 규장각 사이트에서 본인이 구현한 기능을 나열하였음<br>
### 1. 메인페이지 book 큐레이션
+ 인기도서
  + 장서 목록중 가장 대출수가 많은 10권의 책을 선정해서 노출함
+ 최신도서
  + 장서 목록으로 추가된 가장 최신의 10권을 선정해서 노출함
+ 취향추천
  + 로그인한 회원이 마이페이지의 취향분석 설문을 한 경우 회원의 취향을 선정하여 3가지의 테마를 선정
  + 선정된 테마별로 랜덤으로 10권씩 도출하여 메인페이지에서 테마별 추천도서를 보여줌
  + 회원의 신분이 선정해둔 학교의 학생일 경우 전공별 추천도서도 랜덤으로 10권을 산정하여 보여줌
### 2.인기검색어/다독자
+ 인기검색어
  + 도서명을 검색시 검색 결과 페이지로 이동됨과 동시에 키워드 테이블에 검색한 키워드가 insert됨
  + insert된 키워드를 토대로 검색된 횟수를 카운트하여 카운트가 높은 상위 10개의 키워드를 노출
  + ajax 비동기 방식을 사용하여 사용자의 특별한 조작 없이도 3초에 한번 갱신됨
  + 오라클의 프로시저와 스케줄러를 이용하여 매일 21:30분 마다 키워드 테이블을 초기화해 일간 인기키워드로 구현하였음
+ 다독자
  + 회원중 도서 대출수가 가장 많은 10명을 추출해 리스트를 보여줌
### 3.챗봇
  + 자바스크립트를 이용하여 구현함
  + 설정해둔 키워드 입력시 해당 키워드에 맞춘 답변이 출력되며 설정해둔 키워드가 아닐시 안내멘트가 출력되도록 구현함
  + 답변 영역의 버튼 클릭시 키워드 입력과 동일한 방식으로 해당 버튼에 맞춘 답변이 출력되도록 구현함
### 4.자유게시판
+ 게시판
  + 사용자들이 올린 모든 게시물을 조회할 수 있으며, 글쓰기와 댓글등록은 로그인한 회원만 가능하도록 구현함
  + 게시물이 로그인한 회원의 게시물일 경우 수정/삭제 버튼이 노출되어 글의 수정과 삭제가 가능함
  + 로그인한 모든 사용자는 게시물을 신고할 수 있음
+ 댓글
  + ajax를 이용하여 등록시 페이지의 갱신없이 CRUD가 가능하도록 구현함
  + 본인의 댓글일시 수정/삭제 버튼이 노출되어 수정과 삭제가 가능함
  + 타인의 댓글일시 수정/삭제 버튼위치에 신고하기 버튼이 노출되어 부적절한 댓글을 신고할 수 있음
+ 신고
  + 부적절한 글/댓글은 노출되어 있는 신고하기 버튼을 통해 신고할수 있음
  + 이미 신고된 게시물/댓글은 '이미 신고된 게시글/댓글 입니다' 안내창이 뜨도록 구현하여 중복 신고를 방지함
  + 신고된 게시물/댓글은 관리자 페이지의 신고관리 탭으로 리스트가 전송되어 관리자가 조치할 수 있도록 구현함
### 5.문의
+ 로그인한 사용자는 마이페이지-문의탭 또는 챗봇의 '문의하기' 키워드/버튼을 통해 문의를 등록할 수 있음
+ 문의를 등록하면 관리자 페이지의 문의관리 탭으로 전송되어 관리자가 답변을 등록할 수 있음
+ 사용자는 마이페이지 문의탭에서 자신이 등록한 문의내역을 확인할 수 있고, 관리자가 답변을 달기 전까지 문의글의 수정/삭제가 가능하도록 구현함
### 6.관리자 페이지
+ 문의관리
  + 사용자들이 등록한 문의 리스트를 확인할 수 있음
  + 관리자의 편의를 위하여 제목/작성자/처리상태를 검색할 수 있게하여 원활한 문의관리를 할 수 있음
  + 답변 등록후 언제든지 답변내용의 수정이 가능하도록 구현함
+ 신고관리
  + 사용자들이 신고한 자유게시판의 게시글과 댓글 리스트를 확인할 수 있음
  + 각 리스트의 제목/내용 클릭시 해당 게시물로 이동할 수 있음
  + 관리자는 해당 게시물과 댓글에서 즉시 수정/삭제가 가능하도록 구현
  + 신고관리 페이지에서 신고된 리스트 옆에 삭제하기 버튼이 노출되어 있어 게시글을 들어가지 않아도 삭제가 가능하도록 구현함
 
# 느낀점 및 배운것들
세미프로젝트에서 사용해보지 않았던 ajax를 사용해서 구현해 보며 비동기의 장점을 크게 느꼇습니다. 페이지의 갱신없이 기능 동작이 되어 사용자 입장에서도 더욱 편한 사이트 이용이 되는걸 
느꼇습니다.
프로젝트를 진행함에 따라 안써봣던 기능을 하나하나 찾아가며 정말 공부는 끝이 없다는걸 다시한번 느꼇습니다.. 하지만 화면에 원하는 대로 나오는거에 큰 기쁨을 느껴 
웹 개발의 매력에 더욱 빠지게된 프로젝트였습니다.

[실행 화면 설명](#실행-화면-설명)
