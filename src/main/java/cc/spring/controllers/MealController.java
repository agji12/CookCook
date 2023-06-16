package cc.spring.controllers;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.spring.dto.ChatDTO;
import cc.spring.dto.MealDTO;
import cc.spring.services.MealService;


@Controller
@RequestMapping("/meal/")
public class MealController {
	
	@Autowired
	private MealService mService;
	
	@RequestMapping("toMyMeal")
	public String toMyMeal() {
		return "meal/mealCalendar";
	}
	
	@RequestMapping("toMyBasket")
	public String toMyBasket() {
		return "meal/basket";
	}
	
	@ResponseBody
	@RequestMapping(value="aiMeal",  produces="text/plain;charset=utf-8")
	public ResponseEntity<List<MealDTO>> aiMeal( int dayTime, int timeArrLength) throws Exception {
		
		List<MealDTO> result = mService.makeMeal(dayTime, timeArrLength);
		
	    // ResponseEntity를 사용하여 결과 반환
	    return ResponseEntity.status(HttpStatus.OK)
	            .contentType(MediaType.APPLICATION_JSON)
	            .body(result);
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:?/error";
	}


}
