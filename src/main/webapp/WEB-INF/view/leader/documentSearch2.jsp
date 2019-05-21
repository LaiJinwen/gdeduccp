<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<%@ include file="header.jsp"%>
<!-- /. NAV SIDE  -->
<div id="page-wrapper">
	<div class="header">
		<h1 class="page-header">
			Form Elements <small>Best form elements.</small>
		</h1>
		<ol class="breadcrumb">
			<li>文档任务管理</li>
			<li>文档搜索</li>
		</ol>

	</div>

	<div id="page-inner">
		<form role="form" class="form-inline" name="form1"
			action="${pageContext.request.contextPath}/leader/documentSearch" method="post">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="panel-body">
								<div class="row">
									<div class="form-group col-md-4">
										<label for="doc-num" class="col-sm-4 control-label">文档编号</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="doc-title"
												name="documentNo" value="${documentCondition.documentNo}"
												placeholder="文档编号">
										</div>
									</div>
									<div class="form-group col-md-4">
										<label for="doc-type" class="col-sm-4 control-label">文档类别</label>

										<div class="col-sm-8">
											<select class="selectbox form-control" name="documentType"
												id="doc-type">
												<option value="all">不限类别</option>
												<c:forEach var="documentType" items="${documentTypes}">
													<c:if
														test="${documentCondition.documentType eq documentType.documenttype}">
														<option value="${documentType.documenttype}" selected>${documentType.documenttype}</option>
													</c:if>
													<c:if
														test="${documentCondition.documentType ne documentType.documenttype }">
														<option value="${documentType.documenttype}">${documentType.documenttype}</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group col-md-4">
										<label for="doc-title" class="col-sm-4 control-label">文档标题</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="doc-title"
												name="title" value="${documentCondition.title}"
												placeholder="标题">
										</div>
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-4">
										<label for="doc-num" class="col-sm-4 control-label">高校名称</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="doc-title"
												name="schoolName" value="${documentCondition.schoolName}"
												placeholder="高校名称">
										</div>
									</div>
									<div class="form-group col-md-4">
										<label for="doc-type" class="col-sm-4 control-label">高校类别</label>
										<div class="col-sm-8">
											<select class="selectbox form-control" name="schoolType">
                                                <c:choose>
													<c:when test="${documentCondition.schoolType eq '公办本科'}">
														<c:set var="gbbk" value="selected" />
													</c:when>
													<c:when test="${documentCondition.schoolType eq '民办本科'}">
														<c:set var="mbbk" value="selected" />
													</c:when>
													<c:when test="${documentCondition.schoolType eq '公办高职'}">
														<c:set var="gbgz" value="selected" />
													</c:when>
													<c:when test="${documentCondition.schoolType eq '民办高职'}">
														<c:set var="mbgz" value="selected" />
													</c:when>
													<c:otherwise>
														<c:set var="qt" value="selected" />
													</c:otherwise>
												</c:choose>
												<option value="all" <c:out value="${qt}" />>不限类别</option>
												<option value="公办本科" <c:out value="${gbbk}" />>公办本科</option>
												<option value="民办本科" <c:out value="${mbbk}" />>民办本科</option>
												<option value="公办高职" <c:out value="${gbgz}" />>公办高职</option>
												<option value="民办高职" <c:out value="${mbgz}" />>民办高职</option>

											</select>
										</div>
									</div>
									<div class="form-group col-md-4">
										<button type="button" class="btn btn-default" onclick='goToPage(1)'>确定查询</button>
										<input type='hidden' id='page' name='page'
											value='${docs.currPage}' />
									</div>
								</div>

							</div>
							<div class="table-responsive text-center">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="text-center">序号</th>
											<th class="text-center">文档编号</th>
											<th class="text-center">文档类别</th>
											<th class="text-center">文档标题</th>
											<th class="text-center">单位</th>
											<th class="text-center">提交时间</th>
											<th class="text-center">状态</th>
											<th class="text-center">操作</th>
										</tr>
									</thead>
									<tbody>
									<c:set var="recno" value="${(docs.currPage-1)*docs.pageSize}" />
										<c:forEach var="doc" items="${docs.lists}">
											<tr>
											<c:set var="recno" value="${recno+1}" />
												<td>${recno}</td>
												<td>${doc.documentNo}</td>
												<td>${doc.documentType}</td>
												<td>${doc.title}</td>
												<td>${doc.organizationName}</td>
												<td>${doc.submitDate}</td>
												<td>${doc.documentState}</td>
												<td><a href="${pageContext.request.contextPath}/doc/${doc.documentNo}/${fn:substringBefore(doc.accessory,'.')}backup.docx"
													target=_blank>下载</a> &nbsp;&nbsp; <a
													href="${pageContext.request.contextPath}/doc/${doc.documentNo}/${fn:substringBefore(doc.accessory,'.')}backup.html"
													target=_blank>查看</a></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>

							<nav aria-label="Page navigation" >
								<ul class="pagination">
								    <c:set var="prepage"  value="enabled" />
								    <c:set var="nextpage" value="enabled" />
								    <c:set var="endpage" value="${docs.currPage+10}" />
									<c:set var="startpage" value="${docs.currPage}" />
									<c:choose>
										<c:when test="${endpage > docs.totalPage}">
										    <c:set var="endpage" value="${docs.totalPage}" />
										    <c:set var="startpage" value="${docs.totalPage-10}" />
										    <c:set var="nextpage" value="disabled" />
										</c:when>
										<c:when test="${docs.currPage+10 > docs.totalPage}'}">
											 <c:set var="endpage" value="${docs.totalPage}" />
										     <c:set var="startpage" value="${docs.totalPage-10}" />
										     <c:set var="nextpage" value="disabled" />
										</c:when>
										<c:when test="${docs.currPage < 10}">
										    <c:set var="endpage" value="10" />
										    <c:set var="startpage" value="1" />
										    <c:set var="prepage" value="disabled" />
										</c:when>
									</c:choose>
                                    <c:if test="${startpage<1}">
											<c:set var="startpage" value="1" />
									</c:if>
                                    <c:if test="${endpage>docs.totalPage}">
										<c:set var="endpage" value="${docs.totalPage}" />
									</c:if>
																			
									<li class="${prepage}">
									 <a href="#" aria-label="Previous"  onclick='goToPage(${startpage-10})'>
											<span aria-hidden="true">&laquo;</span>
									</a></li>
									<c:forEach var="p" begin="${startpage}" end="${endpage}" step="1">
										<c:set var="active" value="" />
										<c:if test="${docs.currPage == p }">
											<c:set var="active" value="active" />
										</c:if>
										<li class="${active}">
										  <a href='#' onclick='goToPage(${p})'>${p}</a>
										</li>
									</c:forEach>

									<li  class="${nextpage}">
									 <a href="#" aria-label="Next" onclick='goToPage(${endpage})'> 
										<span aria-hidden="true">&raquo;</span>
									 </a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</form>



		<footer>
			<p>广东省教育工委.</p>
		</footer>
	</div>
	<!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="/gdeduccp/assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="/gdeduccp/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="/gdeduccp/assets/js/jquery.metisMenu.js"></script>
<script src="/gdeduccp/assets/js/select2.full.min.js"></script>

<!-- Custom Js -->
<script src="/gdeduccp/assets/js/custom-scripts.js"></script>

<script>
function goToPage(page){
	document.getElementById("page").value=page;
	document.form1.submit();
}
</script>

</body>
</html>