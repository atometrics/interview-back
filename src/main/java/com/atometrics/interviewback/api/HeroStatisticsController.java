package com.atometrics.interviewback.api;

import com.atometrics.interviewback.statistics.HeroStatisticsService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
@Slf4j
public class HeroStatisticsController {

	private final HeroStatisticsService heroStatisticsService;

	@GetMapping("/statistics/heroes/count")
	public Integer getCharacterCount() {
		log.info("Getting hero count");
		return heroStatisticsService.countHeroes();
	}
}
