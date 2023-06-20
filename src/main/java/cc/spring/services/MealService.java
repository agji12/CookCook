package cc.spring.services;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import cc.spring.dto.ChatDTO;
import cc.spring.dto.MealDTO;
import cc.spring.provider.ChatGPTProvider;

@Service
public class MealService {
	
	@Autowired
	private ChatGPTProvider GPTprovider;
	
	@Autowired
	private Gson gson;
//	
//	@Value("${aa}")
//	private String specialMap;
	
	@Value("${aa}")
	private String chatGptApiKey;
	
	// content 까지는 provider에서 가공해서 가져오고 그뒤는 service에서 각자 가공하기
	// 식단 추출 기능
	public void makeMeal(int dayTime) throws Exception {
		// msg 보내지 말고 값을 name 값으로 다 받아와서 여기서 문자열 출력
		System.out.println(chatGptApiKey);
//		System.out.println(specialMap);
//		String sendMsg = dayTime + "일치" + specialMap.get(special) + " 식단" + timeStr + "만 JSON데이터로 짜줘";
//		JsonObject content = GPTprovider.makeMeal(sendMsg);
		

	}

}


//package cc.spring.services;
//
//import java.sql.Timestamp;
//import java.util.ArrayList;
//import java.util.Calendar;
//import java.util.Date;
//import java.util.List;
//import java.util.Map;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Service;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.google.gson.Gson;
//import com.google.gson.JsonObject;
//
//import cc.spring.dto.ChatDTO;
//import cc.spring.dto.MealDTO;
//import cc.spring.provider.ChatGPTProvider;
//
//@Service
//public class MealService {
//	
//	@Autowired
//	private ChatGPTProvider GPTprovider;
//	
//	@Autowired
//	private Gson gson;
////	
////	@Value("${aa}")
////	private String specialMap;
//	
//	@Value("${aa}")
//	private String chatGptApiKey;
//	
//	// content 까지는 provider에서 가공해서 가져오고 그뒤는 service에서 각자 가공하기
//	// 식단 추출 기능
//	public List<MealDTO> makeMeal(int dayTime, int special ,int timeArrLength, String timeStr) throws Exception {
//		// msg 보내지 말고 값을 name 값으로 다 받아와서 여기서 문자열 출력
//		System.out.println(chatGptApiKey);
////		System.out.println(specialMap);
////		String sendMsg = dayTime + "일치" + specialMap.get(special) + " 식단" + timeStr + "만 JSON데이터로 짜줘";
////		JsonObject content = GPTprovider.makeMeal(sendMsg);
//		
//		List<MealDTO> result = new ArrayList<>();
//		
//		// 날짜 관련 로직
//		Calendar cal = Calendar.getInstance();
//		cal.setTime(new Date());
//		// Calendar -> Timestamp
//
//		for(int i = 0; i < dayTime; i++) {
//			System.out.println(dayTime);
//
//			JsonObject day = content.get("day"+(i+1)).getAsJsonObject();
////			System.out.println("day"+(i+1));
//			
//			ChatDTO dto = gson.fromJson(day.toString(), ChatDTO.class);
////			System.out.println(Arrays.toString(dto.getBreakfast()));
//			
//			for(int x = 0; x < timeArrLength; x++) {
//				if(dto.getClass().getDeclaredFields()[x].getName().equals("breakfast") && dto.getBreakfast() != null) {
//					for(int j = 0; j < dto.getBreakfast().length; j++) {
//						result.add(new MealDTO(0, 0, new Timestamp(cal.getTimeInMillis()), 1001, special, dto.getBreakfast()[j]));
//					}
//				}else if(dto.getClass().getDeclaredFields()[x].getName().equals("lunch") && dto.getLunch() != null) {
//					for(int j = 0; j < dto.getLunch().length; j++) {
//						result.add(new MealDTO(0, 0, new Timestamp(cal.getTimeInMillis()), 1002, special, dto.getLunch()[j]));
//					}
//				}else if(dto.getClass().getDeclaredFields()[x].getName().equals("dinner") && dto.getDinner() != null) {
//					for(int j = 0; j < dto.getDinner().length; j++) {
//						result.add(new MealDTO(0, 0, new Timestamp(cal.getTimeInMillis()), 1003, special, dto.getDinner()[j]));
//					}
//				}
//			}
//			cal.add(Calendar.DATE, 1);	
//		}
//		
//		
//		return result;
//	}
//
//}
