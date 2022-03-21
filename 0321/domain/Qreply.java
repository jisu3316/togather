package team1.togather.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.DATE;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Qreply {
	private long rqseq;
	private long qseq;
	private long mnum;
	private String qcontent;
	private DATE qdate;
}
