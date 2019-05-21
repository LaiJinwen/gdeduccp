<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta name="viewport" http-equiv="x-ua-compatible"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no,target-densitydpi=device-dpi,ie=7">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/mobile/css/css6.css">
<script
	src="${pageContext.request.contextPath}/assets/mobile/css/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.js"></script>





</head>
<body>

	<div id="signuppage" data-role="page">
		<div data-role="header" data-position="fixed">
			<div id="title">
				<h2>会议报名</h2>
			</div>
		</div>
		<div data-role="main" class="ui-content">
			<div id="titlediv" class="ui-field-contain">
				<h2>${meeting.meetingtitle}</h2>
				<p id="meetingtitle">
					会议时间：
					<fmt:formatDate value="${meeting.meetingtime}" pattern="yyyy-MM-dd" />
				</p>
				<p id="meetingtitle">会议地点：${meeting.meetingaddresses}</p>

			</div>
			<div id="inputdiv" class="ui-field-contain">
				<script>
					$(document)
							.on(
									"pagecreate",
									"#signuppage",
									function() {
										$("#addbtn")
												.on(
														"click",
														function() {
															var name = $(
																	"#attendeename")
																	.val();
															var email = $(
																	"#email")
																	.val();
															var phone = $(
																	"#telephone")
																	.val();
															if (name == ""
																	|| name == null) {
																alert("请输入姓名");
																return;
															}
															 
														 
															$.ajax({
																		type : 'post',
																		url : '${pageContext.request.contextPath }/schoolMeeting/doAddMeetingAttendees',
																		data : $(
																				"form")
																				.serialize(),
																		success : function(
																				result) {
																			if (result.state == 1) {
																				alert('添加成功！');
																				window.location.reload();
																				/*
																				var tr = $("<tr></tr>");
																				tr.html('<td><div>姓名：'
																								+ name
																								+ '</div><div>性别：'
																								+ result.data.sex
																								+ '</div><div>职务：'
																								+ result.data.duty
																								+ '</div><div>职称：'
																								+ result.data.jobtitle
																								+ '</div><div>电话：'
																								+ result.data.telephone
																								+ '</div><div>邮件：'
																								+ result.data.email
																								+ '</div><div>住宿：'
																								+ result.data.stay
																								+ '</div><div>说明：'
																								+ result.data.note
																								+ '</div><div>发票：'
																								+ result.data.invoicecontent
																								+ '</div><div>地址：'
																								+ result.data.address
																								+ '</div></td>');
																				$("tbody").append(tr);
                                                                                 */
																			} else {
																				alert('添加失败，请重新添加');
																			}
																		}
																	});

														})

										$("tbody").on(
														"taphold",
														"tr",
														function() {
															if (confirm("确定删除吗？")) {
																$(this)
																		.remove();
																$
																		.ajax({
																			type : 'post',
																			url : '${pageContext.request.contextPath }/schoolMeeting/cancelSigninMobile?attendId='
																					+ $(
																							this)
																							.attr(
																									"id")
																					+ '&taskId=${meetingTask.taskid}&meetingId=${meeting.meetingid}',
																			success : function(
																					result) {
																				if (result.state == 1) {
																					alert('删除成功!');
																					
																				} else {
																					alert('删除失败!');
																				}
																			}
																		});

															} else {
															}

														})
									})
				</script>

				<h2>参会人员</h2>
				<form class="form-horizontal" role="form" id="form">
					<input type="hidden" class="form-control" id="taskId" name="taskId"
						value="${meetingTask.taskid}"> <input type="hidden"
						class="form-control" id="meetingId" name="meetingId"
						value="${meeting.meetingid}">

					<div class="sub-title">姓名</div>
					<div>
						<input type="text" id="attendeename" name="attendeename">
					</div>
					<c:if test="${meeting.sex  eq 1}">
						<div class="sub-title">性别</div>
						<div>

							<div>
								<input type="radio" id="radio4" name="sex" value="男" checked>
								<label for="radio4"> 男 </label>
							</div>
							<div>
								<input type="radio" id="radio5" name="sex" value="女"> <label
									for="radio5"> 女 </label>
							</div>

						</div>
					</c:if>

					<c:if test="${meeting.duty  eq 1}">
						<div class="sub-title">职务</div>
						<div>
							<input type="text" id="duty" name="duty">
						</div>
					</c:if>

					<c:if test="${meeting.jobtitle  eq 1}">
						<div class="sub-title">职称</div>
						<div>
							<input type="text" id="jobTitle" name="jobtitle">
						</div>
					</c:if>
					<c:if test="${meeting.email  eq 1}">
						<div class="sub-title">邮件</div>
						<div>
							<input type="text" id="email" name="email">
						</div>
					</c:if>
					<c:if test="${meeting.telephone  eq 1}">
						<div class="sub-title">电话</div>
						<div>
							<input type="text" id="telephone" name="telephone" maxlength="11"
								onkeyup="this.value=this.value.replace(/\D/g,'')"
								onafterpaste="this.value=this.value.replace(/\D/g,'')">
						</div>
					</c:if>

					<c:if test="${meeting.invoicecontent  eq 1}">
						<div class="sub-title">发票内容</div>
						<div>
							<input type="text" id="invoiceContent" name="invoicecontent">
						</div>
					</c:if>
					<c:if test="${meeting.address  eq 1}">
						<div class="sub-title">邮寄地址</div>
						<div>
							<input type="text" id="address" name="address">
						</div>
					</c:if>
					<c:if test="${meeting.stay  eq 1}">
						<div class="sub-title">是否住宿</div>
						<div>

							<div>
								<input type="radio" id="radio6" name="stay" value="是"> <label
									for="radio6"> 是 </label>
							</div>
							<div>
								<input type="radio" id="radio7" name="stay" value="否" checked>
								<label for="radio7"> 否 </label>
							</div>


						</div>
						<div class="sub-title">住宿备注</div>
						<div>
							<textarea rows="3" name='note'></textarea>
						</div>
					</c:if>
					<input type="button" id="addbtn" data-inline="true" value="添加参会人员">
				</form>
			</div>
			<div class="ui-field-contain">
				<h2>参会名单(长按删除)</h2>
				<div id="tablediv">
					<style>
tr {
	border-bottom: 1px solid lightgray;
}

tr:nth-child(even) {
	background: #e9e9e9;
}
</style>
					<table data-role="table" class="ui-responsive ui-shadow"
						id="myTable">
						<thead>
							<tr>
								<th data-priority="1"></th>
							</tr>
						</thead>
						<tbody>
							<c:set var="recno" value="0" />
							<c:forEach var="doc" items="${meetingAttendees}">

								<tr id='${doc.attendeeid}'>
									<td><c:set var="recno" value="${recno+1}" />
										<div>序号：${recno}</div>
										<div>姓名：${doc.attendeename}</div> <c:if
											test="${meeting.sex  eq 1}">
											<div>性别：${doc.sex}</div>
										</c:if> <c:if test="${meeting.duty  eq 1}">

											<div>职务：${doc.duty}</div>
										</c:if> <c:if test="${meeting.jobtitle  eq 1}">
											<div>职称：${doc.jobtitle}</div>
										</c:if> <c:if test="${meeting.email  eq 1}">
											<div>电话：${doc.telephone}</div>
										</c:if> <c:if test="${meeting.telephone  eq 1}">
											<div>邮件：${doc.email}</div>
										</c:if> <c:if test="${meeting.stay  eq 1}">
											<div>住宿：${doc.stay}</div>
											<div>说明：${doc.note}</div>
										</c:if> <c:if test="${meeting.invoicecontent  eq 1}">
											<div>发票：${doc.invoicecontent}</div>
										</c:if> <c:if test="${meeting.address  eq 1}">
											<div>地址：${doc.address}</div>
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>

			</div>

		</div>
	</div>
</body>
</html>