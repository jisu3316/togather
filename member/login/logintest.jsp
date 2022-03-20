<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- ��Ʈ��Ʈ�� css ��� -->
<link rel="stylesheet" href="../../css/bootstrap.css">
<script type="text/javascript" src="../../js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<!-- ��� ���̾ƿ� include -->
	

	<!-- ���ǿ� ������ ���� ��쿡�� �α��� â �����ֱ� -->
	<%
		if (session.getAttribute("userID") == null) {
	%>

	<div class="container">
		<div class="row">
			<!-- �Է��� �׸��� -->
			<div class="col-lg-4">
				<form action="../login.do?m=login" method="post">
					<!-- ID�Է� -->
					<div class="input-group mt-3 mb-1">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">ID</span>
						</div>
						<input type="text" name="phone" class="form-control"
							placeholder="Input ID" aria-label="Input ID"
							aria-describedby="basic-addon1" required>
					</div>
					<!-- PW�Է� -->
					<div class="input-group mb-2">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">PW</span>
						</div>
						<input type="password" name="pwd" class="form-control"
							placeholder="Input Password" aria-label="Input Password"
							aria-describedby="basic-addon1" required>
					</div>
					<!-- �ڵ� �α��� -->
					<div class="custom-control custom-checkbox mb-1">
						<input type="checkbox" class="custom-control-input"
							name="isAutoLogin" value="true" id="customCheck1"> <label
							class="custom-control-label" for="customCheck1">�α��� ����</label>
					</div>
					<!-- �α��� ��ư -->
					<button type="submit" class="btn btn-dark btn-sm btn-block">
						�α��� �ϱ�</button>
				</form>

				<!-- ȸ������ ��ư -->
				<button type="button" class="btn btn-dark btn-sm btn-block my-1"
					onclick="location.href='/register'">ȸ������ �ϱ�</button>

				<%
					}
				%>

				<!-- ȸ������ ����, �α��� ���� �� �޼����� ������ ���â ��� -->
				<%
					Object obj = session.getAttribute("loginMsg");
					if (obj != null) {
						String msg = (String) obj;
				%>
				<div class="alert alert-danger text-center" role="alert"><%=msg%></div>
				<%
					// ����� �޼����� ������
						session.removeAttribute("loginMsg");
					}
				%>
			</div>

			<!-- �׸� ���� �׸��� -->
			<div class="col-lg-8"></div>
		</div>
	</div>


</body>
</html>
</body>
</html>