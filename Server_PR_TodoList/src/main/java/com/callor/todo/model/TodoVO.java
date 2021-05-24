package com.callor.todo.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class TodoVO {

	private Long 	td_seq; // 일련번호
	private String td_date; // 작성일자
	private String td_time; // 작성시각
	private String td_todo; // 할일
	private String td_place; // 장소

}
