package cc.spring.repositories;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.spring.dto.BoardAnnouncementDTO;
import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.BoardReviewDTO;
import cc.spring.dto.ReviewImgDTO;
import cc.spring.dto.TotalMemberDTO;

@Repository
public class BoardDAO {

	
	@Autowired
	private SqlSessionTemplate mybatis;
	


	

//===========================================================================================

	
	

	public int selectReviewSeq() {
		return mybatis.selectOne("Board.selectReviewSeq");
	}
	
	
	
	public int insertReview(BoardReviewDTO dto) {
		
		mybatis.insert("Board.insertReview",dto);
		return dto.getCode();
	}
	
	public int insertReviewImage(ReviewImgDTO rdto) {
		return mybatis.insert("Board.insertReviewImage", rdto);
	}


	public int insertFree(BoardFreeDTO dto, int membercode) {
		Map<String ,Object> param = new HashMap<>();
		param.put("dto", dto);
		param.put("membercode", membercode);
		return mybatis.insert("Board.insertFree",param);
	}

	
	
	
	
	public int insertAnnouncement(BoardAnnouncementDTO dto,int membercode) {
		Map<String ,Object> param = new HashMap<>();
		param.put("dto", dto);
		param.put("membercode", membercode);
		return  mybatis.insert("Board.insertAnnouncement",param);
	}
	

	public List<BoardFreeDTO> selectFreelist() {
		return  mybatis.selectList("Board.selectFreelist");
	}



	public List<BoardAnnouncementDTO> selectAnnouncementlist() {
		return  mybatis.selectList("Board.selectAnnouncementlist");
	}



	public List<BoardReviewDTO> selectReviewlist() {
		return  mybatis.selectList("Board.selectReviewlist");
	}


//=====================================================================
	
	public BoardFreeDTO selectFreeContent(int code) {
		return  mybatis.selectOne("Board.selectFreeContent",code);
	}



	public BoardAnnouncementDTO selectAnnouncementContent(int code) {
		return  mybatis.selectOne("Board.selectAnnouncementContent",code);
	}


	public BoardReviewDTO selectReviewContent(int code) {
		return  mybatis.selectOne("Board.selectReviewContent",code);
	}



	public int updateFree(BoardFreeDTO dto) {
		return mybatis.update("Board.updateFree",dto);
	}

	





	


	







}
