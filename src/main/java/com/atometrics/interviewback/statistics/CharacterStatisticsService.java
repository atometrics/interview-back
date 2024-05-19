package com.atometrics.interviewback.statistics;

import lombok.AllArgsConstructor;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CharacterStatisticsService {

	private final NamedParameterJdbcTemplate jdbcTemplate;

	public int countCharacters() {
		final MapSqlParameterSource params = new MapSqlParameterSource();
		return jdbcTemplate.queryForObject("SELECT COUNT(*) FROM interview.character", params, Integer.class);
	}
}
