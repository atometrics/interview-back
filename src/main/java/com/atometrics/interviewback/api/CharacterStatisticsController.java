package com.atometrics.interviewback.api;

import com.atometrics.interviewback.statistics.CharacterStatisticsService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@Slf4j
public class CharacterStatisticsController {

	private final CharacterStatisticsService characterStatisticsService;

	@GetMapping("/statistics/characters/count")
	public Integer getCharacterCount() {
		log.info("Getting character count");
		return characterStatisticsService.countCharacters();
	}
}
