package com.atometrics.interviewback.statistics;

import lombok.AllArgsConstructor;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class HeroStatisticsService {

	private final NamedParameterJdbcTemplate jdbcTemplate;

	public int countHeroes() {
		final MapSqlParameterSource params = new MapSqlParameterSource();
		return jdbcTemplate.queryForObject("SELECT COUNT(*) FROM interview.hero", params, Integer.class);
	}
}
