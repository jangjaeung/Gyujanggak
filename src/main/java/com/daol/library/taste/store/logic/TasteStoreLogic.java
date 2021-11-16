package com.daol.library.taste.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daol.library.book.domain.Book;
import com.daol.library.member.domain.Member;
import com.daol.library.taste.domain.Taste;
import com.daol.library.taste.domain.TasteSurvey;
import com.daol.library.taste.store.TasteStore;

@Repository
public class TasteStoreLogic implements TasteStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 설문화면 */
	@Override
	public List<Book> selectAllSurveyList() {
		List<Book> surveyList = sqlSession.selectList("tasteMapper.selectSurveyList");
		return surveyList;
	}
	
	/** 별점 등록  */
	@Override
	public int insertRating(TasteSurvey survey) {
		int result = sqlSession.insert("tasteMapper.insertRating", survey);
		return result;
	}
	
	/** 설문초기화 : 별점 삭제  */
	@Override
	public int deleteRating(String userId) {
		int result = sqlSession.delete("tasteMapper.deleteRating", userId);
		return result;
	}

	/** 설문등록 : 서베이체크상태 변경  */
	@Override
	public int updateSurveyCheck(String userId) {
		int result = sqlSession.update("tasteMapper.updateSurveyCheck", userId);
		return result;
	}
	
	
	@Override
	public int insertTatseSurvey(TasteSurvey survey) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertTaste(Taste taste) {
		int result = sqlSession.insert("tasteMapper.insertTaste", taste);
		return result;
	}

	@Override
	public List<Book> selectBooksByTaste(Taste taste) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Book> selectBooksByMajor(Member member) {
		// TODO Auto-generated method stub
		return null;
	}









}
