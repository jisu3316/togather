package team1.togather.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GroupTab {
	private long gseq;
	private String gloc;
	private String gname;
	private String gintro;
	private String interest;
	private int limit;
	private Date rdate;
	private long mnum;
	private String fname;
	private MultipartFile uploadFile;
}
