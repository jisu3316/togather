package team1.togather.domain;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class QandA {
	private long qseq;
	private String qtitle;
	private String qcontent;
	private long mnum;
	private long qcount;
	private String qpwd;
	private Date qdate;
}
