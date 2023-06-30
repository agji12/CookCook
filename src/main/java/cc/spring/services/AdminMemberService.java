package cc.spring.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.spring.dto.MemberDTO;
import cc.spring.dto.ShopListDTO;
import cc.spring.repositories.AdminDAO;
import cc.spring.repositories.BusinessMemberDAO;
import cc.spring.repositories.ClientMemberDAO;
import cc.spring.repositories.ShopDAO;

@Service
public class AdminMemberService {
	@Autowired
	private AdminDAO adminDAO;
	
	@Autowired
	private BusinessMemberDAO bDAO;
	
	@Autowired
	private ClientMemberDAO cDAO;
	
	@Autowired
	private ShopDAO sDAO;
	
	public boolean login(String id, String pw) {
		return adminDAO.login(id, pw);
	}
	
	public MemberDTO selectAdminMemberInfo(String id, String pw) {
		return adminDAO.selectAdminMemberInfo(id, pw);
	}
	
	public List<MemberDTO> selectAllBusinessMember() {
		return bDAO.selectAllBusinessMember();
	}
	
	public List<MemberDTO> selectAllClientMember() {
		return cDAO.selectAllClientMember();
	}
	
	public Map<String, Integer> selectMealCount() {
		Map<String, Integer> mealCountMap = new HashMap<String, Integer>();
		mealCountMap.put("mealSuccessTotal", adminDAO.selectSuccessMeal());
		mealCountMap.put("mealFailTotal", adminDAO.selectFailMeal());
		return mealCountMap;
	}	
	
	public Map<String, Integer> selectBasketCount(){
		Map<String, Integer> basketCountMap = new HashMap<>();
		basketCountMap.put("basketSuccess", adminDAO.selectSuccessBasket());
		basketCountMap.put("basketFail", adminDAO.selectFailBasket());
		return basketCountMap;
	}
	
	public Map<String, Integer> selectTotalCount(){
		Map<String, Integer> totalCountMap = new HashMap<>();
		totalCountMap.put("totalSuccess", adminDAO.selectTotalSuccess());
		totalCountMap.put("totalFail", adminDAO.selectTotalFail());
		return totalCountMap;
	}
	
	public List<MemberDTO> ClinetUserList() {
		return adminDAO.clientUserList();
	}

  public List<MemberDTO> BusinessUserList() {
		return adminDAO.businessUserList();
	}
	
	public String recentVisitBusiness() {
		return bDAO.recentVisitBusiness();
  }
	
	public List<ShopListDTO> selectShopList() {
		return sDAO.shopList();
	}
	
}
