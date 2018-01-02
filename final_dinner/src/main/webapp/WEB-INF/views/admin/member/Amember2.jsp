<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.request.contextPath }/jquery/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/js/admin/member.js"></script>
<p>회원</p>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<h1 align="center" style="color: #428bca">Member Table Edit</h1>

	<div class="container">
		<div class="row">
			<button type="button" style="float: right; margin-bottom: 10px;"
				class="btn btn-info " onclick="$.addMember()">Add Member</button>
			<div class="col-md-12">

				<div class="table-responsive">
					<table id="mytable" class="table table-bordered">

						<thead><tr>
							<th>Id</th>
							<th>Pwd</th>
							<th>Name</th>
							<th>Email</th>
							<th>Tel</th>
							<th>Grade</th>
							<th>Actions</th>
						</tr></thead>

						<tbody>
							<c:forEach var="vo" items="${mem_list }" varStatus="idx">
								<tr>
									<td>
										<input id="items[${idx.count}].memNo" name="items[${idx.count}].memNo" value= '${vo.memNo }' type="hidden"/>
										<input type="hidden" value="" size="2">
										<input id="items[${idx.count}].memId" name="items[${idx.count}].memId" value= '${vo.memId }' disabled="disabled" size="4"/>
									</td>
									<td><input name="items[${idx.count}].memPwd" id="items[${idx.count}].memPwd" value= '${vo.memPwd }' disabled="disabled" size="3"/></td>
									<td><input name= 'items[${idx.count}].memName' id= 'items[${idx.count}].memName' value= '${vo.memName }' disabled="disabled" size="8"/></td>
									<td>
										<input name= 'items[${idx.count}].memEmail1' id= 'items[${idx.count}].memEmail1' value= '${vo.memEmail1 }' disabled="disabled" size="8"/>@
										<input name= 'items[${idx.count}].memEmail2' id= 'items[${idx.count}].memEmail2' value= '${vo.memEmail2 }' disabled="disabled" size="12"/>
									</td>
									<td>
										<input name= 'items[${idx.count}].memTel1' id= 'items[${idx.count}].memTel1' value= '${vo.memTel1 }'  disabled="disabled" size="3"/>-
										<input name= 'items[${idx.count}].memTel2' id= 'items[${idx.count}].memTel2' value= '${vo.memTel2 }' disabled="disabled" size="4"/>-
										<input name= 'items[${idx.count}].memTel3' id= 'items[${idx.count}].memTel3' value= '${vo.memTel3 }' disabled="disabled" size="4"/>
									</td>
									<td><input id= 'items[${idx.count}].memGrade' value= '${vo.memGrade }' disabled="disabled" size="1"/></td>
									<td>
										<button class="btn btn-primary"
											onclick="$.editMember(${idx.count})">Edit</button>
										<button class="btn btn-danger"
											onclick="$.deleteMember(${idx.count})">Delete</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
</div>
