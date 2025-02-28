<!doctype html>
<html>
<%@page import="java.math.*"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
		<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
		<%@page import="org.bob.eprocure.enums.ClientUserPermission" %>
		<%@page import="org.bob.eprocure.common.util.CurrencyFormatting"%>
		<%@page import="org.bob.authentication.UserUtil"%>
		<c:set var="USER" value="<%= UserUtil.getUserFromSession(request)%>" />
		<%@page import="org.bob.po.mngmnt.enums.PriceComponent"%>
		<%@page import="org.bob.tender.security.RequestTokenUtil"%>
		<c:set var="AMOUNT" value="<%=PriceComponent.CompType.AMOUNT.getValue()%>"></c:set>
		<c:set var="PERCENTAGE" value="<%=PriceComponent.CompType.PERCENTAGE.getValue()%>"></c:set>
		<c:set var="BASEPRICE" value="<%=PriceComponent.CalculationOn.BASE_PRICE.getValue()%>"></c:set>
		<c:set var="CALCULATEDPRICE" value="<%= PriceComponent.CalculationOn.CALCULATED_PRICE.getValue()%>"></c:set>
		<c:set var="INCREMENT" value="<%= PriceComponent.CalculationType.ADDITION.getValue()%>"></c:set>
		<c:set var="DECREMENT" value="<%= PriceComponent.CalculationType.SUBTRACTION.getValue()%>"></c:set>
<head>
    <meta charset="utf-8">

    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/po-css/purchase-order.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/po-css/common-text.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/po-css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/po-css/font-family.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/po-css/main-file.css" rel="stylesheet" type="text/css">
    
    <link href="${pageContext.request.contextPath}/po-css/style.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/po-css/catalog-detail.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/po-css/catlog.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/po-css/recently-added-catalog.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/po-css/adv-reg-product-services.css" rel="stylesheet" type="text/css">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/po-css/req-dtl.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/po-css/requisition.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="etender-css/jquery.datetimepicker.css">
    <script src="${pageContext.request.contextPath}/po-js/product-catalog.js"></script> 
    <%-- <script src="${pageContext.request.contextPath}/po-js/catalog.js"></script> --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="etender-javascript/jquery.datetimepicker.js"></script>
	<script src="etender-js/comboinput/chosen.jquery.js"></script>
	<script src="${pageContext.request.contextPath}/po-js/ckeditor/ckeditor.js"></script>
     <link rel="stylesheet" href="etender-css/main.css">
    <script src="${pageContext.request.contextPath}/po-js/requisition.js"></script>
    
    
 <style>   
 .req-dialog {
	  width: 95%;
	  height: 95%;
	  margin: 8px;
	  padding: 5px 17px;
	}

 .req-content {
	  height: auto;
	  min-height: 100%;
	  border-radius: 0;
	}
	
	

	.items-table {
		background-color: #FFF;
	}
	.items-table .main-header {
		background-color: #9eb3ba;
		color: #FFF;
		font-weight: bold;
	}
	.items-table .main-content {
		background-color: #c9d8dc;
	}
	
	.items-table .sub-header {
		background-color: #e6eef0;
		font-weight: bold;
	}

</style>

</head>

<body class="body-req-detail">
<input type="hidden" id="logged_user_client_id" value="<%= UserUtil.getUserFromSession(request).getClientId()%>">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-left:3.8%;padding-right:8%;margin-top:50px;">
        <div class="breadcrumb">
            <a href="getPoIndexPage">Purchase Order Listing</a>
            <img src="${pageContext.request.contextPath}/po-images/right-arrow.png"> <label>Purchase Order Details</label>

        </div>
        <!-- approval flow start -->
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 upper-margin-req-detail">
            <div class="company-registration-table comp-reg-tbl-margin container-fluid no-padding">
                <div class=" thick-border">
                    <div>
                        <label class="adv-reg-comp-dtls-heading-lbl approval-label-align">Approval Current Status</label>
                        <button class="req-status-log-button" data-toggle="modal" data-target="#statuslogPopup">STATUS LOG</button>
                    </div>

                </div>
                <hr class="reg-comp-hr">
               


 <div class="container-fluid container-scroll">
                    <div class="row row-horizon">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                <div class="tblmargin">
                                    <div class="adv-reg-comp-first-lbl">
                                        Creator
                                    </div>
                                    <div class="adv-reg-comp-sub-lbl">
                                       ${REQUISITOR.userName}
                                    </div>

                                    <div class="adv-reg-comp-dtls-lbl">
                                        ${REQUISITOR.designation}
                                    </div>
                                </div>

                            </div>
                            <c:if test="${PO_DETAILS.poStatus eq 2 and empty ApprovalStatus}">
                            	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                <div class="tblmargin">
                                    <div class="adv-reg-comp-first-lbl">
                                        Approver
                                    </div>
                                    <div class="adv-reg-comp-sub-lbl">
                                        ${REQUISITOR.userName}
                                    </div>
                                     <div class="adv-reg-comp-dtls-lbl">
                                         ${REQUISITOR.designation}
                                    </div>
                                </div>

                            	</div>
                            </c:if>
                             <c:if test="${not empty SUPPLIER}">  
							<c:forEach items="${SUPPLIER}" var="supp">
                            	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                <div class="tblmargin">
                                    <div class="adv-reg-comp-first-lbl">
                                        Supplier
                                    </div>
                                    <div class="adv-reg-comp-sub-lbl">
                                        ${supp.userName}
                                    </div>
                                     <div class="adv-reg-comp-dtls-lbl">
                                         ${supp.designation}
                                    </div>
                                </div>

                            	</div>
                            	</c:forEach>
                             </c:if>
                            
                           <%--   <c:if test="${(PO_DETAILS.poStatus eq 13) and empty ApprovalStatus}">
                            	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                <div class="tblmargin">
                                    <div class="adv-reg-comp-first-lbl">
                                        Supplier
                                    </div>
                                    <div class="adv-reg-comp-sub-lbl">
                                        ${SUPPLIER.userName}
                                    </div>
                                     <div class="adv-reg-comp-dtls-lbl">
                                         ${SUPPLIER.designation}
                                    </div>
                                </div>

                            	</div>
                            </c:if>
 --%>                         <%--    <c:if test="${(PO_DETAILS.poStatus eq 14) and empty ApprovalStatus}">
                            	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                <div class="tblmargin">
                                    <div class="adv-reg-comp-first-lbl">
                                        Supplier
                                    </div>
                                    <div class="adv-reg-comp-sub-lbl">
                                        ${SUPPLIER.userName}
                                    </div>
                                     <div class="adv-reg-comp-dtls-lbl">
                                         ${SUPPLIER.designation}
                                    </div>
                                </div>

                            	</div>
                            </c:if> --%>
							<c:forEach items="${ApprovalStatusMap}" var="appr" varStatus="loop">
                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                <div class="tblmargin">
                                    <div class="adv-reg-comp-first-lbl">
                                        Approver L${appr.value.approvalIndex}
                                    </div>
                                    <div class="adv-reg-comp-sub-lbl">
                                        ${appr.value.userName}
                                    </div>

                                    <div class="adv-reg-comp-dtls-lbl">
                                         ${appr.value.designation}
                                    </div>
                                </div>

                            </div>
							</c:forEach>
							<c:forEach items="${ApprovalStatus}" var="appr" varStatus="loop">
                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                <div class="tblmargin">
                                    <div class="adv-reg-comp-first-lbl">
                                        Approver L${loop.count}
                                    </div>
                                    <div class="adv-reg-comp-sub-lbl">
                                        ${appr.userName}
                                    </div>

                                    <div class="adv-reg-comp-dtls-lbl">
                                         ${appr.designation}
                                    </div>
                                </div>

                            </div>
							</c:forEach>
                        </div>
                        
                        
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                <div class="profile-req-div"> <img src="req-images/profile-req-done.png" class="profile-req-img-done">
                                </div>
                                 <c:if test="${PO_DETAILS.poStatus ne 0 or (PO_DETAILS.poStatus eq 0 and AutoApproval eq false)}">
                                <div class="links tblmargin">

                                </div></c:if>
                                <div class="adv-reg-comp-first-lbl status-req-margin">
                                    Created
                                </div>
                                <div class="adv-reg-comp-dtls-lbl">
                                    ${PO_DETAILS.poCreatedDate}
                                </div>
                            </div>
							<c:if test="${PO_DETAILS.poStatus eq 2 and empty ApprovalStatus}">
							 <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                <div class="profile-req-div"> <img src="req-images/profile-req-done.png" class="profile-req-img-done">
                                </div>
                                <!-- <div class="links tblmargin">

                                </div> -->
                                <div class="adv-reg-comp-first-lbl status-req-margin">
                                    Approved
                                </div>
                                <div class="adv-reg-comp-dtls-lbl">
                                    ${PO_DETAILS.approvedDate}
                                </div>
                            </div>
							 </c:if>
							 <c:if test="${not empty SUPPLIER}">
							<c:forEach items="${SUPPLIER}" var="supp" varStatus="loop">
							 <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                <div class="profile-req-div"> <img src="req-images/profile-req-done.png" class="profile-req-img-done">
                                </div>                         
                                <div class="adv-reg-comp-first-lbl status-req-margin">
                                <c:if test="${supp.supplierApproveRejectStatus eq 1}">
                                    Accepted
                                    </c:if>
                                    <c:if test="${supp.supplierApproveRejectStatus eq 2}">
                                    Rejected
                                    </c:if>
                                </div>
                                <div class="adv-reg-comp-dtls-lbl">
                                    ${supp.supplierApproveRejectDate}
                                </div>
                            </div>
                            </c:forEach>
							 </c:if>
							
							<%--  <c:if test="${PO_DETAILS.poStatus eq 14 and empty ApprovalStatus}">
							 <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
                                <div class="profile-req-div"> <img src="req-images/profile-req-done.png" class="profile-req-img-done">
                                </div>
                                <!-- <div class="links tblmargin">

                                </div> -->
                                <div class="adv-reg-comp-first-lbl status-req-margin">
                                   Rejected
                                </div>
                                <div class="adv-reg-comp-dtls-lbl">
                                    ${SUPPLIER.supplierApproveRejectDate}
                                </div>
                            </div>
							 </c:if> --%>
							 <c:forEach items="${ApprovalStatusMap}" var="appr" varStatus="loop">
							 	<c:if test="${appr.value.approvalStatus eq 1}">
							 		<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
		                                <div class="profile-req-div"> <img src="req-images/profile-req-done.png" class="profile-req-img-done">
		                                </div>
		                                <c:if test="${!loop.last}">
		                                <div class="links tblmargin">
		
		                                </div></c:if>
		                                <div class="adv-reg-comp-first-lbl status-req-margin">
		                                    Approved
		                                </div>
		                                <div class="adv-reg-comp-dtls-lbl">
		                                    ${appr.value.approvedDate}
		                                </div>
		                            </div>
							 	</c:if> 
							 	<c:if test="${appr.value.approvalStatus eq 0 and appr.value.approvalAllowed eq 1}">
							 		<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
		                                <div class="profile-req-div profile-req-img-color"> <img src="req-images/profile-req-current.png" class="profile-req-img-current">
		                                </div>
		                                <c:if test="${!loop.last}">
		                                <div class="links-not-completed">
		
		                                </div></c:if>
		                                <div class="adv-reg-comp-first-lbl status-req-margin">
		                                    <!-- Accepted -->
		                                </div>
		                                <div class="adv-reg-comp-dtls-lbl">
		                                    <!-- 21/11/2017 - 11:00 AM -->
		                                </div>
		                            </div>
							 	</c:if>
							 	<c:if test="${appr.value.approvalStatus eq 0 and appr.value.approvalAllowed eq 0}">
							 		<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
		                                <div class="profile-req-div-blank"> <img src="req-images/profile-req-remain.png" class="profile-req-img-remain">
		                                </div>
		                                <c:if test="${!loop.last}">
		                                <div class="links-not-completed">
		
		                                </div></c:if>
		                                <div class="adv-reg-comp-first-lbl status-req-margin">
		                                </div>
		                                <div class="adv-reg-comp-dtls-lbl">
		                                </div>
		                            </div>
							 	</c:if>
							 </c:forEach>
                            <c:forEach items="${ApprovalStatus}" var="appr" varStatus="loop">
                            	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
		                                <div class="profile-req-div"> <img src="req-images/profile-req-done.png" class="profile-req-img-done">
		                                </div>
		                                <c:if test="${!loop.last}">
		                                <div class="links tblmargin">
		
		                                </div></c:if>
		                                <div class="adv-reg-comp-first-lbl status-req-margin">
		                                    Approved
		                                </div>
		                                <div class="adv-reg-comp-dtls-lbl">
		                                    ${appr.approvedDate}
		                                </div>
		                            </div>
                            </c:forEach>
                            
                            
                           
                        </div>

                    </div>
                </div> 


            </div>
        </div>
        <!-- approval flow end -->
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class=" req-dtl container-fluid nopadding main-div-detailpage-align">
                <div class="col-lg-12 col-sm-12 col-md-12 req-dtl-header flex-align">
                    <div class="col-md-7 col-sm-8 col-xs-9 adv-reg-comp-dtls-heading-lbl main-req-title">
                        Purchase Order
                    </div>
                </div>
                <%-- <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 setback1">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">${PO_DETAILS.companyName}</div>
                            <div class="adv-reg-comp-dtls-lbl addr-width">${PO_DETAILS.address}</div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl"></div>
                            <div class="adv-reg-comp-dtls-lbl addr-width"></div>
                        </div>
                    </div>
                </div> --%>
                 <form name="poForm" id="poFromId2">
                  <input type="hidden"  id="awardClientNames" name="awardClientNames" value="${CLIENT_NAME}">
                  
                   <input type="hidden"  id="updateQuantity" name="updateQuantity" value="0">
                    <input type="hidden"  id="updateItems" name="updateItems" value="">
                     <input type="hidden"  id="updateItemQuantity" name="updateItemQuantity" value="">
                      <input type="hidden"  id="updatePresentQuantity" name="updatePresentQuantity" value="">
                      <input type="hidden"  id="updateAvailableQuantity" name="updateAvailableQuantity" value="">
                       <input type="hidden"  id="poItems" name="poItems" value="">
                       
                        <input type="hidden"  id="totalPrices" name="totalPrices" value="">
                      
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 setback1">
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="tblmargin">

                            <div class="adv-reg-comp-sub-lbl">
                                PO Number : <label class="adv-reg-comp-dtls-lbl no-margin">${PO_DETAILS.purchaseOrderId}</label>
                            </div>
                            <div class="adv-reg-comp-sub-lbl">
                                PO Date : <label class="adv-reg-comp-dtls-lbl no-margin">${PO_DETAILS.poCreatedDate}</label>
                            </div>
                            <div class="adv-reg-comp-sub-lbl">
                                Currency : <label class="adv-reg-comp-dtls-lbl">${PO_DETAILS.currencyName}</label>
                            </div>
                        </div>
                    </div>
                    <c:if test="${not empty PO_DETAILS.reqId}">
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                                Requisition No. : <label class="adv-reg-comp-dtls-lbl no-margin">
                                <a href="#" onclick="getRequisitionModal('${PO_DETAILS.reqId}')">${PO_DETAILS.reqId}</a>
                                </label>
                            </div>
                            <div class="adv-reg-comp-sub-lbl">
                                Created By : <label class="adv-reg-comp-dtls-lbl no-margin">${ReqCreatDetails.userName}</label>
                            </div>
                            <div class="adv-reg-comp-sub-lbl">
                                Contact No : <label class="adv-reg-comp-dtls-lbl">${ReqCreatDetails.contactNo}</label>
                            </div>
                        </div>
                    </div>
                    </c:if>
                   <%-- <c:if test="${not empty PO_DETAILS.reqId}"> --%>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        
                            <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                                PO Type :<span style="color:#FF0000;" class="mandatory_budget">*</span>
                                <select class="basic-reg-comp-dtls-txt" id="poType" name="reqPoType" style="height:24px;width:44%;">
			                          <option value="">Select</option>
			                              <c:forEach items="${PO_TYPE}" var="poTypeValue">
			                               <option  value="${poTypeValue.key}" <c:if test="${PO_DETAILS.reqPoType eq poTypeValue.key}">selected="selected"</c:if>>${poTypeValue.value}</option>
			                              </c:forEach>
                             	</select>
                             	<div class="row">
                               <label class="adv-reg-popup-validation-lbl" id="errorPoType"></label>
                               </div>
                             	
                            </div>
                        <c:if test="${not empty PO_DETAILS.reqId}">   
                            <div class="adv-reg-comp-sub-lbl" id="budgetCodes">
                                <span id="poTypeText">Budget Code:</span><c:if test="${PO_DETAILS.reqPoType eq '1'}"><span  style="color:#FF0000;" class="mandatory_budget">*</span></c:if>
                                <div class="adv-reg-comp-dtls-lbl addr-width">
                            <div class="row">
                               <input type="text"  style="height:24px;width:44%;margin-left: 16px;" id="tempErpReferenceNumId" name="erpReferenceNum" class="adv-reg-popup-textbox"  maxlength="20" value="${PO_DETAILS.erpRefNum}">
                               </div>
                               <div class="row">
                               <label class="adv-reg-popup-validation-lbl" id="errorTempErpReferenceNumId"></label>
                               </div>
                            </div>
                            </div>
                            </c:if>
                        </div>
                       
                    </div>
                    
                     
                     <c:if test="${empty PO_DETAILS.reqId}">
                        <input type="hidden"   id="poType"   value="${PO_DETAILS.poType}">                                
                           
                     </c:if>
                     
                     
                     
                    <%-- <c:if test="${not empty PO_DETAILS.reqId}">
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        
                            <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                                Po Type : <label class="adv-reg-comp-dtls-lbl no-margin">${ReqCreatDetails.poTitle}</label>
                            </div>
                            <div class="adv-reg-comp-sub-lbl">
                                <span id="poTypeText">Budget Code:</span><span id="poTypeTextMandatary" style="color:#FF0000;display:none;" class="mandatory_budget">*</span>
                                <div class="adv-reg-comp-dtls-lbl addr-width">
                            <div class="row">
                               <input type="text"  style="height:24px;width:44%;margin-left: 16px;" id="tempErpReferenceNumId" class="adv-reg-popup-textbox"  maxlength="20" value="${PO_DETAILS.erpRefNum}">
                               </div>
                               <div class="row">
                               <label class="adv-reg-popup-validation-lbl" id="errorTempErpReferenceNumId"></label>
                               </div>
                            </div>
                            </div>
                        </div>
                       
                    </div>
                   </c:if> --%>
                   
                   
                    <div class="col-lg-4 col-md-4 col-sm-4">
                         <input type="hidden" name="businessUnit" id="businessUnit" value="${PO_DETAILS.businessUnit}">
                            <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                               <c:if test="${SOURCING_CONFIG.securityCodeIntegration ne true}">
                               Business Unit : 
                               </c:if>
                               <c:if test="${SOURCING_CONFIG.securityCodeIntegration eq true}">
                               Plant : 
                               </c:if>
                               <label class="adv-reg-comp-dtls-lbl no-margin">${PO_DETAILS.businessUnitName}</label>
                            </div>
                           
                          
                            </div>
                    </div>
                       
                       
                  
                    
                    
                </div>
                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                 	 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    	<div class="tblmargin">
		                    	<div class="adv-reg-comp-sub-lbl">
                           Payment Terms :<span style="color:#FF0000;" class="mandatory_budget">*</span>
                                
                               
                                
                              
                                
                                 <c:if test="${SOURCING_CONFIG.multiplePaymentTerms ne true}">
                                 
                                 
                                 
                                 
                                <select  class="basic-reg-comp-dtls-txt" id="paymentTerm" name="paymentTerm" onchange="changePaymentTerm();" <c:if test="${PO_DETAILS.version eq 1 && !PO_DETAILS.rejectedPo}">disabled="disabled"</c:if>>
			                          <option value="">Select</option>
			                              <c:forEach items="${PAYMENT_MAP}" var="listofPay">
			                               <option value="${listofPay.key}" <c:if test="${PO_DETAILS.paymentTermId eq listofPay.key}">selected="selected"</c:if>>${listofPay.value}</option>
			                              </c:forEach>
                             	</select>
                             	</c:if>
                             	
                             	 <c:if test="${SOURCING_CONFIG.multiplePaymentTerms eq true}">
                             	 
                             	  <a href="#" onclick="showPaymentTerms()">Show Payment Terms</a>
                             	 
                             	 <select style="display: none;" class="basic-reg-comp-dtls-txt" id="paymentTerm" name="paymentTerm" onchange="changePaymentTerm();" <c:if test="${PO_DETAILS.version eq 1 && !PO_DETAILS.rejectedPo}">disabled="disabled"</c:if>>
			                          <option value="">Select</option>
			                              <c:forEach items="${PAYMENT_MAP}" var="listofPay">
			                               <option value="${listofPay.key}" <c:if test="${PO_DETAILS.paymentTermId eq listofPay.key}">selected="selected"</c:if>>${listofPay.value}</option>
			                              </c:forEach>
                             	</select>
                             	 
                             	 </c:if>
                             	
                             	
                             	<div class="row">
                               <label class="adv-reg-popup-validation-lbl" id="errorPaymentTerm"></label>
                               </div>
                             	
                            	</div>
                            </div>
                         </div>
                        <%--  <c:if test="${PO_DETAILS.directRequisition eq true}"> --%>
                        <c:if test="${not empty PO_DETAILS.incoType}"> 
                         <div class="col-lg-4 col-md-4 col-sm-4">
		                    <div class="tblmargin">
		                    	<div class="adv-reg-comp-sub-lbl">
		                                Inco Terms : <label class="adv-reg-comp-dtls-lbl no-margin">
		                                ${PO_DETAILS.incoType}
		                                </label>
		                         </div>
		                  	</div>
		              </div>
		              </c:if>
                         <c:if test="${PO_DETAILS.costCenterPer eq 0}">
                         <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    		<%-- <div class="tblmargin">
		                             <div class="adv-reg-comp-sub-lbl">
		                                Cost Center : <font color="#FF0000;">*</font>
		                                <input type="hidden" name="costingAccount" id="costingAccount"  value="${PO_DETAILS.costingAccount}">
		                                <img src="${pageContext.request.contextPath}/req-images/editSmall.png" class="margimg" data-toggle="modal" onclick="showCostingAccountModal();">
		                                <label class="adv-reg-comp-dtls-lbl no-margin" id="costingAccountDiv">
		                                		${PO_DETAILS.costingAccount}
		                                </label>
		                                <div class="adv-reg-popup-validation-lbl mb2 " style="display:none;" id="errorCostingCenter">
                           					Enter Costing Center
                        				</div> 
		                                
		                            </div> 
                            </div> --%>
                            <div class="tblmargin">
                            
                           <div class="adv-reg-comp-sub-lbl">
                                Cost Center : <label class="adv-reg-comp-dtls-lbl no-margin">${PO_DETAILS.costingAccount}</label>
                            </div>
                            
                            </div>
                         </div>
                         </c:if>
                        <%--   <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    		<div class="tblmargin">
		                    	<div class="adv-reg-comp-sub-lbl">
		                                Business Place :<span style="color:#FF0000;" class="mandatory_budget">*</span>
                                <select class="basic-reg-comp-dtls-txt" id="businessPlace" name="businessPlace" ">
			                          <option value="">Select</option>
			                              <c:forEach items="${BUSINESS_PLACE}" var="businessPlace">
			                               <option  value="${businessPlace.key}" <c:if test="${PO_DETAILS.businessPlace eq businessPlace.key}">selected="selected"</c:if>>${businessPlace.value}</option>
			                              </c:forEach>
                             	</select>
                             	<div class="row">
                               			<label class="adv-reg-popup-validation-lbl" id="errorBusinessPlace"></label>
                               </div>
		                            </div>
                            </div>
                         </div> --%>
                        <%--  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    		<div class="tblmargin">
		                    	<div class="adv-reg-comp-sub-lbl">
		                                Section Code :<span style="color:#FF0000;" class="mandatory_budget">*</span>
                                <select class="basic-reg-comp-dtls-txt" id="sectionCode" name="sectionCode" >
			                          <option value="">Select</option>
			                              <c:forEach items="${SECTION_CODE}" var="sectionCode">
			                               <option  value="${sectionCode.key}" <c:if test="${PO_DETAILS.sectionCode eq sectionCode.key}">selected="selected"</c:if>>${sectionCode.value}</option>
			                              </c:forEach>
                             	</select>
                             	<div class="row">
                               			<label class="adv-reg-popup-validation-lbl" id="errorSectionCode"></label>
                               </div>
		                            </div>
                            </div>
                         </div> --%>
                    </div>
                    
                <%-- <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 adv-reg-comp-dtls-heading-lbl subtitle1">Supplier Details</div>

                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                                Contact
                            </div>
                            <div class="adv-reg-comp-dtls-lbl addr-width">
                                 ${PO_DETAILS.mobile}
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                               GST No.
                            </div>
                            <div class="adv-reg-comp-dtls-lbl addr-width">
                               <c:if test="${empty PO_DETAILS.aadharNum}">NA</c:if>
                    		   <c:if test="${not empty PO_DETAILS.aadharNum}">${PO_DETAILS.aadharNum}</c:if>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                               <c:if test="${ReqCreatDetails.poTitle eq 'Capital PO'}">Asset Code</c:if><c:if test="${ReqCreatDetails.poTitle ne 'Capital PO'}">ERP Reference No:</c:if><c:if test="${ReqCreatDetails.poTitle eq 'Capital PO'}"><span style="color:#FF0000;" class="mandatory_budget">*</span></c:if>
                            </div>
                            <div class="adv-reg-comp-dtls-lbl addr-width">
                            <div class="row">
                               <input type="text"  id="tempErpReferenceNumId" class="adv-reg-popup-textbox"  maxlength="20" value="${PO_DETAILS.erpRefNum}">
                               </div>
                               <div class="row">
                               <label class="adv-reg-popup-validation-lbl" id="errorTempErpReferenceNumId"></label>
                               </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                                Payment Term
                            </div>
                            <div class="adv-reg-comp-dtls-lbl addr-width">
                                 ${PO_DETAILS.paymentTerm}
                            </div>
                        </div>
                    </div>

                </div> --%>


                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 no-padding">
                       <div class="col-lg-4 col-md-4 col-sm-4">
                       
                       
                          <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                                Billing Address<font color="#FF0000;">*</font> 
                                 <img src="${pageContext.request.contextPath}/req-images/editSmall.png" class="margimg" data-toggle="modal" onclick="showListBillingAddressModal();">
                            </div>
                        	<%-- <c:forEach items="${BILLING_ADDRESS}" var="addr" varStatus="loop">
	                        	<div class="adv-reg-comp-dtls-lbl">
                            		${addr.value}</div>
	                        	<input type="hidden" name="billingAddress" id="billingAddress" value="${addr.value}">
                    		</c:forEach> --%>
							 <input type="hidden" name="billingAddress" id="billingAddress" value="${PO_DETAILS.billingAddressId}">
							 
                            <div class="adv-reg-comp-dtls-lbl addr-width" id="billingAddressDiv">
                                
                               <c:if test="${not empty PO_DETAILS.billingAddress}">
                                	${PO_DETAILS.billingAddress}
                                </c:if>
                                
                            </div>
                            <div class="adv-reg-popup-validation-lbl mb2 " style="display:none;" id="billingAddressError">
                           Enter Billing address
                        </div> 
                        </div>
                        
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                                <label id="deliveryAdd" style="display:none;">Delivery Address</label>
                                 <label id="warehouseAdd" style="display:none;">Warehouse Address</label>
                                <font color="#FF0000;">*</font>
                                <img src="${pageContext.request.contextPath}/req-images/editSmall.png" class="margimg" data-toggle="modal" onclick="showListAddressModal();">
                            </div>
                           <%--  <c:if test="${empty PO_DETAILS.deliveryAddress}">
							<input type="hidden"  id="deliveryAddressId2" value=""/>
                            <div class="adv-reg-comp-dtls-lbl" id="deliveryAddressId3">
                            
                        	</div>
						</c:if> --%>
						
						
						 <div class="adv-reg-comp-dtls-lbl addr-width" id="deliveryAddressDiv">
                               <textarea class="popupTextArea1" rows="4" value="${PO_DETAILS.deliveryAddress}" name="deliveryAddress" id="deliveryAddress" maxlength="1000" <c:if test="${empty PO_DETAILS.deliveryAddress}">readonly="readonly"</c:if> >${PO_DETAILS.deliveryAddress}</textarea>
                            </div>
                            
                            <div class="adv-reg-popup-validation-lbl mb2 " style="display:none;" id="deliveryAddressError">
                           Enter Delivery address
                        </div>
                        </div>                        
                       
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4">
                        <div class="tblmargin">
                                <div class="adv-reg-comp-sub-lbl">

                                    Vendor Name/Address:<font color="#FF0000;">*</font>

                                   

                                <img src="${pageContext.request.contextPath}/req-images/editSmall.png" class="margimg" data-toggle="modal" onclick="showSupplierAddressModal();">
                                </div>

                                <div class="adv-reg-comp-dtls-lbl addr-width" id="supplierAddressDiv">
                                   ${PO_DETAILS.companyName}<br>
                                  ${PO_DETAILS.address}<br>
                                   ${PO_DETAILS.mobile}<br>
                                   ${PO_DETAILS.aadharNum}
                                   
                                   
                                   
                                </div>
                            </div>
                    </div>
                    </div>
                </div>
                
                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 no-padding">
                       <div class="col-lg-4 col-md-4 col-sm-4">
                       
                       
                          <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                                Project 
                            </div> 
                            <div class="adv-reg-comp-dtls-lbl addr-width" id="billingAddressDiv">
                                
                               <c:if test="${not empty PO_DETAILS.project}">
                                	${PO_DETAILS.projectName}
                                </c:if>
                                <c:if test="${empty PO_DETAILS.project}">
                                	NA
                                </c:if>
                             
                                
                            </div>
                        </div>
                        
                    </div>
                    
                    <c:if test="${CLIENT_NAME eq 'NCC'}">
                     <div class="col-lg-4 col-md-4 col-sm-4">
                          <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                                Purchase Center <font color="#FF0000;">*</font> 
                            </div> 
                            <div class="adv-reg-comp-dtls-lbl addr-width" id="billingAddressDiv">
                                <select class="basic-reg-comp-dtls-txt" id="purchase_center" name="purchaseCenterId" >
                                <option value="">Select</option>
									<c:forEach items="${PURCHASE_CENTER}" var="center">
										<c:if test="${PO_DETAILS.purchaseCenterId eq center.key}">
							 	 			<option value="${center.key}" selected="selected">${center.value}</option>
							 	 		</c:if>
							 	 		<c:if test="${PO_DETAILS.purchaseCenterId ne center.key}">
								 	 		<c:if test="${'1' eq center.key}">
								 	 		<option value="${center.key}" selected="selected">${center.value}</option>
								 	 		</c:if>
							 	 		<c:if test="${'1' ne center.key}">
							 	 			<option value="${center.key}"  >${center.value}</option>
							 	 		</c:if>
							 	 		</c:if>  
							 	 		
									</c:forEach>
                                </select>
 								<label class="adv-reg-popup-validation-lbl" id="purchase_center_error"></label>                                
                            </div>
                        </div>
                        
                    </div>
                    <div>
                    	<div class="col-lg-4 col-md-4 col-sm-4">
                       
                       <%--Only For NCC --%>
                          <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                                Price Escalation 
                                <div>
                                	<%-- <input type="radio" name="priceEscalation" value="1"  <c:if test="${PO_DETAILS.priceEscalation eq 1 || empty PO_DETAILS}">checked="checked" </c:if>> &nbsp;Yes
 						<input type="radio" name="priceEscalation" value="0"  <c:if test="${PO_DETAILS.priceEscalation eq 0 }">checked="checked" </c:if>> &nbsp;No
                      --%>
                      <input type="radio" name="priceEscalation" value="1"  <c:if test="${PO_DETAILS.priceEscalation eq 1 }">checked="checked" </c:if>> &nbsp;Yes
 						<input type="radio" name="priceEscalation" value="0"  <c:if test="${PO_DETAILS.priceEscalation eq 0 || empty PO_DETAILS.priceEscalation}">checked="checked" </c:if>>&nbsp;No
                     
                                </div>
                            </div> 
                            
                        </div>
                        
                    </div>
                    </div>
                    <div>
                    	<div class="col-lg-6 col-md-6 col-sm-6">
                       
                       
                          <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                                Inspection 
                                <div>
                                	<%-- <input type="radio" name="priceEscalation" value="1"  <c:if test="${PO_DETAILS.priceEscalation eq 1 || empty PO_DETAILS}">checked="checked" </c:if>> &nbsp;Yes
 						<input type="radio" name="priceEscalation" value="0"  <c:if test="${PO_DETAILS.priceEscalation eq 0 }">checked="checked" </c:if>> &nbsp;No
                      --%>
                      <input type="radio" name="inspection" value="1"  <c:if test="${PO_DETAILS.inspection eq 1 }">checked="checked" </c:if>> &nbsp;Yes
 						<input type="radio" name="inspection" value="0"  <c:if test="${PO_DETAILS.inspection eq 0 || empty PO_DETAILS.inspection}">checked="checked" </c:if>>&nbsp;No
                     
                                </div>
                            </div> 
                            
                        </div>
                        
                    </div>
                    </div>
                    </c:if>
                   
                <c:if test="${PO_DETAILS.parentCompanyId ne PO_DETAILS.companyId}">     
                    <div class="col-lg-4 col-md-4 col-sm-4">
                          <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                                <!-- Parent Company -->Primary Vendor <font color="#FF0000;">*</font> 
                            </div> 
                            <div class="adv-reg-comp-dtls-lbl addr-width">
                                   ${PO_DETAILS.parentCompanyName}<br>
                                   ${PO_DETAILS.parentAddress}<br>
                                   ${PO_DETAILS.parentMobile}<br>
                                   ${PO_DETAILS.parentAadharNum}
                            </div>
                        </div>
                        
                    </div>
                </c:if>    
                    </div>
                </div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 no-padding">
							<div class="col-lg-4 col-md-4 col-sm-4">
								<div class="tblmargin">
									<div class="adv-reg-comp-sub-lbl">Validity Date</div>
									<div>
										<c:if test="${not empty PO_DETAILS.validityDate}">${PO_DETAILS.validityDate }</c:if>
										<c:if test="${ empty PO_DETAILS.validityDate}">NA</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
					<input type="hidden" name="serviceItems" id="serviceItems" class="serviceItems"    value="${PURCHASE_ITEMS[0].serviceItems}"/>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 setback table-align">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 no-padding list-table-label purchase-table-header">List of Items</div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
                        <div class="col-lg-1 col-md-0 col-sm-1 col-xs-1"></div>
                        <div class="col-lg-1 col-md-0 col-sm-1 col-xs-1"></div>

                    </div>
                     <c:set var="expiryDate" value="false"></c:set>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                    <c:if test="${not empty PURCHASE_ITEMS && PURCHASE_ITEMS ne null  && PURCHASE_ITEMS[0].serviceItems eq false}"> 
                        <table class="table mainTableAlign1 ">
                            <thead>
                                <tr class="adv-reg-comp-sub-lbl ">
                                    <!-- <th>PO Item ID</th> -->
                                    <th class="th-purchase-1 adv-reg-comp-sub-lbl" style="width:250px;">Items/Services Description</th>
                                    <c:if test="${not empty PO_DETAILS.reqId}">
                                     <c:if test="${PO_DETAILS.reqPoType eq '1'}">
                                    <th class="thr-purchase-3 adv-reg-comp-sub-lbl"> Auc Code</th>
                                    </c:if>
                                    <c:if test="${PO_DETAILS.costCenterPer eq 1}">
                                    <th class="thr-purchase-5 adv-reg-comp-sub-lbl "> Costing Center</th>
                                    </c:if>
                                    <!-- <th class="thr-purchase-3 adv-reg-comp-sub-lbl ">Code</th> -->
                                    </c:if>
                                    <th class="thr-purchase-3 adv-reg-comp-sub-lbl ">Code</th>
                                    <th class="thr-purchase-3 adv-reg-comp-sub-lbl ">Price per</th>
                                    <th class="thr-purchase-5 adv-reg-comp-sub-lbl ">Quantity/Period
                                    
                               <c:if test="${AMEND_PO eq true}">	
                                    
                                    <a href="javascript:void(0);" onClick="openQuantityModal();" title="Edit Quantity" >
                                    		<img src="${pageContext.request.contextPath}/catalog-images/editSmall.png" style="height: 16px;"> 
                                    </a>
                                   </c:if> 
                                    </th>
                                    <th class="thr-purchase-4 adv-reg-comp-sub-lbl ">Price</th>
                                    <th class="thr5-status-log adv-reg-comp-sub-lbl">Per Unit</th>
                                    <th class="thr-purchase-6 adv-reg-comp-sub-lbl ">Total Price</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:set var="totalquantity" value="${0}"/>
                            	<c:forEach items="${PURCHASE_ITEMS}" var="item" varStatus="loop">
                                <tr class="adv-reg-comp-dtls-lbl firstRow " id="main_item_${item.reqItemId}">
                                   <%-- <td class="tdr-purchase-1 breakword ">
                                   <c:if test="${SOURCING_CONFIG.securityCodeIntegration ne true}">
                                	${item.reqItemId} 
                                	</c:if>
                                	<c:if test="${SOURCING_CONFIG.securityCodeIntegration eq true}">
                                	${item.poItemIndex} 
                                	</c:if>
                                   </td> --%>
                                   
                                    <td class="tdr-purchase-1 breakword ">                                   
                                    <c:if test="${PO_DETAILS.poFromType eq 2}">	                                   
	                                    <c:if test="${PO_DETAILS.directRequisition eq false}">
	                                    	<a href="#" onClick="getItemCatalogModal('${item.reqItemId}');">
	                                    	<div class="itemDescriptionContainer">	
	                                    	<c:choose>
															<c:when test="${fn:length(item.itemDescription) <= 100}">
																<span class="truncated-txt" style="text-align: justify;">${item.itemDescription}</span></a>

															</c:when>
															<c:otherwise>
																<span class="truncated-txt" style="text-align: justify;">${item.itemDescription.substring(0,100)}</span>
																<div class="full-txt" style="max-height:200px;overflow:auto;display: none;">${item.itemDescription}</div></a>
																<span class="moree-read" style="cursor: pointer;color: #337ab7;">...more</span>
														    </c:otherwise>
														</c:choose>
														</div>
	                                    </c:if>
                                    </c:if>
                                    <c:if test="${PO_DETAILS.poFromType eq 0}">
	                                    <c:if test="${PO_DETAILS.directRequisition eq true}">
	                                    	<a href="#" onClick="getItemCatalogModal('${item.reqItemId}');">
	                                    	<div class="itemDescriptionContainer">	
	                                    	<c:choose>
															<c:when test="${fn:length(item.itemDescription) <= 100}">
																<span class="truncated-txt" style="text-align: justify;">${item.itemDescription}</span></a>

															</c:when>
															<c:otherwise>
																<span class="truncated-txt" style="text-align: justify;">${item.itemDescription.substring(0,100)}</span>
																<div class="full-txt" style="max-height:200px;overflow:auto;display: none;">${item.itemDescription}</div></a>
																<span class="moree-read" style="cursor: pointer;color: #337ab7;" >...more</span>
														    </c:otherwise>
														</c:choose>
														</div>

	                                    </c:if>
	                                    <c:if test="${PO_DETAILS.directRequisition eq false}">
	                                    	<a href="#" onClick="getItemCatalogModal('${item.reqItemId}');">
	                                    	<div class="itemDescriptionContainer">	
	                                    	<c:choose>
															<c:when test="${fn:length(item.itemDescription) <= 100}">
																<span class="truncated-txt" style="text-align: justify;">${item.itemDescription}</span></a>

															</c:when>
															<c:otherwise>
																<span class="truncated-txt" style="text-align: justify;">${item.itemDescription.substring(0,100)}</span>
																<div class="full-txt" style="max-height:200px;overflow:auto;display: none;">${item.itemDescription}</div></a>
																<span class="moree-read" style="cursor: pointer;color: #337ab7;" >...more</span>
														    </c:otherwise>
														</c:choose>
														</div>
	                                    </c:if>
                                    </c:if>
                                    <c:if test="${PO_DETAILS.poFromType eq 1}">
                                    	    <a href="#" onClick="getItemCatalogModal('${item.reqItemId}');">
                                    	    <div class="itemDescriptionContainer">	
                                    	    <c:choose>
															<c:when test="${fn:length(item.itemDescription) <= 100}">
																<span class="truncated-txt" style="text-align: justify;">${item.itemDescription}</span></a>

															</c:when>
															<c:otherwise>
																<span class="truncated-txt" style="text-align: justify;">${item.itemDescription.substring(0,100)}</span>
																<div class="full-txt" style="max-height:200px;overflow:auto;display: none;">${item.itemDescription}</div></a>
																<span class="moree-read" style="cursor: pointer;color: #337ab7;">...more</span>
														    </c:otherwise>
														</c:choose>
														</div>
                                    </c:if>
                                    </td>
                                   <%--  <td class="tdr-purchase-2 breakword ">${item.itemDescription}</td> --%>
                                    <c:if test="${not empty PO_DETAILS.reqId}">
                                     <c:if test="${PO_DETAILS.reqPoType eq '1'}">
                                    <td class="tdr-purchase-3 breakword" >
                                    	<input value="${item.aucCode}" class="auc-code" type="hidden"/>
                                    	${item.aucCode}   
	                                    <a href="#" onClick="getEditItemAucCodes('${item.reqItemId}');">
	                                    	<img class="AddItemButton" src="req-images/editSmall.png">
	                                    </a>
                                    </td>
                                    </c:if>
                                    <c:if test="${PO_DETAILS.costCenterPer eq 1}">
                                    <td class="tdr-purchase-5 breakword ">${item.costingAccount}</td>
                                    </c:if>
                                    </c:if>
                                    <td class="tdr-purchase-3 breakword ">${item.itemCode}</td>
                                    <td class="tdr-purchase-3 breakword">
	                                    <c:if test="${item.pricePer eq 1}">Per Unit</c:if>
	                                    <c:if test="${item.pricePer eq 0 or item.pricePer eq 2}">Total Unit</c:if>
                                    </td>
                                    <td class="tdr-purchase-5 ">
                                    	<c:if test="${item.pricePer eq 1}"><span id="itmQuan_${loop.count}">
                                    	<fmt:formatNumber type = "number" 
        							minIntegerDigits="1"  pattern = "####.######" value = "${item.itemQuantity}" />
                                    	<%-- ${item.itemQuantity} --%></span> 
                                    	
                                    	${item.unitName}</c:if>
	                                    <c:if test="${item.pricePer eq 0 or item.pricePer eq 2}">NA</c:if>
                                    </td>
                                    <td>${PO_DETAILS.currencyName} 
										    <c:choose>
												<c:when test="${PO_DETAILS.currencyName eq 'INR.' || PO_DETAILS.currencyName eq 'INR'}">
													${item.displayItemPrice}
												</c:when>
												<c:otherwise>
													<fmt:formatNumber value="${item.itemPrice}" type="currency" currencySymbol="" />
												</c:otherwise>
											</c:choose>
									</td>
                                    <td>${item.uomQty}</td>
                                    <td class="">${PO_DETAILS.currencyName} 
                                    <input type="hidden" id="unitPrice_${loop.count}" value="${item.itemPrice}">
                                    <span id="finalCost_${loop.count}"><%-- ${item.finalItemcost} --%>
										<c:choose>
											<c:when test="${PO_DETAILS.currencyName eq 'INR.' || PO_DETAILS.currencyName eq 'INR'}">
												${item.displayFinalItemcost}
											</c:when>
											<c:otherwise>
												<fmt:formatNumber value="${item.finalItemcost}" type="currency" currencySymbol="" />
											</c:otherwise>
										</c:choose>
									
									</span>
                                    
                                    	
                                    	<a href="javascript:void(0);" onClick="getTaxStructureModal('${item.reqItemId}');" title="Price Breakup" >
                                    		<img src="${pageContext.request.contextPath}/catalog-images/help-img.png" style="height: 16px;"> 
                                    	</a>
                                    	<c:if test="${PO_DETAILS.reqPoType eq '4'}">
                                    	<a href="javascript:void(0);" onClick="getLineItems('${item.reqItemId}');" title="Schedule Lines" >
                                    		<img src="grn-images/raise-grn.png" style="height: 16px;"> 
                                    	</a>
                                    	</c:if>
                                    	<a href="javascript:void(0);" onClick="getPriceHistory('${item.reqItemId}');" title="Price History" >
                                    		<img src="${pageContext.request.contextPath}/images/po.png" style="height: 16px;"> 
                                    	</a>
                                    	
                                    	<c:set value="${item.subTotal}" var="total"></c:set>
                                    	<c:set var="totalquantity" value="${totalquantity + item.itemQuantity}" />
                                    
                                    <c:if test="${PO_DETAILS.reqPoType eq '3'}">
                                    <input type="hidden" id="${item.subCategoryId}" value="${item.subCategoryName}">
                                     <input type="hidden" id="${item.l3CategoryId}" value="${item.l3CategoryName}">
                                    	&nbsp; &nbsp; <a href="javascript:void(0);" onClick="getServiceItems('${item.reqItemId}','${item.categoryId}','${item.subCategoryId}','${item.l3CategoryId}');" title="Add Services" >
                                    		<img src="contract-images/plusSmall.png" class="plus-align add-contract-milestone-deliverable plus-padding del-img-margin">
                                    	</a>
                                    </c:if>	
                                    </td>
                                    
                                    <c:if test="${item.expStatus eq true || item.catalogExpStatus eq 6}">
                                    				<c:set var="expiryDate" value="true"></c:set>
                                    				</c:if>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                       </c:if> 
                       
                       
                       <c:if test="${not empty PURCHASE_ITEMS && PURCHASE_ITEMS ne null && (PURCHASE_ITEMS[0].serviceItems eq true)}"> 
                        <table class="table table-sm items-table" >
                                <tr class="main-header">
                                    <td >Items/Services Name</td>
                                    <c:if test="${not empty PO_DETAILS.reqId}">
                                     <c:if test="${PO_DETAILS.reqPoType eq '1'}">
                                    <td > Auc Code</td>
                                    </c:if>
                                    <c:if test="${PO_DETAILS.costCenterPer eq 1}">
                                    <td > Costing Center</td>
                                    </c:if>
                                    </c:if>
                                    <td >Code</td>
                                    <td >Price per</td>
                                    <td >Quantity/Period</td>
                                    <td >Price</th>
                                    <td >Total Price</td>
                                </tr>
                            <tbody>
                            	<c:set var="totalquantity" value="${0}"/>
                            	<c:forEach items="${PURCHASE_ITEMS}" var="item" varStatus="loop">
                                <%-- <tr class="adv-reg-comp-dtls-lbl firstRow " id="main_item_${item.reqItemId}"> --%>
                                 <tr class="main-content" id="main_item_${item.reqItemId}">
                                    <td class="">                                   
                                    <c:if test="${PO_DETAILS.poFromType eq 2}">	                                   
	                                    <c:if test="${PO_DETAILS.directRequisition eq false}">
	                                    	<a href="#" onClick="getItemCatalogModal('${item.reqItemId}');">${item.itemName}</a>
	                                    </c:if>
                                    </c:if>
                                    <c:if test="${PO_DETAILS.poFromType eq 0}">
	                                    <c:if test="${PO_DETAILS.directRequisition eq true}">
	                                    	<a href="#" onClick="getItemCatalogModal('${item.reqItemId}');">${item.itemName}</a>
	                                    </c:if>
	                                    <c:if test="${PO_DETAILS.directRequisition eq false}">
	                                    	<a href="#" onClick="getItemCatalogModal('${item.reqItemId}');">${item.itemName}</a>
	                                    </c:if>
                                    </c:if>
                                    <c:if test="${PO_DETAILS.poFromType eq 1}">
                                    	    <a href="#" onClick="getItemCatalogModal('${item.reqItemId}');">${item.itemName}</a>
                                    </c:if>
                                    </td>
                                    <c:if test="${not empty PO_DETAILS.reqId}">
                                     <c:if test="${PO_DETAILS.reqPoType eq '1'}">
                                    <td class="" >
                                    	<input value="${item.aucCode}" class="auc-code" type="hidden"/>
                                    	${item.aucCode}   
	                                    <a href="#" onClick="getEditItemAucCodes('${item.reqItemId}');">
	                                    	<img class="AddItemButton" src="req-images/editSmall.png">
	                                    </a>
                                    </td>
                                    </c:if>
                                    <c:if test="${PO_DETAILS.costCenterPer eq 1}">
                                    <td class="">${item.costingAccount}</td>
                                    </c:if>
                                    </c:if>
                                    <td class="">${item.itemCode}</td>
                                    <td class="">
	                                    <c:if test="${item.pricePer eq 1}">Per Unit</c:if>
	                                    <c:if test="${item.pricePer eq 0 or item.pricePer eq 2}">Total Unit</c:if>
                                    </td>
                                    <td class="">
                                    	<c:if test="${item.pricePer eq 1}">${item.itemQuantity} ${item.unitName}</c:if>
	                                    <c:if test="${item.pricePer eq 0 or item.pricePer eq 2}">NA</c:if>
                                    </td>
                                     <td>${PO_DETAILS.currencyName} 
										<c:choose>
											<c:when test="${PO_DETAILS.currencyName eq 'INR.' || PO_DETAILS.currencyName eq 'INR'}">
												${item.displayItemPrice}
										    </c:when>
											<c:otherwise>
												<fmt:formatNumber value="${item.itemPrice}" type="currency" currencySymbol="" />
											</c:otherwise>
										</c:choose>
									 </td>
                                    <td class="">${PO_DETAILS.currencyName}
										<c:choose>
											<c:when test="${PO_DETAILS.currencyName eq 'INR.' || PO_DETAILS.currencyName eq 'INR'}">
												${item.displayFinalItemcost}
											</c:when>
											<c:otherwise>
												<fmt:formatNumber value="${item.finalItemcost}" type="currency" currencySymbol="" />
											</c:otherwise>
										</c:choose>
                                    	<a href="javascript:void(0);" onClick="getTaxStructureModal('${item.reqItemId}');" title="Price Breakup" >
                                    		<img src="${pageContext.request.contextPath}/catalog-images/editSmall.png" style="height: 16px;"> 
                                    	</a>
                                    	<c:set value="${item.subTotal}" var="total"></c:set>
                                    	<c:set var="totalquantity" value="${totalquantity + item.itemQuantity}" />
                                    
                                    <c:if test="${PO_DETAILS.reqPoType eq '3'}">	
                                    <input type="hidden" id="${item.subCategoryId}" value="${item.subCategoryName}">
                                     <input type="hidden" id="${item.l3CategoryId}" value="${item.l3CategoryName}">
                                    	&nbsp; &nbsp; <a href="javascript:void(0);" onClick="getServiceItems('${item.reqItemId}','${item.categoryId}','${item.subCategoryId}','${item.l3CategoryId}');" title="Add Services" >
                                    		<img src="contract-images/plusSmall.png" class="plus-align add-contract-milestone-deliverable plus-padding del-img-margin">
                                    	</a>
                                  </c:if>	
                                    </td>
                                    
                                    <c:if test="${item.expStatus eq true || item.catalogExpStatus eq 6}">
                                    				<c:set var="expiryDate" value="true"></c:set>
                                    				</c:if>
                                    				
                                </tr>
                                
                                <input type="hidden" name="itemPrice"  class="main-itemPrice"    value="${item.reqItemId}"/>
                            	<input type="hidden" id="${item.reqItemId}"    value="${item.itemPrice}"/> <!-- main item unit price -->
                                <c:forEach var="bom" items="${item.service}" varStatus="inloop" >
                                <input type="hidden" name="itemPrice"  class="main-itemPrice-${item.reqItemId}"    value="${bom.price}"/>
                                <tr >
                                    <td >${bom.serviceDescription}</td>
                                     <c:if test="${not empty PO_DETAILS.reqId}">
                                     <c:if test="${PO_DETAILS.reqPoType eq '1'}">
                                    <td >&nbsp;</td>
                                    </c:if>
                                    <c:if test="${PO_DETAILS.costCenterPer eq 1}">
                                    <td > &nbsp;</td>
                                    </c:if>
                                    </c:if>
                                    <td >${bom.serviceCode}</td>
                                    <td >Per Unit</td>
                                    <td >${bom.serviceQuantity}&nbsp;${bom.itemUoms}
                                	<td >${PO_DETAILS.currencyName} ${bom.price}</td>
                                    <input type="hidden" calss="serviceItemPrice1" value="${bom.price}"></td>
                                    <td >${PO_DETAILS.currencyName} ${bom.totalPrice} &nbsp;&nbsp;<img src="images/deleteSmall.png" class="del-img-margin"
                                    onclick="removetServiceItem('${bom.serviceDtlsId}','${PO_DETAILS.purchaseOrderId}')" alt="Add"></td>
                                </tr>
                               </c:forEach> 
                               
                               
                                </c:forEach>
                            </tbody>
                        </table>
                       </c:if> 
                      <c:if test="${not empty PURCHASE_ITEMS && PURCHASE_ITEMS ne null && (PURCHASE_ITEMS[0].serviceItems eq true)}">   
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                        	</div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                        		<label class="adv-reg-comp-dtls-lbl purchase-detailpage-amountlabel-align amount-align">${PO_DETAILS.currencyName} ${PURCHASE_ITEMS[0].serviceItesTotal}</label>
                            	<label class="adv-reg-comp-sub-lbl  purchase-detailpage-amountlabel-align amount-title-align">Total Service Items Price:</label>
                        	</div>
                        </div>
                        </c:if>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                        		<label class="adv-reg-comp-dtls-lbl purchase-detailpage-amountlabel-align amount-align">${PO_DETAILS.currencyName} 
									<c:choose>
										<c:when test="${PO_DETAILS.currencyName eq 'INR.' || PO_DETAILS.currencyName eq 'INR'}">
											${PO_DETAILS.displayActualPoTotal}
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${PO_DETAILS.displayActualPoPrice}" type="currency" currencySymbol="" />
										</c:otherwise>
									</c:choose> 
									
									
									<%-- ${PO_DETAILS.displayActualPoPrice} --%></label>
                            
                            <c:if test="${SOURCING_CONFIG.securityCodeIntegration ne true}">
                            <label class="adv-reg-comp-sub-lbl  purchase-detailpage-amountlabel-align amount-title-align">Award Value:</label>
                            </c:if>
                            
                            <c:if test="${SOURCING_CONFIG.securityCodeIntegration eq true}">
                            <label class="adv-reg-comp-sub-lbl  purchase-detailpage-amountlabel-align amount-title-align">Gross Amount:</label>
                            </c:if>
                            
                        	</div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                        		<label class="adv-reg-comp-dtls-lbl purchase-detailpage-amountlabel-align amount-align">${PO_DETAILS.currencyName}
									<c:choose>
										<c:when test="${PO_DETAILS.currencyName eq 'INR.' || PO_DETAILS.currencyName eq 'INR'}">
											${PO_DETAILS.dispayPoTotalAmount}
										</c:when>
										<c:otherwise>
											
											<fmt:formatNumber value="${PO_DETAILS.subTotal}" type="currency" currencySymbol="" />
										</c:otherwise>
									</c:choose>
									 
								</label>
                            	<label class="adv-reg-comp-sub-lbl  purchase-detailpage-amountlabel-align amount-title-align">Total PO Price:</label>
                        	</div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label class="adv-reg-comp-dtls-lbl purchase-detailpage-amountlabel-align amount-title-align"><strong>${PO_DETAILS.subTotalInWord}</strong></label>
                        <label class="adv-reg-popup-validation-lbl" id="main_itemPrice_error_0"></label>
                        </div>
                        <c:set var = "conversion" scope = "session" value = "true"/>
                        <c:if test="${PO_DETAILS.currency ne PO_DETAILS.defaultCurrency}"> 
						    <c:if test="${PO_DETAILS.conversionRate.unscaledValue() != 0}">
						    	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                        	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
		                        		<label class="adv-reg-comp-dtls-lbl purchase-detailpage-amountlabel-align amount-align">${PO_DETAILS.defaultCurrencyName} <fmt:formatNumber type = "number" minFractionDigits="4" value ="${PO_DETAILS.conversionRate}"/></label>
		                            <label class="adv-reg-comp-sub-lbl  purchase-detailpage-amountlabel-align amount-title-align">Conversion Rate:</label>
		                        	</div>
		                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
		                        		<label class="adv-reg-comp-dtls-lbl purchase-detailpage-amountlabel-align amount-align">${PO_DETAILS.defaultCurrencyName} 
		                        		<c:choose>
												<c:when test="${PO_DETAILS.currencyName eq 'INR.' || PO_DETAILS.currencyName eq 'INR'}">
													${PO_DETAILS.finalConvertedPoPrice}
												</c:when>
												<c:otherwise>
													
												<fmt:formatNumber type = "number" minFractionDigits="4" value = "${PO_DETAILS.convertedPoPrice}" />	
												</c:otherwise>
									        </c:choose> 
									        </label>
		                            	<label class="adv-reg-comp-sub-lbl  purchase-detailpage-amountlabel-align amount-title-align">Converted Po Amount:</label>
		                        	</div>
                        		</div>
						    	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            		<label class="adv-reg-comp-dtls-lbl purchase-detailpage-amountlabel-align amount-align">${PO_DETAILS.convertedPoPriceInWords}</label>
                        		</div>
						    </c:if>
						    <c:if test="${PO_DETAILS.conversionRate.unscaledValue() == 0}">
						    <c:set var = "conversion" scope = "session" value = "false"/>
						    	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            		<label class="adv-reg-comp-dtls-lbl purchase-detailpage-amountlabel-align amount-align">conversion rate from ${PO_DETAILS.currencyName}  to ${PO_DETAILS.defaultCurrencyName} for selected date does not exit.</label>
                        		</div>
						   
						    </c:if>
						    
						    </c:if>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        	<div class="row">
                               <label class="adv-reg-popup-validation-lbl purchase-detailpage-amountlabel-align amount-align" id="errorMaxPoIncrement"></label>
                               </div>
                        <input type="hidden" id="actual_price" value="${PO_DETAILS.actualPoPrice}">
                        <input type="hidden" id="max_ppo_inc_per value="${PO_DETAILS.maxPerIncPo}">
                        <input type="hidden" id="max_po_inc_amount" value="${PO_DETAILS.maxAmountIncPo}">
                        <c:set var="perIncAmount" value="${PO_DETAILS.maxPerIncPo/100*PO_DETAILS.actualPoPrice}" />
                        <c:set var="diffPoPrice" value="${PO_DETAILS.subTotalInFigure - PO_DETAILS.actualPoPrice}" />
                        <c:if test="${perIncAmount ge PO_DETAILS.maxAmountIncPo}">
                        	<input type="hidden" id="inc_amount" value="${PO_DETAILS.maxAmountIncPo}">
                        </c:if>
                        <c:if test="${perIncAmount lt PO_DETAILS.maxAmountIncPo}">
                        	<input type="hidden" id="inc_amount" value="${perIncAmount}">
                        </c:if>
                        <input type="hidden" id="diff_po_price" value="${diffPoPrice}">
                        </div>
                        <!-- <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label class="adv-reg-comp-dtls-lbl purchase-detailpage-amountlabel-align amount-align">$ 12,210.00</label>
                            <label class="adv-reg-comp-sub-lbl  purchase-detailpage-amountlabel-align amount-title-align">Shipping:</label>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <label class="adv-reg-comp-dtls-lbl purchase-detailpage-amountlabel-align amount-align">$ 10,210.00</label>
                            <label class="adv-reg-comp-sub-lbl  purchase-detailpage-amountlabel-align amount-title-align">Other:</label>
                        </div>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 label-margin">
                            <label class="adv-reg-comp-dtls-heading-lbl purchase-detailpage-amountlabel-align final-amount-align">$ 75,840.00</label>
                            <label class="adv-reg-comp-sub-lbl  purchase-detailpage-amountlabel-align po-price-title-align">Total PO Price:</label>
                        </div> -->
                    </div>
                </div>
                
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 setback setmarg ">                  
                 	<div  class="adv-reg-popup-validation-lbl pull-right">
                 		<label class="adv-reg-popup-validation-lbl pull-right" id="cost_auc_err"></label>
                	</div>
                </div>
                
		            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 table-align">
		                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 no-padding list-table-label purchase-table-header">Delivery Schedule Details</div>
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
                        <div class="col-lg-1 col-md-0 col-sm-1 col-xs-1"></div>
                        <div class="col-lg-1 col-md-0 col-sm-1 col-xs-1"></div>

                    	</div>
		                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 table-responsive x-auto table-no-padding" style="overflow-y: hidden;overflow-x: auto;position: static;z-index: 10;">
		                    <table class="table mainTableAlign1 deliveryTable " id="deliveryScheduleTableID">
		                        <thead>
		                            <tr class="adv-reg-comp-sub-lbl ">
		                                <th class="adv-reg-comp-sub-lbl no-word-break "> Item Name</th>
		                                <th class="adv-reg-comp-sub-lbl no-word-break "> Required Date</th>
		                                <th class="adv-reg-comp-sub-lbl no-word-break  text-center">Quantity</th>
		                                <th class="adv-reg-comp-sub-lbl no-word-break  text-center">Delivery Details</th>
		                                <c:if test="${CLIENT_NAME eq 'NCC'}">
		                                <th class="adv-reg-comp-sub-lbl no-word-break "> Warehouse</th>
		                                </c:if>
		                                <th class="adv-reg-comp-sub-lbl no-word-break  text-center">Action</th>
		                            </tr>
		                        </thead>
		                        <tbody >
		                           
		                            <tr class="adv-reg-comp-dtls-lbl firstRow delivery_schedule" count="0">
		                            	<input type="hidden" name="deliveryScheduleId" id="deliveryScheduleId_0" value="">
		                                <input type="hidden" name="poItemId" id="poItemId_0" value="">
		                                
		                                <td class=" no-word-break" style="width: 140px;">
		                                
		                                    <select class="basic-reg-comp-dtls-txt tbl-responsive-dropdown choosenBox itemName" onchange="changeItemName(this);" id="itemName_0" name="deliveryItemId">
		                                    	<!-- <option value="">Select</option>  -->
		                                    	
		                                    </select>
		                                  
                                    	</td>

		                                <td class=" no-word-break text-center" style="width: 140px;">
		                                    <input id="deliverydate_0" name="deliveryDate" autocomplete="off"  class="datetimepicker basic-reg-comp-dtls-txt deliverydate" placeholder="Select Date">
		                                </td>
		                                <td class=" no-word-break text-center"  style="width: 100px;">
		                                    <input type="text" maxlength="8"  class="adv-reg-popup-textbox1 tbl-responsive-quantity quantity" id="quantity_0" name="deliveryQty"> <!--  -->
		                                </td>
		                                <td class=" no-word-break  text-center">
		                                    <input type="text" class="adv-reg-popup-textbox1 tbl-responsive-quantity deliverydetails" id="deliverydetails_0" name="deliveryDesc">
		                                </td>
		                              <c:if test="${CLIENT_NAME eq 'NCC'}">   
		                                <td class=" no-word-break" style="width: 180px;">
		                                
		                                    <select class="basic-reg-comp-dtls-txt tbl-responsive-dropdown choosenBox poItemId"   id="project_address_0" name="deliveryWarehouse">
		                                    	<!-- <option value="">Select</option>  -->
		                                    	
		                                    </select>
		                                  
                                    	</td>
                                    	</c:if>
		                                
		                                <td class=" no-word-break  ">
		                                    <!-- <img src="images/deleteSmall.png" class="del-img-margin" onclick="removetblrow(this)" alt="Add"> -->
		                                   
		                                    <img src="contract-images/plusSmall.png" class="plus-align add-contract-milestone-deliverable plus-padding add-line-item-row del-img-margin"><!--onclick="addLineItem('${item.itemName}');"  -->
		                                </td>
		                                
		                            </tr>
								
		                        </tbody>
		                    </table>
		                </div>
		                <div class="col-lg-12 col-md-12 col-sm-12 lastinputField" >
		                    <p style="color:red; display:none;" id="item_name_error">Please Select Item</p>
		                    <p style="color:red; display:none;" id="delivery_date_error">Please Enter Delivery Date</p>
		                    <p style="color:red; display:none;" id="delivery_dateformat_error">Please Enter Delivery Date in dd-mm-yyyy format</p>
                    		<p style="color:red; display:none;" id="qty_error">Please Enter Quantity</p>
                    		<p style="color:red; display:none;" id="qty_error_no">Please Enter valid Quantity</p>
		                    <p style="color:red; display:none;" id="delivery_description_error">Please Enter Delivery Details</p>
		                    <p style="color:red; display:none;" id="quantity_exceed_error"></p>
		                    <p style="color:red; display:none;" id="quantity_exceed_error1"></p>
		                    <p style="color:red; display:none;" id="quantity_exceed_error2"></p>
		                    <p style="color:red; display:none;" id="date_exceed_error"></p>
		                    <p style="color:red; display:none;" id="qty_error1">Zero Quantity is not allowed</p>
							<p style="color:red; display:none;" id="warehouse_error">Please Select Warehouse</p>
							<p style="color:red; display:none;" id="qty_error_for_date_address"></p>
		                </div>
		            </div>
		        

                   <input type="hidden" id="scheduleQuantity" value="${scheduleQuantity}">
                   <hr class="reg-comp-hr">
                 
            			<input type="hidden" name="deliveryAddressId" id="deliveryAddress_Id" value="${PO_DETAILS.deliveryAddressId}">
            			
            			
						<input type="hidden" id="total_qtyId" value="${totalquantity}">
						<input type="hidden" id="advancePercent" name="advancePercent" value="${PO_DETAILS.advancePercent}">
						<input type="hidden" id="server" name="server" value="${PO_DETAILS.server}">
						<input type="hidden" id="companyId" name="companyId" value="${PO_DETAILS.companyId}">
						<input type="hidden" id="PurchaseOrderIds" name="PurchaseOrderId" value="${PO_DETAILS.purchaseOrderId}">
						<input type="hidden" id="reqIds" name="reqId" value="${PO_DETAILS.reqId}">
						<%-- <input type="hidden" name="deliveryAddress" id="deliveryAddressId" value="${PO_DETAILS.deliveryAddress}">
						<input type="hidden" name="billingAddress" id="billingAddressId" value="${PO_DETAILS.billingAddressId}"> --%>
						<input type="hidden" name="supplierAddressId" id="supplierAddressId" value="${PO_DETAILS.supplierAddressId}">
						<input type="hidden" name="supplierState" id="supplierAddressStateId" value="${PO_DETAILS.supplierState}">
						<input type="hidden" name="poDeliveryDocRequire" id="poDeliveryDocRequireId" value="0">
						<input type="hidden" name="poTermDocRequire" id="poTermDocRequireId" value="0">
						<input type="hidden" name="purchaseDocRequire" id="purchaseDocRequireId" value="0">
						<input type="hidden" name="purchaseSubmitStatus" id="purchaseSubmitStatusId" value="">
						<input type="hidden" name="submissionComments" id="submissionComments" value="">
						<%-- <input type="hidden" name="erpReferenceNum" id="erpReferenceNumIdds" value="${PO_DETAILS.erpRefNum}"> --%>
						<input type="hidden" id="delQtyId" value="${fn:length(PO_DETAILS.listOfDelSch)}">
						<input type="hidden" name="poSubTotal" id="total_Id" value="${PO_DETAILS.subTotalInFigure}">
						<input type="hidden" name="token" value="<%=RequestTokenUtil.getLatestToken()%>"/>
	                    <input type="hidden" name="directRequisition" id="directRequisition1" value="${PO_DETAILS.directRequisition}">
	                    <input type="hidden" name="submitFrom" id="submitFrom" value="podraft">
	                    	<input type="hidden" name="pageCount" id="pageCount_nav" value="${PO_NAV.pageCount}">
						<input type="hidden" name="pofilter" id="pofilter" value="${PO_NAV.pofilter}">
						<input type="hidden" name="poReqTypeFilter" id="poReqTypeFilter" value="${PO_NAV.poReqTypeFilter}">
						<input type="hidden" name="searchTextPo" id="searchTextPo_search" value="${PO_NAV.searchTextPo}">
						<input type="hidden" name="fromDashboard" id="fromDashboard_nav" value="${PO_NAV.fromDashboard}">
                        
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                                Delivery Terms<font color="#FF0000;">*</font>
                            </div>
                            <div class="adv-reg-comp-dtls-lbl addr-width">
                                <textarea class="popupTextArea1" id="deliveryTermsId" onkeyup="textCount('deliveryTermsId');" name="deliveryTermsDesc" rows="4" maxlength="2000">${PO_DETAILS.poDeliveryTerm}</textarea>
                                <span id="deliveryTermsId_count">0</span>/2000
                            </div>
                            <div class="row">
                            	<label class="adv-reg-popup-validation-lbl" id="errorDeliveryTermsId" style="display: none;"></label>
                            </div>
                        </div>
                    </div>
                    

                    
                    <div class="col-lg-6 col-md-12 col-sm-12">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                                Additional terms & Conditions<font color="#FF0000;">*</font>
                            </div>
                            <div class="adv-reg-comp-dtls-lbl addr-width">
                            <input type="hidden" id="termsNcondIdValue" name="termsNcondIdValue" value="${PO_DETAILS.poTermNCond}"/>
                                <textarea class="popupTextArea1" id="termsNcondId" onkeyup="textCount('termsNcondId');" name="termsNcondsDesc" 
                                placeholder="Notes" rows="4" maxlength="2000"></textarea>
                                
                                <!-- <span id="termsNcondId_count">0</span>/2000 -->
                            </div>
                            <div class="row">
                            	<label class="adv-reg-popup-validation-lbl" id="errorTermsId" style="display: none;"></label>
                            </div>
                        </div>
                    </div>
                    <!-- white space start here -->
                     <!-- white space start here -->
                    <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="tblmargin">
                     
	                     <div class="adv-reg-comp-sub-lbl">Delivery Document</div>
	                     	<div class="adv-reg-comp-dtls-lbl addr-width" id="poDeliveryDocOne" <c:if test="${empty PO_DETAILS.docMap['delivery'] && empty DELIVERY_DOCS.docName}">style="display: none;"</c:if>>
								<c:if test="${not empty PO_DETAILS.docMap['delivery']}">									
										<c:set value="${PO_DETAILS.docMap['delivery']}" var="delDoc"/>
										${delDoc.docName}(${delDoc.docSize})
										<img src="${pageContext.request.contextPath}/req-images/download-button.png" onclick="getDownloadDoc('${PO_DETAILS.purchaseOrderId}','${delDoc.docName}','delivery');">
								</c:if>
								<c:if test="${empty PO_DETAILS.docMap['delivery'] && not empty DELIVERY_DOCS.docName}">
										${DELIVERY_DOCS.docName}(${DELIVERY_DOCS.docSize})
	                            		<img src="${pageContext.request.contextPath}/req-images/download-button.png" onclick="getDownloadRequisitionDoc('${DELIVERY_DOCS.docId}','${DELIVERY_DOCS.docName}','${REQUISITION_DETAILS.reqId}','1');">
								</c:if>
								<a href="javascript:void(0);" onclick="showDelUpload();"><img src="${pageContext.request.contextPath}/po-images/deleteSmall.png"></a>
						 	</div>
						 	<div class="adv-reg-comp-dtls-lbl addr-width" id="showDeliveryDocOne" <c:if test="${not empty PO_DETAILS.docMap['delivery'] || not empty DELIVERY_DOCS.docName}">style="display: none;"</c:if>>
		                    		<jsp:include page="po_draft_delivery_upload_template.jsp"></jsp:include>
	                        </div>
	                     
	                        
                            <input type="hidden" id="workOrderId" value="${PO_DETAILS.docMap['purchase']}">
                            <c:if test="${not empty PO_DETAILS.docMap['purchase']}">
                            </c:if>
                            <div class="adv-reg-comp-dtls-lbl addr-width" id="poMainDocOne" <c:if test="${empty PO_DETAILS.docMap['purchase']}">style="display: none;"</c:if>>
                            <c:if test="${not empty PO_DETAILS.docMap['purchase']}">
								<c:set value="${PO_DETAILS.docMap['purchase']}" var="poDoc"/>
								${poDoc.docName}(${poDoc.docSize})
								<img src="${pageContext.request.contextPath}/req-images/download-button.png" onclick="getDownloadDoc('${PO_DETAILS.purchaseOrderId}','${poDoc.docName}','purchase');">
								</c:if>
								<a href="javascript:void(0);" onclick="showPOMainUploadDoc();"><img src="${pageContext.request.contextPath}/po-images/deleteSmall.png"></a>
								
                            </div>
                            <div class="adv-reg-comp-dtls-lbl addr-width" id="showpoMainDocOne"  <c:if test="${not empty PO_DETAILS.docMap['purchase']}">style="display: none;"</c:if>> 
                            <div class="adv-reg-comp-sub-lbl">PO/Work Order Document
                            <font color="#FF0000;">*</font>
                            </div> 
                            		<jsp:include page="po_draft_purchase_upload_template.jsp"></jsp:include>
                           
                           <label id="errorpo_document_0" class="adv-reg-popup-validation-lbl" style="display: none;"></label>
                           
                            </div>
	                       
	                        </div>
	                        </div>
	                        
	                        
                  
                    
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">Terms & Conditions Document</div>
                            <div class="adv-reg-comp-dtls-lbl addr-width" id="poTermDocOne" <c:if test="${empty PO_DETAILS.docMap['term'] && empty TERM_CONDN_DOCS.docName}">style="display: none;"</c:if> >
								<c:if test="${not empty PO_DETAILS.docMap['term']}">
									<c:set value="${PO_DETAILS.docMap['term']}" var="termDoc"/>
									${termDoc.docName}(${termDoc.docSize})
									<img src="${pageContext.request.contextPath}/req-images/download-button.png" onclick="getDownloadDoc('${PO_DETAILS.purchaseOrderId}','${termDoc.docName}','term');">
								</c:if>
								<c:if test="${empty PO_DETAILS.docMap['term'] && not empty TERM_CONDN_DOCS.docName}">
										${TERM_CONDN_DOCS.docName}(${TERM_CONDN_DOCS.docSize})
    	                            	<img src="${pageContext.request.contextPath}/req-images/download-button.png" onclick="getDownloadRequisitionDoc('${TERM_CONDN_DOCS.docId}','${TERM_CONDN_DOCS.docName}','${REQUISITION_DETAILS.reqId}','2');"> 
        	                        
								</c:if>								
								<a href="javascript:void(0);" onclick="showTermUpload();"><img src="${pageContext.request.contextPath}/po-images/deleteSmall.png"></a>
                            </div>
                            <div class="adv-reg-comp-dtls-lbl addr-width" id="showpoTermDocOne" <c:if test="${not empty PO_DETAILS.docMap['term'] || not empty TERM_CONDN_DOCS.docName}">style="display: none;"</c:if> >
                            		<jsp:include page="po_draft_termNcond_upload_template.jsp"></jsp:include>
                            </div>
                        </div>
                        
	                        
                    </div>
                    
                    <%-- <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">PO/Work Order Document</div>
                            <input type="hidden" id="workOrderId" value="${PO_DETAILS.docMap['purchase']}">
                            <c:if test="${not empty PO_DETAILS.docMap['purchase']}">
                            </c:if>
                            <div class="adv-reg-comp-dtls-lbl addr-width" id="poMainDocOne" <c:if test="${empty PO_DETAILS.docMap['purchase']}">style="display: none;"</c:if>>
                            <c:if test="${not empty PO_DETAILS.docMap['purchase']}">
								<c:set value="${PO_DETAILS.docMap['purchase']}" var="poDoc"/>
								${poDoc.docName}(${poDoc.docSize})
								<img src="${pageContext.request.contextPath}/req-images/download-button.png" onclick="getDownloadDoc('${PO_DETAILS.purchaseOrderId}','${poDoc.docName}','purchase');">
								</c:if>
								<a href="javascript:void(0);" onclick="showPOMainUploadDoc();"><img src="${pageContext.request.contextPath}/po-images/deleteSmall.png"></a>
                            </div>
                            <div class="adv-reg-comp-dtls-lbl addr-width" id="showpoMainDocOne" <c:if test="${not empty PO_DETAILS.docMap['purchase']}">style="display: none;"</c:if>>
                            		<jsp:include page="po_draft_purchase_upload_template.jsp"></jsp:include>
                           
                           <label id="errorpo_document_0" class="adv-reg-popup-validation-lbl" style="display: none;"></label>
                           
                            </div>
                        </div>
                    </div>  --%>
                    <c:if test="${PO_DETAILS.directRequisition eq true}">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
								Supplier Award Info
                            </div>
                            <div class="adv-reg-comp-dtls-lbl addr-width">
								<a href="#" onclick="getsupplierAwardInfoModal('${PO_DETAILS.awardedSupplier}','${PO_DETAILS.awardSupplierId}','${PO_DETAILS.awardDetilsId}')">View Supplier Award Info</a>
                            </div>
                        </div>
                   </div> 
                    </c:if>
                  <c:if test="${ not empty sourcingAwardExceedDocument.docName}">
                   <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
								Sourcing Award Exceed Document
                            </div>
                            <div class="adv-reg-comp-dtls-lbl addr-width">
								${sourcingAwardExceedDocument.docName }(${sourcingAwardExceedDocument.docSize})
                            	<img src="${pageContext.request.contextPath}/req-images/download-button.png" onclick="getSourcingExeedDocDownload('${sourcingAwardExceedDocument.docId}','${sourcingAwardExceedDocument.docName}');">
                            </div>
                        </div>
                   </div> 
                   </c:if>
                   <input type="hidden" id="adhocWorkflow" value="${ADHOC_WORKFLOW}">
                 <c:if test="${ADHOC_WORKFLOW eq true}">
                  <div class="form-group clearfix">
                    <label class="col-md-1 col-sm-1 control-label">WorkFlow Group:</label>
                            <div class="col-md-2 col-sm-2 custumrc">
								<c:choose>
                                    <c:when test="${approvalAllowedThisUser}">
                                        <c:forEach var="group" items="${GROUPS}" >
                                            <c:if test="${ADHOC_GROUPID eq group.key}"><div class="adv-reg-comp-dtls-lbl addr-width">${group.value}</div></c:if>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                         <select  id="groupId"  name="group"   class="form-control"  >
                          <option value="">Select Group</option>
                         <c:if test="${not empty GROUPS}">
                         <c:forEach var="group" items="${GROUPS}" >
                         ${ADHOC_GROUPID}
					 								<option value="${group.key}" <c:if test="${ADHOC_GROUPID eq group.key}">selected="selected"</c:if>>${group.value}</option>
                         </c:forEach>
                         </c:if>
                      
                         
                         </select>
						</c:otherwise>
					</c:choose> 
							 <span id="errorGroup" style="display:none; color: red;">Please Select Group</span>		   
                            </div>    
                            </div>
                            </c:if></div>
                   
</form>                   
                   
                    <!-- Short Closed PO details -->
                   <c:if test="${not empty SHORT_CLOSED_DETAILS || SHORT_CLOSED_DETAILS ne null}">
                     <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                               PO Short Closed Comments
                            </div>
                            <div class="adv-reg-comp-dtls-lbl addr-width">
                                ${SHORT_CLOSED_DETAILS.shortClosedComments}
                            </div>
                        </div>
                    </div>
                      <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                                PO Short ClosedBy
                            </div>
                            <div class="adv-reg-comp-dtls-lbl addr-width">
                                ${SHORT_CLOSED_DETAILS.createdBy}
                            </div>
                        </div>
                    </div>
                      <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="tblmargin">
                            <div class="adv-reg-comp-sub-lbl">
                               PO Short Closed Date
                            </div>
                            <div class="adv-reg-comp-dtls-lbl addr-width">
                                ${SHORT_CLOSED_DETAILS.poCreatedDate}
                            </div>
                        </div>
                    </div>
                   </c:if>
                   
                   <c:if test="${(PO_DETAILS.poStatus eq 14 or PO_DETAILS.poStatus eq 11 or PO_DETAILS.poStatus eq 13) and fn:length(SUPPLIER_REJECT_COMMENTS) gt 0}">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                    	<div class="adv-reg-comp-sub-lbl">
                               Supplier Reject Comments  
                            </div>
                        <table class="table mainTableAlign1">
                        <thead>
                            <tr class="adv-reg-comp-sub-lbl">
                                <th class="thr1-status-log adv-reg-comp-sub-lbl">Date</th>
                                <th class="thr2-status-log adv-reg-comp-sub-lbl">Comments</th>
                                <th class="thr3-status-log adv-reg-comp-sub-lbl">Rejected By</th>
                            </tr>
                        </thead>
                        <tbody>
                     
                 <c:forEach items="${SUPPLIER_REJECT_COMMENTS}" var="rejectComments" >
                       <tr class="adv-reg-comp-dtls-lbl firstRow">
                      
						 <td class="tdr1-status-log breakword">${rejectComments.approvedDate}</td>
                         <td class="tdr2-status-log breakword">${rejectComments.comments}</td>
                         <td class="tdr3-status-log breakword ">${rejectComments.poSupplier}</td>
                        
                        </tr>
					</c:forEach>	
                      </tbody>
                    </table>
                   </div>
                    </c:if>
                    <!-- white space end here -->
                    
                </div>
                
               <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 setback setmarg ">
               <label class="adv-reg-popup-validation-lbl" id="error_item_tax_hsn_percentage" style="display: none;"></label>
               
               		<c:if test="${PermissionMap[ClientUserPermission.PO_CREATION.permissionName] eq true 
               		|| PermissionMap[ClientUserPermission.PO_WITHOUT_CATALOG_CREATION.permissionName] eq true}">
                        <c:if test="${PO_DETAILS.directRequisition}"> 
                       		 <button  type="button" class="req-btn submit-button-align" id="deletePurchaseOrder">DELETE PO</button>
                       	 </c:if>
                       	<button type="button" class="req-btn submit-button-align" id="submitPurchaseOrder">SUBMIT ORDER</button>
                       	<button type="button" class="req-btn submit-button-align" id="draftPurchaseOrder">DRAFT ORDER</button>
                      <c:if test="${supplierPoActivation eq 1 }"> 	
                       	<button type="button" class="req-btn submit-button-align" id="supplierApproval">SHARE WITH SUPPLIER</button>
                       </c:if>
                    </c:if>
                 
                  	 <!-- 	<a href="getPoIndexPage">
							<button class="back-btn">BACK</button>
					 	</a> -->
					 	<c:if test="${empty PO_NAV.fromDashboard}">
						 <a href="#" id="backToSameList">
							<button class="back-btn" >Back</button>
						</a>
						</c:if>
						<c:if test="${not empty PO_NAV.fromDashboard}">
						 <a href="#" id="backToDraftList">
							<button class="back-btn" >Back</button>
						</a>
						</c:if>
                </div>
            </div>
        </div>

    <!-- </div> -->
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 catalog-footer-box">
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
            <div>

            </div>
        </div>

        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-12"></div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <center>
                <label class="adv-reg-comp-sub-lbl"> Copyright @ </label>
                <label class="adv-reg-comp-sub-lbl">Bob eProcure</label>
            </center>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
            <div>
                <center><img class="imgheight" src="${pageContext.request.contextPath}/po-images/bob-procure-logo.png"></center>
            </div>
        </div>


    </div>
    <!-- status log modal -->

    <div id="statuslogPopup" class="modal fade" role="dialog">
        <div class="modal-dialog modelAdjust">
            <!-- Modal content-->
            <div class="modal-content popupAdjust">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Status Log</h4>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <br/>
                </div>

                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                    <table class="table mainTableAlign1">
                        <thead>
                            <tr class="adv-reg-comp-sub-lbl">
                                <th class="thr1-status-log adv-reg-comp-sub-lbl">Date</th>
                                <th class="thr2-status-log adv-reg-comp-sub-lbl">Name</th>
                                <th class="thr3-status-log adv-reg-comp-sub-lbl">Designation</th>
                                <th class="thr4-status-log adv-reg-comp-sub-lbl">Action</th>
                                <th class="thr5-status-log adv-reg-comp-sub-lbl">Feedback/Message</th>

                            </tr>
                        </thead>
                        <tbody>
                 <c:forEach items="${STATUS_LOG}" var="statusLog" >
                       <tr class="adv-reg-comp-dtls-lbl firstRow">
						 <td class="tdr1-status-log breakword">${statusLog.createdDate}</td>
                         <td class="tdr2-status-log breakword">${statusLog.fullName}</td>
                         <td class="tdr3-status-log breakword ">${statusLog.desigName}</td>
                         <td class="tdr4-status-log breakword">${statusLog.action}</td>
                         <td class="tdr5-status-log">${statusLog.statusLogComment}</td>
                        </tr>
					</c:forEach>	
                      </tbody>
                    </table>
                </div>

                <div class="modal-footer">
						<div class="add-butn-req-edit" align="center">
						<button type="button"  class="back-btn" data-dismiss="modal"><b>Close</b></button>
                	  </div>
                </div>

            </div>
        </div>
       </div>
    		

 <!-- Billing Address  modal -->
	<div id="listBillingAddressModal" class="modal fade" role="dialog">
        <div class="modal-dialog list-del-modal-width">
            <!-- Modal content-->
            <div class="modal-content popupAdjust">
                <div class="modal-header">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label class="adv-reg-comp-dtls-heading-lbl header-top-margin-modal">Billing Address </label>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
                </div>
				<div class="tblmargin">
					<div class="adv-reg-comp-sub-lbl">Select Company </div>
					<div class="" style="padding-bottom:15px;">
						<select class="basic-reg-comp-dtls-txt" id="companyIdBilling" name="companyIdBilling" ">
							<option value="">Select</option>
							<c:forEach items="${COMPANY}" var="com">
								<option value="${com.key}">${com.value}</option>
							</c:forEach>
						</select>
					</div>
					<div class="adv-reg-comp-sub-lbl">Select State</div>
					<div class="">
						<select class="basic-reg-comp-dtls-txt" id="stateIdBilling" name="stateIdBilling" onchange="setBillingAddress();">
							<option value="">Select</option>
							<c:forEach items="${MASTER_STATE}" var="state">
								<option value="${state.key}">${state.value}</option>
							</c:forEach>
							<option value="multiple">Multiple</option>
						</select>
					</div>
					
				</div>
                <div id="radio-demo" class="">
					<div id="radio-billing"></div>
                    
                    <div class="modal-footer" align="left">
                        <div align="center">
                            <button type="button" class="btn btn-default saveButton address-account-button" data-dismiss="modal" id="billingAddressSelect"><b>Select</b></button>
                            <button type="button"  class="btn btn-default saveButton address-account-button" data-dismiss="modal"><b>Close</b></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- list of delievery address modal -->

    <div id="listAddressModal" class="modal fade" role="dialog">
        <div class="modal-dialog list-del-modal-width">
            <!-- Modal content-->
            <div class="modal-content popupAdjust">
                <div class="modal-header">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label class="adv-reg-comp-dtls-heading-lbl header-top-margin-modal" id="deliveryAddres">Delivery Address </label>
                        <label class="adv-reg-comp-dtls-heading-lbl header-top-margin-modal" id="warehouseAddres">Warehouse Address </label>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
                   <!--  <div class="row search-icon-padding item-margin col-lg-4 col-md-4 col-sm-4 col-xs-12 no-padding new-button-padding" id="">
                        <label class="add-item-label">Add New</label>
                        <button class="plus-btn-items" data-toggle="modal" data-target="#deliveryAddressModal" data-dismiss="modal">+</button>
                    </div> -->
                    <!-- <button type="button" class="btn btn-default saveButton-double" data-toggle="modal" data-target="#deliveryAddressModal" data-dismiss="modal">ADD NEW</button> -->
                </div>
				<div class="tblmargin">
					<div class="adv-reg-comp-sub-lbl">Select Company</div>
					<div class="" style="padding-bottom:15px;">
						<select class="basic-reg-comp-dtls-txt" id="companyIdDelivery" name="companyIdDelivery" >
							<option value="">Select</option>
							<c:forEach items="${COMPANY}" var="company">
								<option value="${company.key}">${company.value}</option>
							</c:forEach>
						</select>
					</div>
					<div class="adv-reg-comp-sub-lbl">Select State</div>
					<div class="">
						<select class="basic-reg-comp-dtls-txt" id="stateIdDelivery" name="stateIdDelivery" onchange="setDeliveryAddress();">
							<option value="">Select</option>
							<c:forEach items="${MASTER_STATE}" var="state">
								<option value="${state.key}">${state.value}</option>
							</c:forEach>
							<option value="multiple">Multiple</option>
						</select>
					</div>
					
				</div>

				<div id="radio-demo" class="">
					<div id="radio-delivery"></div>
                    
                    <div class="modal-footer" align="left">
                        <div align="center">
                            <button type="button" class="btn btn-default saveButton address-account-button" data-dismiss="modal" id="deliveryAddressSelect"><b>Select</b></button>
                            <button type="button"  class="btn btn-default saveButton address-account-button" data-dismiss="modal"><b>Close</b></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- list of supplier address modal -->

    <div id="supplierAddressModal" class="modal fade" role="dialog">
        <div class="modal-dialog list-del-modal-width">
            <!-- Modal content-->
            <div class="modal-content popupAdjust">
                <div class="modal-header">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label class="adv-reg-comp-dtls-heading-lbl header-top-margin-modal">Vendor Address </label>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
                   <!--  <div class="row search-icon-padding item-margin col-lg-4 col-md-4 col-sm-4 col-xs-12 no-padding new-button-padding" id="">
                        <label class="add-item-label">Add New</label>
                        <button class="plus-btn-items" data-toggle="modal" data-target="#deliveryAddressModal" data-dismiss="modal">+</button>
                    </div> -->
                    <!-- <button type="button" class="btn btn-default saveButton-double" data-toggle="modal" data-target="#deliveryAddressModal" data-dismiss="modal">ADD NEW</button> -->
                </div>
				<div class="tblmargin">
				 <c:if test="${fn:length(DISTRIBUTOR) gt 0}">
				<div class="adv-reg-comp-sub-lbl">Select Distributor</div>
					<div class="">
						<select class="basic-reg-comp-dtls-txt" name="distributors" id="distributors" onchange="setSuppliersStates();">
							<option value="">Select</option>
							<c:forEach items="${DISTRIBUTOR}" var="du">
								<option value="${du.key}" >${du.value}</option>
							</c:forEach>
						</select>
					</div>
				</c:if>	
					<div class="adv-reg-comp-sub-lbl">Select Vendor State</div>
					<div class="">
						<select class="basic-reg-comp-dtls-txt" id="supplierStateId" name="supplierState" onchange="setSupplierAddress();">
							<option value="">Select</option>
							<c:forEach items="${SUPPLIER_STATE}" var="state">
								<option value="${state.key}" >${state.value}</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<div id="radio-demo" class="">
					<div id="radio-supplier"></div>
                    
                    <div class="modal-footer" align="left">
                        <div align="center">
                            <button type="button" class="btn btn-default saveButton address-account-button" data-dismiss="modal" id="supplierAddressSelect"><b>Select</b></button>
                            <button type="button"  class="btn btn-default saveButton address-account-button" data-dismiss="modal"><b>Close</b></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- Costing Account modal -->

    <div id="costingAccountModal" class="modal fade" role="dialog">
        <div class="modal-dialog costing-account-req-modal">
            <!-- Modal content-->
            <div class="modal-content popupAdjust">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4> Select Cost Center </h4>
                </div>

                <div id="radio-demo-second" class="">
					<div id="radio-cost-center"></div>
					<%-- <c:forEach items="${COSTING_ACCOUNT}" var="acc" varStatus="loop">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-1 border-req-address">
                        <br>
                        <input type="radio" checked="checked" class="costing" name="radio_costing" id="first-choice-costing${loop.index}" value="${acc.value}" />
                        <label for="first-choice-costing${loop.index}" class="adv-reg-comp-dtls-lbl modal-address-margin"> ${acc.value}
                        </label>
                    </div>
                    </c:forEach> --%>
                    <!-- <hr> -->
                   
                    <div class="modal-footer" align="left">
                        <div class="add-butn-req-edit" align="center">
                            <button type="button" class="btn btn-default saveButton costing-account-button" data-dismiss="modal" id="costAccountSelect"><b>Select</b></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<div id="paymentTermsModal" class="modal fade" role="dialog">
        <div class="modal-dialog list-del-modal-width">
            <!-- Modal content-->
            <div class="modal-content popupAdjust">
                <div class="modal-header">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <label class="adv-reg-comp-dtls-heading-lbl header-top-margin-modal">Payment Terms </label>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
                </div>
                
                 <div class="modal-body">
				<div class="tbl">
                	<div class="table-responsive">
                		<table width="100%" border="0" cellspacing="0" cellpadding="0">
                			
                          
                           <c:if test="${SOURCING_CONFIG.multiplePaymentTerms eq true}">
                           
                            <c:set var="multiplePayments" value="${MULTIPLE_PAYMENTS.supplierPaymentTerms[SUPPLIERID]}"  />
                           
                           <tr>
                            	
                               
                                
                                  <th>Credit Days</th>
                                     <th>Quantum Percentage</th>
                                       <th>Payment Terms</th>
                                        <th>Pay Mode</th>
                            
                                  
                                 
                            </tr>
                            
                            
                            <c:forEach var="pay" items="${multiplePayments}" varStatus="Loop">
                            <tr>
                            
                              	  	<td><c:if test="${not empty pay.suppCreditDays}">${pay.suppCreditDays}</c:if>
                            	<c:if test="${empty pay.suppCreditDays}">NA</c:if></td>
                            	
                            	 	<td><c:if test="${not empty pay.suppQuantum}">${pay.suppQuantum}</c:if>
                            	<c:if test="${empty pay.suppQuantum}">NA</c:if></td> 
                            		
                            	<td><c:if test="${not empty pay.paymentTerms}">${pay.paymentTerms}</c:if>
                            	<c:if test="${empty pay.paymentTerms}">NA</c:if></td>
                            	
                            	
                            	<td><c:if test="${not empty pay.suppPayMode}">${pay.suppPayMode}</c:if>
                            	<c:if test="${empty pay.suppPayMode}">NA</c:if></td>
                            	
                            	
                            	
                            	
                            	
                            	
                            </tr>
                           </c:forEach>
                           
                           
                           
                           
                           
                           </c:if>  
                            
                            
                            
                            
                            
                	    </table>
                	</div>
               </div> 
               </div>
                
                    
                    <div class="modal-footer" align="left">
                        <div align="center">
                            <button type="button"  class="btn btn-default" data-dismiss="modal"><b>Close</b></button>
                        </div>
                    </div>
                
            </div>
        </div>
    </div>

<%-- ****************************************Schedule Line Items Modal ****************************************************************** --%>

<div id="scheduleLineItemModal" class="modal fade" role="dialog" style="width: 100vw;">
             <div class="modal-dialog dialogAlign">
              <div class="modal-content popupAdjust"> 
               <div class="modal-header fieldspacing">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4 class="modal-title">Schedule Line Item</h4>
               </div>
			   
			<form id="scheduleLineItemForm" class="form-horizontal" role="form" style="display:flex;justify-content:center;">
					
					<div class="row" style="width:100%">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fieldspacing inputfieldspacing">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
			           				 <div class="row">
			            				<label class="adv-reg-comp-sub-lbl">Item Name :</label>
			            			</div>
		            				<div class="row" id="itemNameForSchedule"></div>
	            				</div>
	            				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
			            			<div class="row">
			            				<label class="adv-reg-comp-sub-lbl">Item Description :</label>
			            			</div>
		            				<div class="row" id="itemDescriptionSchedule"></div>
	            				</div>
	            				<%-- <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
			            			<div class="row">
			            				<label class="adv-reg-comp-sub-lbl">Requisition No :</label>
			            			</div>
		            				<div class="row" id="itemDescriptionSchedule">
		            				${PO_DETAILS.reqId}
		            				</div>
	            				</div> --%>
	            				</div>
								
								<table class="table mainTableAlign1" style="display: relative; left:2rem;">
            					<thead>
                   				<tr >
                   					<th class="thr1-status-log adv-reg-comp-sub-lbl">Index</th>
			                       <!-- <th class="thr1-status-log adv-reg-comp-sub-lbl">Item Name</th>
			                       <th class="thr2-status-log adv-reg-comp-sub-lbl">Item Description</th> -->
			                       <th class="thr3-status-log adv-reg-comp-sub-lbl">Total Qty </th><!-- (UOM) -->
			                       <th class="thr4-status-log adv-reg-comp-sub-lbl">Open Qty </th><!-- (UOM) -->
			                       <th class="thr5-status-log adv-reg-comp-sub-lbl">Delivery Date</th>
			                       <th class="thr6-status-log adv-reg-comp-sub-lbl">Requisition Id</th>
			                       
			                       
			                   </tr>
			                   </thead>
			                   <tbody id="scheduleLineItemId">
			                      <tr class="adv-reg-comp-dtls-lbl">
			                      <!-- <td class="tdr1-status-log breakword"></td>
			                      <td class="tdr1-status-log breakword"></td> -->
			                      <td class="tdr1-status-log breakword"></td>
			                      <td class="tdr1-status-log breakword"></td>
			                      <td class="tdr1-status-log breakword"></td>
			                      <td class="tdr1-status-log breakword"></td>
			                      </tr>

	               				</tbody>
	               				
				   			</table>
				   			<div align="center">
							<button type="button" style="text-align:center;" class="back-btn" data-dismiss="modal"><b>Close</b></button>
							</div>
						</div>
						
						</form>
            		</div>
					</div>
				
	            
               </div>
<%-- ****************************************Schedule Line Items Modal End****************************************************************** --%>
<%-- ****************************************Schedule Price History Modal ****************************************************************** --%>

<div id="schedulePriceHistoryModal" class="modal fade" role="dialog" style="width: 100vw;">
             <div class="modal-dialog dialogAlign">
              <div class="modal-content popupAdjust"> 
               <div class="modal-header fieldspacing">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4 class="modal-title">Price History</h4>
               </div>
			   
			<form id="schedulePriceHistoryForm" class="form-horizontal" role="form" style="display:flex;justify-content:center;">
					
					<div class="row" style="width:100%">
								
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fieldspacing inputfieldspacing">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
			           				 <div class="row">
			            				<label class="adv-reg-comp-sub-lbl">Item Name :</label>
			            			</div>
		            				<div class="row" id="itemNameForPriceHistory"></div>
	            				</div>
	            				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
			            			<div class="row">
			            				<label class="adv-reg-comp-sub-lbl">Item Description :</label>
			            			</div>
		            				<div class="row" id="itemDescriptionPriceHistory"></div>
	            				</div>
	            				
	            				</div>
								<table class="table mainTableAlign1" style="display: relative; left:2rem;">
            					<thead>
                   				<tr >
			                      <!--  <th class="thr1-status-log adv-reg-comp-sub-lbl">Item Name</th>
			                       <th class="thr2-status-log adv-reg-comp-sub-lbl">Item Description</th> -->
			                       <th class="thr3-status-log adv-reg-comp-sub-lbl">Start Date</th>
			                       <th class="thr4-status-log adv-reg-comp-sub-lbl">End Date</th>
			                       <th class="thr5-status-log adv-reg-comp-sub-lbl">Unit Price</th>
			                       <th class="thr6-status-log adv-reg-comp-sub-lbl">Total Price</th>
			                       
			                       
			                   </tr>
			                   </thead>
			                   <tbody id="schedulePriceHistoryId">
			                      <tr class="adv-reg-comp-dtls-lbl">
			                      <!-- <td class="tdr1-status-log breakword"></td>
			                      <td class="tdr1-status-log breakword"></td> -->
			                      <td class="tdr1-status-log breakword"></td>
			                      <td class="tdr1-status-log breakword"></td>
			                      <td class="tdr1-status-log breakword"></td>
			                      <td class="tdr1-status-log breakword"></td>
			                      </tr>

	               				</tbody>
	               				
	               					
				   			</table>
				   			<div align="center">
							<button type="button" style="text-align:center;" class="back-btn" data-dismiss="modal"><b>Close</b></button>
						</div>
						</div>
						
						</form>
            		</div>
					</div>
				
	            
               </div>
<%-- ****************************************Schedule Line Items Modal End****************************************************************** --%>



        <!-- Costing Account modal -->
<%-- ****************************************Tax Structure Model ****************************************************************** --%>
		<%-- <c:forEach items="${ITEMS_TAX}" var="tax" varStatus="outloop">
	    <c:set value="${tax.key}" var="itemIdKey"/>
			<div id="taxStructureModal_${itemIdKey}" class="modal fade" role="dialog">
              <div class="modal-dialog costing-account-req-modal">
                <div class="modal-content popupAdjust">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4> Tax Structure </h4>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-1 border-req-address">
                    <table class="table mainTableAlign1" >
        			 <thead>
                  	  <tr class="adv-reg-comp-sub-lbl">
			            <th class="thr1-status-log adv-reg-comp-sub-lbl">Tax Label</th>
			            <th class="thr2-status-log adv-reg-comp-sub-lbl">Tax Value</th>
			          </tr>
			         </thead>
			         <tbody id="priceTableContentId">
	                   	<c:forEach items="${ITEMS_TAX[itemIdKey]}" var="component" varStatus="innerloop">
                           <tr class="adv-reg-comp-dtls-lbl firstRow">
							 <td class="tdr1-status-log breakword">
								<c:if test="${component.compName eq null}">Base Price</c:if>
								<c:if test="${component.compName ne null}">${component.compName}
								   <c:if test="${component.compType eq 2}">(${component.taxValue}%)</c:if>
							    </c:if>
							 </td>
							 <td class="tdr1-status-log breakword">
							    <c:if test="${component.compType eq 0 || component.compType eq 1 }">${component.taxValue}</c:if> 
			                    <c:if test="${component.compType eq 2}">${component.rowCalTax}</c:if>&nbsp;${PO_DETAILS.currencyName}
							 </td>
						   </tr>
	                    </c:forEach>
				     </tbody>
			        </table>
                </div>
                <div class="modal-footer" align="left">
                     <div class="add-butn-req-edit" align="center"></div>
                </div>
              </div>
            </div>
        </div>  
     </c:forEach> --%>
<%-- ****************************************Tax Structure Model ****************************************************************** --%>
<%-- ****************************************Tax Structure Model2 ****************************************************************** --%>
		<%-- <c:forEach items="${ITEMS_STRUCT}" var="tax" varStatus="outloop">
	    <c:set value="${tax.key}" var="itemIdKey"/>
	    	<div id="taxStructureModal2_${itemIdKey}" class="modal fade" role="dialog">
             <div class="modal-dialog dialogAlign">
              <div class="modal-content popupAdjust">
               <div class="modal-header fieldspacing">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4 class="modal-title">Tax Edit</h4>
               </div>
			   
<form id="updateTaxFormId_${outloop.index}" name="updateTaxForm_${outloop.index}" class="form-horizontal" role="form">
					<input type="hidden" name="purchaseOrderId" value="${PO_DETAILS.purchaseOrderId}">
					<input type="hidden" name="purchaseItemId"value="${itemIdKey}">				    
				    <div class="fieldspacing inputfieldspacing col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	                <div class="row">
								<label class="adv-reg-comp-sub-lbl">PRICE</label>
								<input type="hidden" class="adv-reg-popup-textbox" value="" name="calculatedTotalPrice" id="calculatedTotalPrice" readonly="readonly">
					</div>
					<div class="row">
								<table class="table mainTableAlign1" >
            					<thead>
                   				<tr class="adv-reg-comp-sub-lbl">
			                       <th class="thr1-status-log adv-reg-comp-sub-lbl">Price label</th>
			                       <th class="thr2-status-log adv-reg-comp-sub-lbl">Price type (Amount/Percentage)</th>
			                       <th class="thr2-status-log adv-reg-comp-sub-lbl">Value</th>
			                       <th class="thr3-status-log adv-reg-comp-sub-lbl">Calculation on</th>
			                       <th class="thr4-status-log adv-reg-comp-sub-lbl">Calculation type</th>
			                       <th class="thr4-status-log adv-reg-comp-sub-lbl">Add</th>
			                       <th class="thr2-status-log adv-reg-comp-sub-lbl">&nbsp;</th>
			                   </tr>
			                   </thead>
			                   <tbody id="priceTableContentId_${outloop.index}">
			                   <c:forEach items="${ITEMS_STRUCT[itemIdKey]}" var="component" varStatus="innerloop">
			                   <c:if test="${innerloop.index eq 0 }">
			                       <tr class="adv-reg-comp-dtls-lbl firstRow">
										 <td class="tdr1-status-log breakword">
										 <input type="text" name="taxLabelName" class="adv-reg-popup-textbox " value="Base Price" readonly="readonly"> 
<label id="taxLabelName_${outloop.index}0" class="adv-reg-popup-validation-lbl" style="display: none;"></label>
										 </td>
				                         <td class="tdr2-status-log breakword">
				                         	 Amount/Percentage
				                         	 <input type="hidden" name="priceType" value="0" class="basic-reg-comp-dtls-txt ">
<label id="priceType_${outloop.index}0" class="adv-reg-popup-validation-lbl" style="display: none;"></label>
				                         </td>
				                         <td class="tdr1-status-log breakword">
										 	<!-- <input type="text" name="BasePrice" id="BasePriceId" class="adv-reg-popup-textbox" value="" placeholder="Enter Base Price"> -->
										 	    <input type="text"  name="taxValueName" id="BasePriceId_${outloop.index}0" class="adv-reg-popup-textbox commonTaxValue" value="${component.taxValue}"  placeholder="Enter Base Price" maxlength="11">
<label id="errorTaxValueName_${outloop.index}0" class="adv-reg-popup-validation-lbl" style="display: none;"></label>
										 </td>
				                         <td class="tdr3-status-log breakword ">
				                         	 	<input type="hidden"  value="0"  name="calculateOn"  class="basic-reg-comp-dtls-txt " >
				                         	NA
<label id="calculateOn_${outloop.index}0" class="adv-reg-popup-validation-lbl" style="display: none;"></label>
				                         </td>
				                         <td class="tdr4-status-log breakword">
				                         		<input type="hidden"  value="0" name="calculateType"  class="basic-reg-comp-dtls-txt ">
				                         	NA  
<label id="calculateType_${outloop.index}0" class="adv-reg-popup-validation-lbl" style="display: none;"></label>
				                         </td>
				                         <td>
				                         	 <a href="#"><i class="icon icon-plus sub-plus" onclick="addPriceData('${outloop.index}',${innerloop.index},event);"></i></a>
				                         </td>
				                  </tr>
</c:if>
<c:if test="${innerloop.index ne 0 }">
        <tr class="adv-reg-comp-dtls-lbl secondRow">  
		  <td class="tdr1-status-log breakword"> 
	 	    <select id="taxLabelId_${outloop.index}${innerloop.index}" name="taxLabelName" class="basic-reg-comp-dtls-txt commonlabel_${outloop.index} selectlable" onchange="populatePriceType('${outloop.index}${innerloop.index}');">
	 	 		<option value="">SELECT</option> 
	 	 		<c:forEach items="${LABMAP}" var="lab"> 
	 	 		<c:if test="${component.compName eq lab.key}">
	 	 			<option value="${lab.key}" selected="selected">${lab.value.compName}</option>
	 	 		</c:if>
	 	 		<c:if test="${component.compName ne lab.key}">
	 	 			<option value="${lab.key}" >${lab.value.compName}</option>
	 	 		</c:if>  
	 	 		</c:forEach> 
	 	 	</select> 
	 	    <label id="errorTaxLabelName_${outloop.index}${innerloop.index}" class="adv-reg-popup-validation-lbl" style="display: none;"></label> 
	 	  </td> 
     	  <td class="tdr2-status-log breakword"> 
				<select id="priceTypeId_${outloop.index}${innerloop.index}"  name="priceType"  class="basic-reg-comp-dtls-txt commonPriceType" disabled="disabled">  
    	 			<option value="">SELECT</option> 
    	 			<option value="${AMOUNT}" <c:if test="${component.compType  eq AMOUNT}">selected="selected"</c:if>>Amount</option> 
    	 			<option value="${PERCENTAGE}" <c:if test="${component.compType eq PERCENTAGE}">selected="selected"</c:if>>Percentage</option> 
         		</select> 
         		<label id="errorPriceType_${outloop.index}${innerloop.index}" class="adv-reg-popup-validation-lbl" style="display: none;" ></label> 
     	  </td> 
     	  <td class="tdr1-status-log breakword"> 
	 	 	   <input type="text" id="taxValueId_${outloop.index}${innerloop.index}"  name="taxValueName" class="adv-reg-popup-textbox commonTaxValue" value="${component.taxValue}" placeholder="">
	 	       <label id="errorTaxValueName_${outloop.index}${innerloop.index}" class="adv-reg-popup-validation-lbl" style="display: none;" ></label>
	 	  </td> 
	 	  <td class="tdr3-status-log breakword"> 
				 <select id="calculateOnId_${outloop.index}${innerloop.index}"  name="calculateOn"  class="basic-reg-comp-dtls-txt commonCalculation" >  
    	 		<option value="">SELECT</option> 
    	 		<option value="${BASEPRICE}" <c:if test="${component.calcOn eq BASEPRICE}">selected="selected"</c:if> >Base Price</option> 
    	 		<option value="${CALCULATEDPRICE}" <c:if test="${component.calcOn eq CALCULATEDPRICE}">selected="selected"</c:if>>Calculate Price</option> 
         	 </select> 
              <label id="errorCalculateOn_${outloop.index}${innerloop.index}" class="adv-reg-popup-validation-lbl" style="display: none;" ></label> 
     	 </td> 
     	 <td class="tdr4-status-log breakword"> 
     			 <select id="calculateTypeId_${outloop.index}${innerloop.index}"  name="calculateType"  class="basic-reg-comp-dtls-txt commonCalculationType"> 
    	 		<option value="">SELECT</option> 
    	 		<option value="${INCREMENT}" <c:if test="${component.calcType eq INCREMENT}">selected="selected"</c:if>>Increment</option> 
    	 		<option value="${DECREMENT}" <c:if test="${component.calcType eq DECREMENT}">selected="selected"</c:if>>Decrement</option> 
         	 </select> 
              <label id="errorCalculateType_${outloop.index}${innerloop.index}" class="adv-reg-popup-validation-lbl" style="display: none;" ></label> 
     	 </td>
     	 <td> 
		 	<a href="#"><i class="icon icon-minus sub-plus removePriceDataContent "></i></a>
    	 </td> 
		 </tr> 
</c:if>
</c:forEach>
               </tbody>
			   </table>
			</div>
            </div>
					</div>
				</form>
	             <div class="modal-footer">
	               <div align="center">
					 <button  id="updatesaveTax" type="button" class="btn btn-default" onclick="updatesaveTax('${outloop.index}')"><b>Update</b></button>
	               </div>
	             </div>
               </div>
              </div>
           </div>
     </c:forEach> --%>
<%-- ****************************************Tax Structure Model ****************************************************************** --%>

<div id="taxStructureModal" class="modal fade" role="dialog" style="width: 110%;">
             <div class="modal-dialog dialogAlign">
              <div class="modal-content popupAdjust"> 
               <div class="modal-header fieldspacing">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4 class="modal-title">Price Breakup</h4>
               </div>
			   
			<form id="updateTaxFormId" class="form-horizontal" role="form">
					<input type="hidden" name="purchaseOrderId" value="${PO_DETAILS.purchaseOrderId}">
					<input type="hidden" name="purchaseItemId" id="tsPoItemId" value="">
					<input type="hidden" name="pageCount" id="pageCount" value="${PO_NAV.pageCount}">
					<input type="hidden" name="pofilter" id="pofilter" value="${PO_NAV.pofilter}">
					<input type="hidden" name="poReqTypeFilter" id="poReqTypeFilter" value="${PO_NAV.poReqTypeFilter}">
					<input type="hidden" name="searchTextPo" id="searchTextPo_search" value="${PO_NAV.searchTextPo}">
					<input type="hidden" name="fromDashboard" id="fromDashboard_nav" value="${PO_NAV.fromDashboard}">	
								    
				    <div class="fieldspacing inputfieldspacing col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					 <input type="hidden" name="noOfDecimal" value="${NO_OF_DECIMAL}"/>
	                <!-- <div class="row">
								<label class="adv-reg-comp-sub-lbl">PRICE</label>
								<input type="hidden" class="adv-reg-popup-textbox" value="" name="calculatedTotalPrice" id="calculatedTotalPrice" readonly="readonly">
					</div> -->
					<div class="row">
								<table class="table mainTableAlign1" >
            					<thead>
                   				<tr class="adv-reg-comp-sub-lbl">
			                       <th class="thr1-status-log adv-reg-comp-sub-lbl">Price label</th>
			                       <th class="thr2-status-log adv-reg-comp-sub-lbl">Price type (Amount/Percentage)</th>
			                       <th class="thr6-status-log adv-reg-comp-sub-lbl">Value</th>
			                       <th class="thr3-status-log adv-reg-comp-sub-lbl">Calculation on</th>
			                       <th class="thr4-status-log adv-reg-comp-sub-lbl">Calculation type</th>
			                       <th class="thr4-status-log adv-reg-comp-sub-lbl">
			                       <c:if test="${CLIENT_NAME ne 'NCC'}">Add/Remove</c:if></th>
			                       <th class="thr2-status-log adv-reg-comp-sub-lbl">&nbsp;</th>
			                   </tr>
			                   </thead>
			                   <tbody id="priceTableContentId1">
			                       <tr class="adv-reg-comp-dtls-lbl firstRow">
										 <td class="tdr1-status-log breakword">
										 <input type="text" name="taxLabelName" class="adv-reg-popup-textbox " value="Base Price" readonly="readonly"> 
											<label id="taxLabelName_0" class="adv-reg-popup-validation-lbl" style="display: none;"></label>
										 </td>
				                         <td class="tdr2-status-log breakword">
				                         	 Amount/Percentage
				                         	 <input type="hidden" name="priceType" value="0" class="basic-reg-comp-dtls-txt ">
											<label id="priceType_0" class="adv-reg-popup-validation-lbl" style="display: none;"></label>
				                         </td>
				                         <td class="tdr1-status-log breakword">
										 	<!-- <input type="text" name="BasePrice" id="BasePriceId" class="adv-reg-popup-textbox" value="" placeholder="Enter Base Price"> -->
										 	    <input type="text"  name="taxValueName" id="BasePriceId_0" class="adv-reg-popup-textbox commonTaxValue "  value=""  placeholder="Enter Base Price" maxlength="17" readonly="readonly">
												<label id="errorTaxValueName_0" class="adv-reg-popup-validation-lbl" style="display: none;"></label>
										 </td>
				                         <td class="tdr3-status-log breakword ">
				                         	 	<input type="hidden"  value="0"  name="calculateOn"  class="basic-reg-comp-dtls-txt " >
				                         	NA
											<label id="calculateOn_0" class="adv-reg-popup-validation-lbl" style="display: none;"></label>
				                         </td>
				                         <td class="tdr4-status-log breakword">
				                         		<input type="hidden"  value="0" name="calculateType"  class="basic-reg-comp-dtls-txt ">
				                         	NA  
											<label id="calculateType_0" class="adv-reg-popup-validation-lbl" style="display: none;"></label>
				                         </td>
				                         <td>
				                          <c:if test="${CLIENT_NAME ne 'NCC'}">
				                         	 <a href="#"><i class="icon icon-plus sub-plus" onclick="addPriceData(event);"></i></a>
				                    	</c:if>
				                         </td>
				                  </tr>

	               				</tbody>
				   			</table>
						</div>
            		</div>
					</div>
				</form>
	             <div class="modal-footer">
	               <div align="center">

	               <c:if test="${CLIENT_NAME ne 'NCC'}">
	               	<button  id="updatesaveTax" type="button" class="btn btn-default" onclick="updatesaveTax()"><b>Update</b></button> 
	               </c:if>
					<!--  <button  id="updatesaveTax" type="button" class="btn btn-default" onclick="updatesaveTax()"><b>Update</b></button> -->
					 <button type="button" style="text-align:center;" class="back-btn" data-dismiss="modal"><b>Close</b></button>
	               </div>
	             </div>
               </div>
              </div>
           </div>
           
           
           
           <div id="quantityUpdateModal" class="modal fade" role="dialog">
             <div class="modal-dialog dialogAlign" style="width: 50% !important">
              <div class="modal-content popupAdjust">
               <div class="modal-header fieldspacing">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4 class="modal-title">Quantity Edit</h4>
               </div>
			   
			<form id="updateTaxFormId" class="form-horizontal" role="form">
					
					    <input type="hidden" name="token" value="<%=RequestTokenUtil.getLatestToken()%>"/>
						
					
				  <!--   <div class="fieldspacing inputfieldspacing col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> -->
					<div class="tbl">
								<table class="table">
            					<thead>
                   				<tr class="adv-reg-comp-sub-lbl">
			                       <th class="thr1-status-log adv-reg-comp-sub-lbl" style="width: 230px;">Item Description</th>
			                       <th class="thr2-status-log adv-reg-comp-sub-lbl">PO Quantity</th>
			                       <th class="thr2-status-log adv-reg-comp-sub-lbl">Available Quantity</th>
			                        <th class="thr2-status-log adv-reg-comp-sub-lbl">Quantity</th>
			                     
			                   </tr>
			                   </thead>
			                   <tbody id="quantityTableContentId1">
			                   	<c:forEach items="${ITEM_MAP}" var="item" varStatus="loop">
			                   	<tr>
			                   	<td>
			                   	<%-- ${item.value.itemDescription} --%>
			                   	<div class="itemDescriptionContainer">
															
														<c:choose>
															<c:when test="${fn:length(item.value.itemDescription) <= 100}">
																<span class="truncated-txt" style="text-align: justify;">${item.value.itemDescription}</span>

															</c:when>
															<c:otherwise>
																<span class="truncated-txt" style="text-align: justify;">${item.value.itemDescription.substring(0,100)}</span>
																<div class="full-txt" style="max-height:200px;overflow:auto;display: none;">${item.value.itemDescription}</div>
																<span class="moree-read" style="cursor: pointer;color: #337ab7;">...more</span>
														    </c:otherwise>
														</c:choose>
													  </div>
			                   	
			                   	<input type="hidden" class="itemIds" id="itemIds_${loop.count}" value="${item.value.itemId}">
			                   	</td>
			                   	  	<td>
			                   	  		
		
		
			                   	  	<input type="hidden"  id="itemQuantity_${loop.count}" value="${item.value.itemQuantity}">
			                   	  	<input type="hidden"  id="availableQuantity_${loop.count}" value="${item.value.acceptedQuantity}">
			                   	  		<input type="hidden"  id="updatePoItemId_${loop.count}" value="${item.value.poItemId}">
			                   	  <c:set var="quan" value="${item.value.itemQuantity}"/>	
			                   <%=CurrencyFormatting.formatCurrency(new BigDecimal(pageContext.getAttribute("quan").toString()), 2)%>
			                   	</td>
			                   	  	<td>
			                   	  	
			                   	  	 <c:set var="accquan" value="${item.value.acceptedQuantity}"/>	
			                   <%=CurrencyFormatting.formatCurrency(new BigDecimal(pageContext.getAttribute("accquan").toString()), 2)%>
			                 
			                   	</td>
			                   	  	<td>
			                   <input type="text"  value="${quan}" class="presentQuantity" id="presentQuantity_${loop.count}">
			                   	</td>
			                   	
			                   	
			                   	</tr>
			                   	
			                   	
			                   	</c:forEach>
			                   
			                   
			                   
	               				</tbody>
				   			</table>
						</div>
            		<!-- </div>
					</div> -->
				</form>
	             <div class="modal-footer">
	               <div align="center">
					 
					 <button  id="" type="button" class="btn btn-primary" onclick="updatePoQuantities()" ><b>Update</b></button> 
					<button  id="" type="button" class="btn btn-primary"  data-dismiss="modal" ><b>Close</b></button> 
	               </div>
	             </div>
               </div>
              </div>
           </div>

	<div class="modal fade" id="itemDataPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	 <div class="modal-dialog popupAdjust">
      <div class="modal-content popupAdjust">
       <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
         <h4 class="modal-title" id="myModalLabel"><strong>Item Information</strong></h4>
          <div class="modal-body">
          	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fieldspacing inputfieldspacing">
          	<br>
	           <!--  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"> -->
	           <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
		            <div class="row">
		            	<label class="adv-reg-comp-sub-lbl">Category :</label>
		            </div>
		            <div class="row" id="itemCategoryNameModal"></div>
	            </div>
	           <!--  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"> -->
	           <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
	            	<div class="row">
	                	<label class="adv-reg-comp-sub-lbl">Item Name :</label>
	                </div>
	                <div class="row" id="itemNameInfo"></div>
	            </div>
	       		<!-- <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"> -->
	       		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
	           		<div class="row">
	               		<label class="adv-reg-comp-sub-lbl">Suggest Supplier :</label>
	           		</div>
	           		<div class="row" id="itemSupplierNameModal"></div>
	       		</div>
   		   </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fieldspacing inputfieldspacing">
          	<br>
               <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="row">
                  <label class="adv-reg-comp-sub-lbl">GL Code :</label>
                </div>
                <div class="row" id="itemGLCode"></div>
              </div>
               <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="row">
                  <label class="adv-reg-comp-sub-lbl">HSN Code :</label>
                </div>
                <div class="row" id="itemHSNCode"></div>
              </div>
               <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="row">
                  <label class="adv-reg-comp-sub-lbl">Material Code :</label>
                </div>
                <div class="row" id="itemMATCode"></div>
              </div>
               <!-- <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            		<div class="row">
                                		<label class="adv-reg-comp-sub-lbl">AUC Code :</label>
                            		</div>
                            		<div class="row" id="aucCodeModal">
                            		</div>
                </div> -->
           </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fieldspacing inputfieldspacing">
              <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="row">
                  <label class="adv-reg-comp-sub-lbl">Quantity :</label>
                </div>
                <div class="row" id="itemQuantityModal"></div>
              </div>
              <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="row">
                  <label class="adv-reg-comp-sub-lbl">UOM :</label>
                </div>
                <div class="row" id="itemUOMModal"></div>
              </div>
              <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="row">
                  <label class="adv-reg-comp-sub-lbl pricelabel">Price :</label>
                </div>
                <div class="row" id="itemPriceModal"></div>
              </div>
              <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <div class="row">
                  <label class="adv-reg-comp-sub-lbl">Price per :</label>
                </div>
                <div class="row" id="pricePerModal"></div>
              </div>
             </div>
           
     	   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fieldspacing inputfieldspacing">
           	 <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12" style="text-align: justify;">
               <div class="row">
                 <label class="adv-reg-comp-sub-lbl">Description :</label>
               </div>
               <div class="row" id="itemDescriptionModal">
				<span class="truncated-text"></span>
				<span class="full-text" style="display: none;"></span>
				<span class="read-more" style="cursor: pointer;color: #337ab7;">...more</span>
			</div>


			   </div>
             </div>
             <c:if test="${PO_DETAILS.costCenterPer eq 1}">
	                    			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
	                            		<div class="row">
	                                		<label class="adv-reg-comp-sub-lbl">Cost center :</label>
	                            		</div>
	                            		<div class="row" id="costCenterModal">
	                            		</div>
	                        		</div>
                        		</c:if>
            </div>
           
          </div>
             
          <div class="modal-footer" align="left">
               				<div align="add-butn-req-edit" style="margin-top:10px">
                            <button type="button" style="text-align:center;" class="back-btn" data-dismiss="modal"><b>Close</b></button>
                        	</div>
                 <!--  <button type="button" class="close" data-dismiss="modal">CLOSE</button>
                  </div> -->
              			</div>
         </div>
        </div>
       </div>   
	  </div>
	  
	  <!-- -------------------------------------------Auc code edit modal-------------------------------------------- -->
	  <div id="CostCenterEditModal" class="modal fade" role="dialog" style="width: 62%;">
        <div class="modal-dialog dialogAlign">
            <!-- Modal content-->
            <div class="modal-content popupAdjust">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4> Item and Services </h4>
                </div>
                
			<form id="item_cost_center_form">
				<input type="hidden" name="token" value="<%=RequestTokenUtil.getLatestToken()%>"/>
				<input type="hidden" name="reqId"  value="${PO_DETAILS.purchaseOrderId}">
				<input type="hidden" name="reqItemId" id="po_item_id" value="">
				<input type="hidden" name="pageCount" id="pageCount" value="${PO_NAV.pageCount}">
				<input type="hidden" name="pofilter" id="pofilter" value="${PO_NAV.pofilter}">
				<input type="hidden" name="poReqTypeFilter" id="poReqTypeFilter" value="${PO_NAV.poReqTypeFilter}">
				<input type="hidden" name="searchTextPo" id="searchTextPo_search" value="${PO_NAV.searchTextPo}">
				<input type="hidden" name="fromDashboard" id="fromDashboard_nav" value="${PO_NAV.fromDashboard}">
	  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 fieldspacing inputfieldspacing" id="hsnCodeDiv">
							<br>
							 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                            	<div class="row">
                                	<label class="adv-reg-comp-sub-lbl">AUC code</label>
                            	</div>
                            </div>
                            <div class="col-lg-5 col-md-5 col-sm-1 col-xs-12">
                            	 <input type="text"  id="auc_code2" value="" name="aucCode" maxlength="50"/>
                            	 <div class="row" style="display:none;" id="aucCodeError1">
                                <label class="adv-reg-popup-validation-lbl">Enter AUC code</label>
                            </div>
                            </div>
                             <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                            	<button type="button" class="btn btn-primary updateCostCenter" id="updateAucCode"><b>UPDATE</b></button>
                             
                    		</div>
                    		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                             <button type="button"  class="btn btn-primary" data-dismiss="modal"><b>Close</b></button>
                    		</div>
		</div>
		
		 <div class="modal-footer" style="padding:0px;margin-bottom:30px;">
		
                </div>
                
               </form> 
            </div>
        </div>
       </div>
       
            <!-- -------------------------------------------Approver Reject Model-------------------------------------------- -->        


<!-- -------------------------------------------Approver Reject Model-------------------------------------------- -->
	
	<div id="CancelReqPopup" class="modal fade" role="dialog">
             <div class="modal-dialog dialogAlign">
              <div class="modal-content popupAdjust">
               <div class="modal-header fieldspacing">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4 class="modal-title">PO Submission Comments</h4>
               </div>
			   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><br></div>
			   	  <form id="req_cancel_form" name="ReqCancelForm" class="form-horizontal" role="form">
				    <div class="fieldspacing inputfieldspacing col-lg-12 col-md-12 col-sm-12 col-xs-12">
					   
					    <input type="hidden" name="reqId" id="cancel_req_id" value="">
						 
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="row">
								<label class="basic-reg-comp-sub-lbl">Comment</label>
							</div>
							<div class="row">
							  <textarea rows="6" cols="3" maxlength="2000" id="cancelComment" onkeyup="textCount('cancelComment');" name="comment" class="popupTextArea"  placeholder=""></textarea>
							</div>
							<div class="row">
								<span id="cancelComment_count">0</span>/2000	
								<label id="errorCancelComment" class="basic-reg-comp-dtls-validation-lbl commonRegError" style="display: none"></label>	
							</div>							
						</div>
					</div>
				</form>
				
	             <div class="modal-footer">
	               <div align="center">
	               <button type="button" class="req-btn submit-button-align" data-dismiss="modal"><b>Close</b></button>
					 <button  id="saveCancelComment" type="button" class="req-btn submit-button-align"><b>Submit PO</b></button>
					 
					 
	               </div>
	             </div>
               </div>
              </div>
           </div>
	
	<div id="addServiceModel" class="modal fade" role="dialog"  style="width: 110%;">
             <div class="modal-dialog dialogAlign">
              <div class="modal-content popupAdjust">
               <div class="modal-header fieldspacing">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4 class="modal-title">Add Services</h4>
               </div>
			   
			<form id="addServiceModelId" class="form-horizontal" role="form">
			<input type="hidden" name="token" value="<%=RequestTokenUtil.getLatestToken()%>"/>
					<input type="hidden" name="purchaseOrderId" value="${PO_DETAILS.purchaseOrderId}">
					<input type="hidden" name="poId" value="${PO_DETAILS.purchaseOrderId}">
					<input type="hidden" name="purchaseItemId" id="tsPoItemId" value="">
					<input type="hidden" name="pageCount" id="pageCount" value="${PO_NAV.pageCount}">
					<input type="hidden" name="pofilter" id="pofilter" value="${PO_NAV.pofilter}">
					<input type="hidden" name="poReqTypeFilter" id="poReqTypeFilter" value="${PO_NAV.poReqTypeFilter}">
					<input type="hidden" name="searchTextPo" id="searchTextPo_search" value="${PO_NAV.searchTextPo}">
					<input type="hidden" name="fromDashboard" id="fromDashboard_nav" value="${PO_NAV.fromDashboard}">	
				    <input type="hidden" name="poItemId" value="" id="saved_poItemIds"/>
 
		  			       <input type="hidden" name="" value="" id="saved_l3Category"/>
						   <input type="hidden" name="" value="" id="saved_subCategory"/>
						   <input type="hidden" name="" value="" id="saved_Category"/>
				       
				       <input type="hidden" name="servicItemId" value="" id="saved_servicItemId"/>
				       <input type="hidden" name="serviceDescription" value="" id="saved_serviceDescription"/>
				       <input type="hidden" name="serviceQuantity" value="" id="saved_serviceQuantity"/>
				       <input type="hidden" name="subItemPrice" value="" id="saved_price"/>
				       <input type="hidden" name="itemUoms" value="" id="saved_itemUoms"/>
		
		
				    <div class="fieldspacing inputfieldspacing col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					 <input type="hidden" name="noOfDecimal" value="${NO_OF_DECIMAL}"/>
	                
	                
	                <div class="row" id="subCategory_label">
		            </div>
	                
			  	
			<div class="row">  	
			  	<div class="col-md-3 col-sm-3 clearfix" style="padding-top: 30px;">
			            Item Name/Code :
                 </div>
					
					 <div class="col-md-3 col-sm-3 clearfix" style="padding-top: 30px;">
					<input type="text"   id="searchedString"  class="form-control" value=""  placeholder="Please enter item name/code">
					  
					 </div>
					  <div class="col-md-2 col-sm-2" style="padding-top: 30px;">
					<button type="button"   class="btn btn-primary" onclick="getSetviceItems();"><span class="glyphicon glyphicon-search"></span></button>
						</div>	
				</div>
				
					
					<div class="row" style="padding-top: 30px;">
						<table class="table mainTableAlign1 serviceItemsTable" >
            					<thead>
                   				<tr class="adv-reg-comp-sub-lbl">
                   				   <th class="adv-reg-comp-sub-lbl">
									 </th>
			                       <th class="adv-reg-comp-sub-lbl">Item &nbsp;Name</th>
			                       <th class="adv-reg-comp-sub-lbl">Description</th>
			                       <th class="adv-reg-comp-sub-lbl">Quantity</th>
			                       <th class="adv-reg-comp-sub-lbl">UOM</th>
			                       <th class="adv-reg-comp-sub-lbl">Price &nbsp;${PO_DETAILS.currencyName}</th>
			                       <th class="adv-reg-comp-sub-lbl">&nbsp;</th>
			                   </tr>
			                   </thead>
			                   <tbody id="addServiceModelsTable">
			                       
									
							    </tbody>
							    </table>		
						</div>
            		</div>
					</div>
				</form>
	             <div class="modal-footer">
	               <div align="center">
					 <!-- <button  id="SaveService" type="button" class="req-btn submit-button-align" onclick="SaveServiceItems()"><b>Add Services</b></button> -->
					 <button type="button" class="back-btn" data-dismiss="modal"><b>Close</b></button>
	               </div>
	             </div>
               </div>
              </div>
           </div>
	
	
	
		<jsp:include page="recently_added_catalog.jsp"></jsp:include>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
       <%--  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> --%>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="${pageContext.request.contextPath}/po-js/bootstrap.js"></script>
        
        <script type="text/javascript" src="<%=request.getContextPath()%>/dwr/engine.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/util.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath()%>/etender-javascript/dwr_error_page.js"></script>
		
		<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/interface/PoMngController.js"></script>
</body>

<form class="form-horizontal" id="docDownloadForm">
	<input type="hidden" name="poId" id="po_id" value="${PO_DETAILS.purchaseOrderId}">
	<input type="hidden" name="token" value="<%=RequestTokenUtil.getLatestToken()%>"/>
	<input type="hidden" name="docName" value="" id="doc_name">
	<input type="hidden" name="docType" value="" id="doc_type">
	<input type="hidden" name="delschId" value="" id="delschId">
</form>
<form class="form-horizontal" id="sourcingExceedDocDownloadForm">
	<input type="hidden" name="docId" id="exceedDocId" value="">
	<input type="hidden" name="sourcingReqId" id="sourcingReqId" value="${PO_DETAILS.sourcingReqId}">
	<input type="hidden" name="docName" id="exceedDocName" value="">
	<input type="hidden" name="downloadStatus"  value="1">
</form>
<form class="form-horizontal" id="supplierApprovalForm">
	<input type="hidden" name="poId" id="supplier_app_po_id" value="${PO_DETAILS.purchaseOrderId}">
</form>
<form class="form-horizontal" name="requisitionDocDownloadForm" id="requisitionDocDownloadForm">
    <input type="hidden" name="token" value="<%=RequestTokenUtil.getLatestToken()%>"/>
	<input type="hidden" name="docId" id="doc_Id" value="">
	<input type="hidden" name="docName" id="doc_Name"  value="">
	<input type="hidden" name="requisitionId" id="requisition_Id"  value="">
	<input type="hidden" name="reqItemId" id="requisition_item_Id"  value="">
	<input type="hidden" name="docType" id="docType"  value="">
</form>

<form class="form-horizontal" id="text_form">
	<input type="hidden" name="pageCount" id="pageCount_nav" value="${currentPoPage}">
</form>
<form class="form-horizontal" id="my_text_form">
	<input type="hidden" name="poId" id="po_id" value="${PO_NAV.poId}">
	<input type="hidden" name="pageCount" id="pageCount" value="${PO_NAV.pageCount}">
	<input type="hidden" name="pofilter" id="pofilter" value="${PO_NAV.pofilter}">
	<input type="hidden" name="poReqTypeFilter" id="poReqTypeFilter" value="${PO_NAV.poReqTypeFilter}">
	<input type="hidden" name="searchTextPo" id="searchTextPo_search" value="${PO_NAV.searchTextPo}">
	<input type="hidden" name="fromDashboard" id="fromDashboard_nav" value="${PO_NAV.fromDashboard}">
</form>

<form class="form-horizontal" id="delete_po_form">
	<input type="hidden" name="poId" id="po_id_del" value="${PO_DETAILS.purchaseOrderId}">
	<input type="hidden" name="pageCount" id="pageCount_del" value="${PO_NAV.pageCount}">
	<input type="hidden" name="pofilter" id="pofilter_del" value="${PO_NAV.pofilter}">
	<input type="hidden" name="poReqTypeFilter" id="poReqTypeFilter_del" value="${PO_NAV.poReqTypeFilter}">
	<input type="hidden" name="searchTextPo" id="searchTextPo_search_del" value="${PO_NAV.searchTextPo}">
	<input type="hidden" name="fromDashboard" id="fromDashboard_nav_del" value="${PO_NAV.fromDashboard}">
</form>

<form class="form-horizontal" id="deleteFormService">
	<input type="hidden" name="poId" id="po_id" value="${PO_DETAILS.purchaseOrderId}">
	<input type="hidden" name="token" value="<%=RequestTokenUtil.getLatestToken()%>"/>
	<input type="hidden" name="serviceDtlsId" value="" id="serviceDtlsId_delete">
</form>

<script type="text/javascript" async>
var contextPath='<%=request.getContextPath()%>';

dwr.engine.setAsync(false);
var global_price_component_list=null;
var master_item_list = null;
var saved_item = null;
var id_index		= 1; //  for tax details row id generation 
var item_index = 0;
var warehouse = null;
$(document).ready(function(e) {
	global_price_component_list=${MASTER_PRICE_COMP_LIST};
	
	  $('[data-toggle="tooltip"]').tooltip();
	  	  
});

var awardCientName=$('#awardClientNames').val();
if(awardCientName=="NCC")
	{
	$('#budgetCodes').hide();
	}
	
	if(awardCientName=="NCC"){
		CKEDITOR.replace('termsNcondId');
		  
		  var data = $("#termsNcondIdValue").val();
		  //alert("hi"+data);
		  CKEDITOR.instances.termsNcondId.setData(data);
		$("#warehouseAdd").show();
		$("#deliveryAdd").hide();
		$("#budgetCod").hide();
		$("#warehouseAddr").show();
		$("#deliveryAddr").hide();
		$('#deliveryAddres').hide();
		$('#warehouseAddres').show();
	}
	else{
		$("#budgetCod").show();
		$("#deliveryAdd").show();
		$("#warehouseAdd").hide();
		$("#warehouseAddr").hide();
		$("#deliveryAddr").show();
		$('#deliveryAddres').show();
		$('#warehouseAddres').hide();
	}
	

		$(document).ready(function() {
		
			textCount('deliveryTermsId');
			textCount('termsNcondId');
			
			/*awardCientName=('#awardClientNames').val();
			if(awardCientName=="NCC")
				{
				('#budgetCodes').hide();
				}*/
			
			
			/* if($("#poType").val()==1){
				$("#poTypeTextMandatary").show();
				$(".capex_auc_tr").show();
				$(".capex_auc_th").show();
			} */
			
			$('.choosenBox').chosen({
	    		
	    	});
			$('.chosen-container').css("width","150px");
	    	$('.chosen-single').css("height","30px");
	    	  $('.chosen-drop').css("z-index","999");
	    	$('.chosen-container').css("position","absolute");
	    	master_item_list = ${MASTER_ITEM};
	    	 
			var today = new Date();
		    var tomorrow = new Date();
		    tomorrow.setDate(today.getDate() + 1);
		    $('.deliverydate').datetimepicker({
				format:'d-m-Y',
					timepicker:false,
					scrollMonth : false,
					scrollInput : false,
					minDate: new Date()
			});
		    saved_item = ${DELIVERY_SEC};
		  //to populate delivery schedule
	    	if(saved_item!=null && saved_item.length>0){
		        var item_name_id = 'itemName_'+item_index;
		        var po_item_id = 'poItemId_'+item_index;
		        var delivery_schedule_id = 'deliveryScheduleId_'+item_index;
		        var quantity_id = 'quantity_'+item_index;
		        var delivery_date_id = 'deliverydate_'+item_index;
		        var delivery_description_id = 'deliverydetails_'+item_index;
		        var item = saved_item[0];
		       // populateJQueryChosenSelectBoxForItem('itemName_0', master_item_list);
		    	populateJQueryChosenSelectBoxForItemForEdit('itemName_0', master_item_list,'Select',item);
		    	warehouse = ${WAREHOUSE_ADDRESS_SEC};
		    	populateJQueryChosenSelectBoxForIteWarehouse('project_address_0', warehouse);
		    	
		    	$('#project_address_0').addClass('weare_'+item.poItemId);
		    	$('#'+delivery_date_id).addClass('date_'+item.poItemId);
		    	
		    	 $('#'+delivery_schedule_id).val(item.deliveryScheduleId);
		       // $('#'+item_name_id).val(item.deliveryItemId);
		        $('#'+po_item_id).val(item.poItemId);
		        $('#'+delivery_date_id).val(item.deliveryDate);
		        $('#'+quantity_id).val(item.deliveryQty);
		        $('#'+quantity_id).addClass("quanity_"+item.deliveryItemId);
		        
		        $('#'+delivery_description_id).val(item.deliveryDesc);
		        $("#"+item_name_id).trigger("chosen:updated");
		        
		        var project_address = 'project_address_'+item_index;
		        if(item.projectAddressId!=null){
			        $('#'+project_address).val(item.projectAddressId);
		            $("#"+project_address).trigger("chosen:updated");
		        }
		        
	            $('.choosenBox').chosen();
	            $('.chosen-single').css("height","35px");
	            $('.chosen-container').css("width","140px");
	            $('.chosen-drop').css("z-index","1999");
	        	$('.chosen-container').css("position","absolute");
	        	
		        // for loop will start from second item
		        //console.log("saved_item.length="+saved_item.length);
		        for(var i=1 ; i<saved_item.length ; i++){
		        	item_index++;
		        	item = saved_item[item_index];
		            var content = '<tr class="adv-reg-comp-dtls-lbl secondRow-DS">'
		            		+ '<input type="hidden" name="deliveryScheduleId" id="deliveryScheduleId_'+item_index+'" value="">'
		            		+ '<input type="hidden" name="poItemId" id="poItemId_'+item_index+'" value="">'
		            		+ '<td class="tdr-purchase-1 no-word-break" style="width: 140px;"><select class="basic-reg-comp-dtls-txt tbl-responsive-dropdown choosenBox itemName" id="itemName_'+item_index+'" onchange="changeItemName(this);" name="deliveryItemId"></select></td>'
			        		+ '<td class=" no-word-break text-center" style="width: 140px;"><input id="deliverydate_'+item_index+'"  name="deliveryDate" autocomplete="off"  class="datetimepicker basic-reg-comp-dtls-txt deliverydate" placeholder="Select Date"></td>'
			        		+ '<td class=" no-word-break text-center" style="width: 100px;"><input type="text" maxlength="8"  class="adv-reg-popup-textbox1 tbl-responsive-quantity quantity quanity_'+item.itemId+'" id="quantity_'+item_index+'" name="deliveryQty"></td>'
			        		+ '<td class=" no-word-break text-center" ><input type="text"  class="adv-reg-popup-textbox1 tbl-responsive-quantity deliverydetails" id="deliverydetails_'+item_index+'" name="deliveryDesc"></td>' ;
			        		if(awardCientName=="NCC")
			        		{
			        			content=content+ '<td class="tdr-purchase-1 no-word-break" style="width: 180px;"><select class="basic-reg-comp-dtls-txt tbl-responsive-dropdown choosenBox projectAddressId poItemId" id="project_address_'+item_index+'"  name="deliveryWarehouse"></select></td>';
			        		}
			        		content=content+ '<td class=" no-word-break valign "><img src="contract-images/deleteSmall.png" class="del-img-margin" onclick="removetblrow(this)" alt="Delete" title="Delete"></td></tr>';
			        $('.deliveryTable').find('tr:last').after(content);
		            $('.choosenBox').chosen();
		            $('.chosen-single').css("height","35px");
		            $('.chosen-container').css("width","140px");
		            $('.chosen-drop').css("z-index","1999");
		        	$('.chosen-container').css("position","absolute");
		        	item_name_id = 'itemName_'+item_index;
			        delivery_schedule_id = 'deliveryScheduleId_'+item_index;
			        quantity_id = 'quantity_'+item_index;
			        delivery_date_id = 'deliverydate_'+item_index;
			        delivery_description_id = 'deliverydetails_'+item_index;
			        po_item_id = 'poItemId_'+item_index;
			        project_address = 'project_address_'+item_index;
			        
		           //populateJQueryChosenSelectBoxForItem(item_name_id, master_item_list);
		           console.log("item----");
		           
		            populateJQueryChosenSelectBoxForItemForEdit(item_name_id, master_item_list,'Select',item);
		            populateJQueryChosenSelectBoxForIteWarehouse(project_address, warehouse);
		            $('#'+project_address).val(item.projectAddressId);
		            $("#"+project_address).trigger("chosen:updated");
		            
		            $('#'+project_address).addClass('weare_'+item.poItemId);
		            $('#'+delivery_date_id).addClass('date_'+item.poItemId);
			        //console.log("i="+item_index);
			        //console.log("item.itemId="+item.itemId);
			        $('#'+delivery_schedule_id).val(item.deliveryScheduleId);
			        $('#'+po_item_id).val(item.poItemId);
			       // $('#'+item_name_id).val(item.deliveryItemId);
			        $('#'+delivery_date_id).val(item.deliveryDate);
			        $('#'+quantity_id).val(item.deliveryQty);
			        $('#'+delivery_description_id).val(item.deliveryDesc);
			        $("#"+item_name_id).trigger("chosen:updated");
			        $('.deliverydate').datetimepicker({
				    	format:'d-m-Y',
				    	timepicker:false,
				    	scrollMonth : false,
				    	scrollInput : false,
				    	minDate: new Date()
				    });
		        }
			}  else{
				var item = saved_item[0];
		        populateJQueryChosenSelectBoxForItem('itemName_0', master_item_list);
		    	///populateJQueryChosenSelectBoxForItemForEdit('itemName_0', master_item_list,'Select',item);
		    	warehouse = ${WAREHOUSE_ADDRESS_SEC};
		        populateJQueryChosenSelectBoxForIteWarehouse('project_address_0', warehouse);
		}
		});
		
		
		
		$(document).on('click','.removeRegFileButton',function(event){
		 	event.preventDefault();
		 	//$(this).parents('.supplyRegDocChild').remove();	
		 	return false;
		});
		
	function getTaxStructureModal(reqItemId){
		var awardCientName=$('#awardClientNames').val();
		if(awardCientName=="NCC"){
				getTaxStructure(reqItemId);
		}else{
			if(confirm("Any unsaved data will get lost ? Are you sure to continue.")){ 
				getTaxStructure(reqItemId);
			}
		}
		 
	}

		
	function getTaxStructure(reqItemId){
		var formId="updateTaxFormId";
		$('.secondRow').remove();
		$("#"+formId +" #BasePriceId_0").val("");
		$("#"+formId +" #tsPoItemId").val(reqItemId);
		var map_compId_filesId = new Object();
		
		PoMngController.getItemTaxStructure(reqItemId,{async:false,callback:function(data){
			
			if(data!=null){
				if(data.length>0){
					
					
					//$("#"+formId +" #BasePriceId_0").val(data[0].taxValue);
					$("#"+formId +" #BasePriceId_0").val(data[0].taxVal);
					for(var i=1;i<=((data.length)-1);i++){
						
				       
			        	 id_index++;  //  incrementing the id for every new row. No where decrementing , because id has to be unique
			        	 var price_label_select_boxId = "taxLabelId_"+id_index; // unique dynamic taxLabelId hidden box id generation
			        	 var price_type_id = "priceTypeId_"+id_index; // unique dynamic priceTypeId hidden box id generation
			        	 var calculation_type = "calculateTypeId_"+id_index; // unique dynamic calculateTypeId hidden box id generation
			        	 var calculation_on_select_boxId = "calculateOnId_"+id_index; // unique dynamic calculateOnId hidden box id generation
			        	 
			        	 var content = ' <tr class="adv-reg-comp-dtls-lbl secondRow"> ' 
			        			+ ' <td class="tdr1-status-log breakword"> '
			        		 	+ ' <select id="taxLabelId_'+id_index+'" name="taxLabelName" class="basic-reg-comp-dtls-txt commonlabel selectlable" disabled="disabled"> '
			        		 	+ ' 	<option value="">SELECT</option> '
			        		 	+ ' </select> '
			        		 	+ ' <label id="errorTaxLabelName_'+id_index+'" class="adv-reg-popup-validation-lbl" style="display: none;"></label> '
			        		 	+ ' </td> '
			        	     	+ ' <td class="tdr2-status-log breakword"> '
			        			+ '		<select id="priceTypeId_'+id_index+'"  name="priceType"  class="basic-reg-comp-dtls-txt commonPriceType" disabled="disabled" > ' 
			        	    	+ ' 		<option value="">SELECT</option> '
			        	    	+ ' 		<option value="${AMOUNT}">Amount</option> '
			        	    	+ ' 		<option value="${PERCENTAGE}">Percentage</option> '
			        	        + ' 	</select> '
			        	        + ' 	<label id="errorPriceType_'+id_index+'" class="adv-reg-popup-validation-lbl" style="display: none;" ></label> '
			        	     	+ ' </td> '
			        	     	+ ' <td class="tdr6-status-log breakword"> '
			        		 	+ ' 	<input type="text" id="taxValueId_'+id_index+'"  name="taxValueName" class="adv-reg-popup-textbox commonTaxValue" value="" placeholder="" readonly="readonly"> '
			        		 	+ '     <label id="errorTaxValueName_'+id_index+'" class="adv-reg-popup-validation-lbl" style="display: none;" ></label> '
			        		 	+ ' <br> <span id="taxValue_text_'+id_index+'"></td> '
			        		 	+ ' <td class="tdr3-status-log breakword"> '
			        			+ '		 <select id="calculateOnId_'+id_index+'"  name="calculateOn"  class="basic-reg-comp-dtls-txt commonCalculation" disabled="disabled"> ' 
			        	    	+ ' 		<option value="">SELECT</option> '
			        	    	+ ' 		<option value="${BASEPRICE}">Base Price</option> '
			        	    	+ ' 		<option value="${CALCULATEDPRICE}">Calculate Price</option> '
			        	        + ' 	 </select> '
			        	        + '      <label id="errorCalculateOn_'+id_index+'" class="adv-reg-popup-validation-lbl" style="display: none;" ></label> '
			        	     	+ ' </td> '
			        	     	+ ' <td class="tdr4-status-log breakword"> '
			        	     	+ '		 <select id="calculateTypeId_'+id_index+'"  name="calculateType"  class="basic-reg-comp-dtls-txt commonCalculationType" disabled="disabled"> ' 
			        	    	+ ' 		<option value="">SELECT</option> '
			        	    	+ ' 		<option value="${INCREMENT}">Increment</option> '
			        	    	+ ' 		<option value="${DECREMENT}">Decrement</option> '
			        	        + ' 	 </select> '
			        	        + '      <label id="errorCalculateType_'+id_index+'" class="adv-reg-popup-validation-lbl" style="display: none;" ></label> '
			        	     	+ ' </td> '
			        	     	+ ' <td> ' ;
			        	    
			        	     	if(awardCientName!="NCC"){
			        	     		content=content+ ' <a href="#"><i class="icon icon-minus sub-plus removePriceDataContent "></i></a> ';
			        	     	}
			        	     content=content+ '  </td>  </tr> ';
			        		
			        	     
			        			$('#priceTableContentId1').append(content);
			        		 //populate dynamic base price select box
				 			 populateBasePriceSelectBox(price_label_select_boxId,price_type_id,global_price_component_list,formId,calculation_type);
				 			 //populate dynamic calculation on select box
				 			 populateCalculationOnSelectBox(calculation_on_select_boxId,global_price_component_list,formId);
				 			
				 			$('#'+price_label_select_boxId).val(data[i].compName);
				 			$('#'+price_type_id).val(data[i].compType);
				 			$('#taxValueId_'+id_index).val(data[i].taxValue);
				 			//$('#taxValueId_'+id_index).val(data[i].taxVal);
				 			$('#'+calculation_on_select_boxId).val(data[i].calcOn);
				 			$('#'+calculation_type).val(data[i].calcType);
				 			if(awardCientName=="NCC"){
				 				if(data[i].taxable == true){
					 				$('#taxValue_text_'+id_index).text('( HSN Tax '+data[i].taxValue+'%)');
				 				}
					 			map_compId_filesId['taxValueId_'+id_index+'']=data[i].compName;
				 			}
				 			
					}
				
					if(awardCientName=="NCC"){
						//alert("test-------------------1");
						PoMngController.getAllItemHsnPercentage(reqItemId,{async:false,callback:function(data_map){
								if(data_map!=null){
								//alert("need to update percentage ");
									var keys=Object.keys(data_map);
									if(keys.length>0){
										
										  $.each(map_compId_filesId, function (i, val) {
											  console.log("selected component id -----="+val);
											  console.log("selected component filed id----="+i);
											 // alert('selected---------'+data_map[val]);
												if(data_map[val]!=null && data_map[val]!= undefined &&
														 data_map[val]!= undefined && data_map[val]>0){
													$('#'+i).val(data_map[val]);
													$('#'+i).prop("readonly",true);
												}
											  
										  
										 });
										
									}
									
								}
							
						}});
						
						
						 //$('select[name=taxLabelName]').prop('disabled', true);
						 // $('input[name="taxValueName"]').prop("readonly",true);
						 //$('select[name=calculateType]').prop('disabled', true);
						 // $('select[name=calculateOn]').prop('disabled', true);
					}	
				}
			}
		}});
		
		
		 
		$("#taxStructureModal").modal({backdrop: "static"});
	}
		
	function populateBasePriceSelectBox(dynamic_select_box_id,dynamic_price_type_id,data_list,formId,dynamic_calculation_type){
			if($("#"+formId+" #"+dynamic_select_box_id)!=null && $("#"+formId+" #"+dynamic_select_box_id) != undefined ){
				
				$("#"+formId+" #"+dynamic_select_box_id).empty();
				
				$("#"+formId+" #"+dynamic_select_box_id).append("<option value=''>Select</option>");
				
				var selectedBasePrice=[];
				$("#"+formId+' select[name="taxLabelName"]').each(function () {
				    if ($("#"+formId+" #"+$(this).attr('id')).find("option:selected").val()!='') {
				    	selectedBasePrice.push($("#"+formId+" #"+$(this).attr('id')).find("option:selected").val());
				    }
				});						
				//console.log("selectedBasePrice="+selectedBasePrice);
				//console.log("data_list="+data_list);
				if(data_list!=null){
//					
					for(var i=0;i<data_list.length;i++){
						//console.log("for");
						var priceComp=data_list[i];
						
					//	console.log("priceComp.priceCompId="+priceComp.priceCompId);
					//	console.log("priceComp.compName="+priceComp.compName);
						if($.inArray(priceComp.priceCompId, selectedBasePrice)==-1){				
							
							$("#"+formId+" #"+dynamic_select_box_id).append("<option value='" +priceComp.priceCompId + "'>" +priceComp.compName+ "</option>");
						}
					}
				}
				$("#"+formId+" #"+dynamic_select_box_id).change(function(){
					
					if($(this).val()){
						for(var i=0;i<data_list.length;i++){
							var priceComp=data_list[i];
							console.log("priceComp.priceCompId="+priceComp.priceCompId);
							console.log("priceComp.compType="+priceComp.compType);
							if(priceComp.priceCompId==$(this).val()){
								if(priceComp.compType==0){
									$("#"+formId+" #"+dynamic_price_type_id).val(1);
								}							
								if(priceComp.compType==1){
									$("#"+formId+" #"+dynamic_price_type_id).val(2);
								}
		
									
							}
							
						}
					}
				});
			
			}
		}

		function populateCalculationOnSelectBox(dynamic_select_box_id,data_list,formId){
			if($("#"+formId+" #"+dynamic_select_box_id)!=null && $("#"+formId+" #"+dynamic_select_box_id) != undefined ){
					
				$("#"+formId+" #"+dynamic_select_box_id).empty();
					
				$("#"+formId+" #"+dynamic_select_box_id).append("<option value=''>Select</option>");
				$("#"+formId+" #"+dynamic_select_box_id).append("<option value='CAL01'>Base Price</option>");
				$("#"+formId+" #"+dynamic_select_box_id).append("<option value='CAL02'>Calculated Price</option>");
					
					var selectedBasePrice=[];
					$("#"+formId+' select[name="taxLabelName"]').each(function () {
					    if ($("#"+formId+" #"+$(this).attr('id')).find("option:selected").val()!='') {
					    	selectedBasePrice.push($("#"+formId+" #"+$(this).attr('id')).find("option:selected").val());
					    }
					});						
			//console.log("selectedBasePrice="+selectedBasePrice);
					if(data_list!=null){
						for(var i=0;i<data_list.length;i++){
							var priceComp=data_list[i];
							//console.log("priceComp.priceCompId="+priceComp.priceCompId+"="+$.inArray(priceComp.priceCompId, selectedBasePrice));
							if($.inArray(priceComp.priceCompId, selectedBasePrice)!=-1){
								$("#"+formId+" #"+dynamic_select_box_id).append("<option value='" +priceComp.priceCompId + "'>" +priceComp.compName+ "</option>");
							}
						}
					}
			}		
		}
	function getItemCatalogModal(reqItemId){
		PoMngController.getItemModalDetailsForCatalogInPO(reqItemId,{async:false,callback:function(data){
		if(data!=null){
			$('#itemDataPopup').modal('show');
	 		$('#itemNameInfo').text(data.itemName);
			 $('#itemDataPopup').on('show.bs.modal', function () {
						var FullItemDescription = data.itemDescription;
						var maxDisplayLength = 200;
						var TruncatedItemDescription = FullItemDescription.substring(0, maxDisplayLength);

						if (FullItemDescription.length > maxDisplayLength) {
							$('.truncated-text').text(TruncatedItemDescription).show();
							$('.full-text').text(FullItemDescription).hide();
							$('.read-more').text("...more").show();
						} else {
							$('.truncated-text').text(FullItemDescription).show();
							$('.full-text').hide();
							$('.read-more').hide();
						}
						toggleSetUp();
					});
						toggleSetUp();
					$('#itemDataPopup').modal('show');
	 		
	 		$('#itemQuantityModal').text(data.itemQuantity);
			$('#itemUOMModal').text(data.itemUom);
			$('#itemPriceModal').text(data.itemPrice);			
			$('#itemCategoryNameModal').text(data.categoryName);
			$('#itemSupplierNameModal').text(data.supplierId);
			
			if(data.itemGLCode==null){
				$('#itemGLCode').text("NA");
			}else{
				$('#itemGLCode').text(data.itemGLCode);
			}
			if(data.itemHSNCode==null){
				$('#itemHSNCode').text("NA");
			}else{
				$('#itemHSNCode').text(data.itemHSNCode);
			}
			if(data.itemMATCode==null){
				$('#itemMATCode').text("NA");
			}else{
				$('#itemMATCode').text(data.itemMATCode);
			}
			if(data.reason==null){
				$('#itemReasonModal').text("NA");
			}else{
				$('#itemReasonModal').text(data.reason);
			}
			if(data.aucCode==null){
				$('#aucCodeModal').text("");
			}else{
				$('#aucCodeModal').text(data.aucCode);
			}
			if(data.costingAccount==null){
				$('#costCenterModal').text("");
			}else{
				$('#costCenterModal').text(data.costingAccount);
			}
			if(data.pricePer==1){
				$('#pricePerModal').text("Unit");	
			}else{
				$('#pricePerModal').text("Total");
			}
		 	}
		}});
	}
	

	//var index = 0; 
	function addPriceData(event){
		event.preventDefault();
		var formId="updateTaxFormId";
		id_index++;  //  incrementing the id for every new row. No where decrementing , because id has to be unique
   	 var price_label_select_boxId = "taxLabelId_"+id_index; // unique dynamic taxLabelId hidden box id generation
   	 var price_type_id = "priceTypeId_"+id_index; // unique dynamic priceTypeId hidden box id generation
   	 var calculation_type = "calculateTypeId_"+id_index; // unique dynamic calculateTypeId hidden box id generation
   	 var calculation_on_select_boxId = "calculateOnId_"+id_index; // unique dynamic calculateOnId hidden box id generation
   	 
   	 var content = ' <tr class="adv-reg-comp-dtls-lbl secondRow"> ' 
   			+ ' <td class="tdr1-status-log breakword"> '
   		 	+ ' <select id="taxLabelId_'+id_index+'" name="taxLabelName" class="basic-reg-comp-dtls-txt commonlabel selectlable"> '
   		 	+ ' 	<option value="">SELECT</option> '
   		 	+ ' </select> '
   		 	+ ' <label id="errorTaxLabelName_'+id_index+'" class="adv-reg-popup-validation-lbl" style="display: none;"></label> '
   		 	+ ' </td> '
   	     	+ ' <td class="tdr2-status-log breakword"> '
   			+ '		<select id="priceTypeId_'+id_index+'"  name="priceType"  class="basic-reg-comp-dtls-txt commonPriceType" disabled="disabled" > ' 
   	    	+ ' 		<option value="">SELECT</option> '
   	    	+ ' 		<option value="${AMOUNT}">Amount</option> '
   	    	+ ' 		<option value="${PERCENTAGE}">Percentage</option> '
   	        + ' 	</select> '
   	        + ' 	<label id="errorPriceType_'+id_index+'" class="adv-reg-popup-validation-lbl" style="display: none;" ></label> '
   	     	+ ' </td> '
   	     	+ ' <td class="tdr1-status-log breakword"> '
   		 	+ ' 	<input type="text" id="taxValueId_'+id_index+'"  name="taxValueName" class="adv-reg-popup-textbox commonTaxValue" value="" placeholder="" maxlength="17"> '
   		 	+ '     <label id="errorTaxValueName_'+id_index+'" class="adv-reg-popup-validation-lbl" style="display: none;" ></label> '
   		 	+ ' </td> '
   		 	+ ' <td class="tdr3-status-log breakword"> '
   			+ '		 <select id="calculateOnId_'+id_index+'"  name="calculateOn"  class="basic-reg-comp-dtls-txt commonCalculation" > ' 
   	    	+ ' 		<option value="">SELECT</option> '
   	    	+ ' 		<option value="${BASEPRICE}">Base Price</option> '
   	    	+ ' 		<option value="${CALCULATEDPRICE}">Calculate Price</option> '
   	        + ' 	 </select> '
   	        + '      <label id="errorCalculateOn_'+id_index+'" class="adv-reg-popup-validation-lbl" style="display: none;" ></label> '
   	     	+ ' </td> '
   	     	+ ' <td class="tdr4-status-log breakword"> '
   	     	+ '		 <select id="calculateTypeId_'+id_index+'"  name="calculateType"  class="basic-reg-comp-dtls-txt commonCalculationType"> ' 
   	    	+ ' 		<option value="">SELECT</option> '
   	    	+ ' 		<option value="${INCREMENT}">Increment</option> '
   	    	+ ' 		<option value="${DECREMENT}">Decrement</option> '
   	        + ' 	 </select> '
   	        + '      <label id="errorCalculateType_'+id_index+'" class="adv-reg-popup-validation-lbl" style="display: none;" ></label> '
   	     	+ ' </td> '
   	     	+ ' <td> '
   			+ ' <a href="#"><i class="icon icon-minus sub-plus removePriceDataContent "></i></a> '
   	    	+ '  </td> '
   			+ ' </tr> ';
   		
   			$('#priceTableContentId1').append(content);
   		 //populate dynamic base price select box
			 populateBasePriceSelectBox(price_label_select_boxId,price_type_id,global_price_component_list,formId,calculation_type);
			 //populate dynamic calculation on select box
			 populateCalculationOnSelectBox(calculation_on_select_boxId,global_price_component_list,formId);
	
	}

	$(document).on('click','.removePriceDataContent',function(event){
		event.preventDefault();
		$(this).parents('.secondRow').remove();	
		return false;
	});

	 function onlyNumeric(value) {
		 var pattern=/^[0-9]*$/i;
		if(value!=""){
			return pattern.test(value);
	    }else{
	    	return false;
	    }
	    return false;
	}
	 
	 function onlyPriceNumeric(value) {
		 var pattern=/^\d{0,8}(\.\d{1,2})?$/g;
			if(value!=""){
				return pattern.test(value);
		   }else{
		   	return false;
		   }
		   return false;
	}
	 
	function updatesaveTax() {
		var res = componentValidation();
		if(res==false){
			if(confirm("Are you sure you want to update tax structure ?")){
				$(".commonPriceType").each(function(){
					var id = $(this).attr('id');
					var innerIndex = id.split("_")[1];
					$("#priceTypeId_"+innerIndex).attr('disabled',false);
				});
				
				$('select[name=taxLabelName]').prop('disabled', false);
				 $('input[name="taxValueName"]').prop("readonly",false);
				 $('select[name=calculateType]').prop('disabled', false);
				 $('select[name=calculateOn]').prop('disabled', false);
				 
				  
				$("#updateTaxFormId").attr('method','GET');
				$("#updateTaxFormId").attr('action','updateTaxstructureDetails');
				$("#updateTaxFormId").submit(); 
				//alert("submitted");
				
				 
			}
		}
		 
	}
	
	function componentValidation(){
		var errorPresent=false;		
		if($("#BasePriceId_0").val().trim()==""){
			$("#BasePriceId_0").attr('style', "border-radius: 5px; border:#FF0000 1px solid;");
			$("#errorTaxValueName_0").show();
			$("#errorTaxValueName_0").text("Please Enter Base Price");
			errorPresent=true;
		}else if(!validateDecimalPoint($("#BasePriceId_0").val())){
			$("#BasePriceId_0").attr('style', "border-radius: 5px; border:#FF0000 1px solid;");
			$("#errorTaxValueName_0").show();
			$("#errorTaxValueName_0").text("please enter valid number upto "+${NO_OF_DECIMAL}+" decimal points");
			errorPresent=true;
		}else if(Number($("#BasePriceId_0").val())==0){
			$("#BasePriceId").attr('style', "border-radius: 5px; border:#FF0000 1px solid;");
			$("#errorTaxValueName_0").show();
			$("#errorTaxValueName_0").text("Please Enter More Than Zero");
		  }else{
			$("#errorTaxValueName_0").hide();
			$("#errorTaxValueName_0").text("");
			$("#BasePriceId_0").attr('style', "");
		}
		var results = [];
		$(".commonlabel").each(function(){
				var id = $(this).attr('id');
				var index = id.split("_")[1];
			    if($("#taxLabelId_"+index).val()===""){
					$("#taxLabelId_"+index).attr('style', "border-radius: 5px; border:#FF0000 1px solid;");
					$("#errorTaxLabelName_"+index).show();
					$("#errorTaxLabelName_"+index).text("Please Select Tax Label");
					errorPresent=true;
				}else{
					var unique = true;
					for (var i = 0; i < results.length; i++) {
					    if (results[i] == $("#taxLabelId_"+index).val()) {
					    	unique = false;
					    }
					} 
					if(unique=="true" || unique==true){
						$("#taxLabelId_"+index).attr('style', "");
						$("#errorTaxLabelName_"+index).hide();
						$("#errorTaxLabelName_"+index).text("");
					}else{
						$("#taxLabelId_"+index).attr('style', "border-radius: 5px; border:#FF0000 1px solid;");
						$("#errorTaxLabelName_"+index).show();
						$("#errorTaxLabelName_"+index).text("Please Select Unique Label");
						errorPresent=true;
					}
					
					if($("#calculateOnId_"+index).val()===""){
						$("#calculateOnId_"+index).attr('style', "border-radius: 5px; border:#FF0000 1px solid;");
						$("#errorCalculateOn_"+index).show();
						$("#errorCalculateOn_"+index).text("Please Select Calculation On");
						errorPresent=true;
					}else{
						
						var cal_on_vald = false;
						
						if($.inArray($("#calculateOnId_"+index).val(), results)!=-1 || $("#calculateOnId_"+index).val() == 'CAL01' || $("#calculateOnId_"+index).val() == 'CAL02'){
							cal_on_vald = true;
						}
						if(cal_on_vald=="true" || cal_on_vald==true){
							$("#calculateOnId_"+index).attr('style', "");
							$("#errorCalculateOn_"+index).hide();
							$("#errorCalculateOn_"+index).text("");
						}else{
							$("#calculateOnId_"+index).attr('style', "border-radius: 5px; border:#FF0000 1px solid;");
							$("#errorCalculateOn_"+index).show();
							$("#errorCalculateOn_"+index).text("Selected Calculation On not allowed");
							errorPresent=true;
						}
					}
					
					results.push($("#taxLabelId_"+index).val());
				}
			    
			    if($("#priceTypeId_"+index).val()===""){
					$("#priceTypeId_"+index).attr('style', "border-radius: 5px; border:#FF0000 1px solid;");
					$("#errorPriceType_"+index).show();
					$("#errorPriceType_"+index).text("Please Select Price Type");
					errorPresent=true;
				}else{
					$("#priceTypeId_"+index).attr('style', "");
					$("#errorPriceType_"+index).hide();
					$("#errorPriceType_"+index).text("");
				}
			    
			    if($("#taxValueId_"+index).val().trim()==""){
					$("#taxValueId_"+index).attr('style', "border-radius: 5px; border:#FF0000 1px solid;");
					$("#errorTaxValueName_"+index).show();
					$("#errorTaxValueName_"+index).text("Please Enter Tax value");
					errorPresent=true;
				}else if($("#priceTypeId_"+index).val()===""){
					$("#taxValueId_"+index).attr('style', "border-radius: 5px; border:#FF0000 1px solid;");
					$("#errorTaxValueName_"+index).show();
					$("#errorTaxValueName_"+index).text("Please Select Price Type First");
					errorPresent=true;
				}else if(!validateDecimalPoint(Number($("#taxValueId_"+index).val()))){
					$("#taxValueId_"+index).attr('style', "border-radius: 5px; border:#FF0000 1px solid;");
				    $("#errorTaxValueName_"+index).show();
					$("#errorTaxValueName_"+index).text("please enter valid number upto "+${NO_OF_DECIMAL}+" decimal points");
					errorPresent=true;
				}else if($("#priceTypeId_"+index).val()=='${PERCENTAGE}'){
					  if(Number($("#taxValueId_"+index).val())==0){
						  $("#taxValueId_"+index).attr('style', "border-radius: 5px; border:#FF0000 1px solid;");
						  $("#errorTaxValueName_"+index).show();
						  $("#errorTaxValueName_"+index).text("Tax percentage can't be Zero");
						  errorPresent=true;
					  }else if(Number($("#taxValueId_"+index).val())>100){
						  $("#taxValueId_"+index).attr('style', "border-radius: 5px; border:#FF0000 1px solid;");
						  $("#errorTaxValueName_"+index).show();
						  $("#errorTaxValueName_"+index).text("Tax percentage should be less then 100");
						  errorPresent=true;
					  }else{
						  $("#taxValueId_"+index).attr('style', "");
						  $("#errorTaxValueName_"+index).hide();
						  $("#errorTaxValueName_"+index).text("");
					  }
				}else{
					$("#errorTaxValueName_"+index).hide();
					$("#errorTaxValueName_"+index).text("");
					$("#taxValueId_"+index).attr('style', "");
				}
			    
			    
				
				if($("#calculateTypeId_"+index).val()===""){
					$("#calculateTypeId_"+index).attr('style', "border-radius: 5px; border:#FF0000 1px solid;");
					$("#errorCalculateType_"+index).show();
					$("#errorCalculateType_"+index).text("Please Select Calculation type");
					errorPresent=true;
				}else{
					$("#errorCalculateType_"+index).show();
					$("#errorCalculateType_"+index).text("");
					$("#calculateTypeId_"+index).attr('style', "");
				}
		});
		
		return errorPresent;
	}
	
	/* function populatePriceType(index){		
		var priceCompId = $("#taxLabelId_"+index).val().trim();
		PoMngController.getPriceTypeFromPriceCompId(priceCompId,function(priceType){
			$("#priceTypeId_"+index).val(priceType+1);		
		});
	}  */
	
	function submitValidation(){
		var resultErrorPresent = false; 
		var aucStatus = false;
		 <c:if test="${expiryDate eq true}">
		 alert("You cannot submit. Catalog is expired");
		 var resultErrorPresent = true;
		 </c:if>
		var inc_amount = $("#inc_amount").val();
		if(Number($("#diff_po_price").val()) > 0){
			if(Number($("#diff_po_price").val()) > Number($("#inc_amount").val())){
				$("#errorMaxPoIncrement").show();
				$("#errorMaxPoIncrement").text("Difference between Actual and Total PO price cannot be more than: "+inc_amount);
				resultErrorPresent = true;
			}else{
				$("#errorMaxPoIncrement").hide();
				$("#errorMaxPoIncrement").text("");
			}
		}
		
		 if($("#poType").val() ==1){
			/* if($("#tempErpReferenceNumId").val().trim()==""){
				$("#errorTempErpReferenceNumId").show();
				$("#errorTempErpReferenceNumId").text("Budget Code is required");
				resultErrorPresent = true;
			}else{
				$("#errorTempErpReferenceNumId").hide();
				$("#errorTempErpReferenceNumId").text("");
				/* var erp  = $("#tempErpReferenceNumId").val().trim();
				$("#erpReferenceNumIdds").val(erp); 
			} */
			
			/* $('.auc-code').each(function aucCode(){    			
   	   		 if ($(this).val()==''){
   	   			resultErrorPresent = true;
   	   			aucStatus = true;
   	   		  }
   	   	 	}); */
		}
		 
		if(aucStatus){
			$("#cost_auc_err").text("Auc Code is required for all capex po items");
			$("#cost_auc_err").show();
			
		}else{
			$("#cost_auc_err").hide();
			$("#cost_auc_err").text("");
		} 
		
		//alert("textttt------"+$("#PoType").val());
		//alert("-----"+$('#poFromId2  select[name=reqPoType] option:selected').val());
		
		if($('#poFromId2  select[name=reqPoType] option:selected').val().trim()=='3'
				|| $('#poFromId2  select[name=reqPoType] option:selected').val().trim()==3){
		
			//alert("workOrderId  purchaseOderId------"+$("#purchaseOderId").val());
			if($('input[name=purchaseOrderDoc]').is(':visible')){
				//alert("cmg");
				if($("#purchaseOderId").val().trim()==""){
					$("#errorpo_document_0").show();
					$("#errorpo_document_0").text("Please upload Work Order Document.");
					resultErrorPresent = true;
				}else{
					
					$("#errorpo_document_0").text("");
					$("#errorpo_document_0").hide();
				}
				
			}
			
			
			var poId = $("#po_id").val();
			PoMngController.getServiceItemListPrice(poId,{async:false,callback:function(data){
				//alert(data);
				for(i=0;i<data.length;i++){
					//alert(data[i].balancePrice);
					if(data[i].balancePrice!=0){
						resultErrorPresent = true;
						$("#main_itemPrice_error_0").show();
						$("#main_itemPrice_error_0").text("Sum of the subline item price should be equal to main item price of item"+" - "+data[i].itemName);
					
					}
					else{
						$("#main_itemPrice_error_0").hide();
					}
				}
				
			}});
			
			
/* 			
	if($("#serviceItems").val()==true || $("#serviceItems").val()=='true'){
				
				var error_status=false;
				$('.main-itemPrice').each(function(){
					var reqItemId=$(this).val();
					var mainItemPrice=parseFloat($("#"+reqItemId).val());
					var subItemPrice=parseFloat("0");
					console.log(reqItemId+'mainItemPrice-------1--------'+mainItemPrice);
					
					$('.main-itemPrice-'+reqItemId).each(function(){
						subItemPrice=subItemPrice+parseFloat($(this).val());
					});
					console.log(mainItemPrice+'mainItemPrice-----2----------'+subItemPrice);
		
				 	
					if(subItemPrice > mainItemPrice){
						error_status=true;
					} 
					
					else if(subItemPrice < mainItemPrice){
						 error_status=true;
					}
					
					if(error_status==true){
						resultErrorPresent = true;
						
						$("#main_itemPrice_error_0").show();
						$("#main_itemPrice_error_0").text("Sum of the subline item price should be less than or equal to main item price");
					}
				});
				
				
				
				
				
				
			} */
			
		}
		
		/* if($("#PoType").text().trim()=="Capital PO"){
			if($("#tempErpReferenceNumId").val().trim()==""){
				$("#errorTempErpReferenceNumId").show();
				$("#errorTempErpReferenceNumId").text("Asset Code is required");
				resultErrorPresent = true;
			}else{
				$("#errorTempErpReferenceNumId").hide();
				$("#errorTempErpReferenceNumId").text("");
				var erp  = $("#tempErpReferenceNumId").val().trim();
				$("#erpReferenceNumIdds").val(erp);
			}
		} */
		
		/* if(!Number($("#delQtyId").val())>0){
			$("#errorDelSchId").show();
			$("#errorDelSchId").text("Please add Atleast one Delivery schdule")
			resultErrorPresent = true;
		}else{
			$("#errorDelSchId").hide();
			$("#errorDelSchId").text("")
		} */
		
		if($("#deliveryAddress").val().trim()==""){
			$('#deliveryAddressError').show();
			resultErrorPresent = true;
		}else{
			$('#deliveryAddressError').hide();
		}
		
		 if($("#poType").val().trim()==""){
			$("#errorPoType").show();
			$("#errorPoType").text("Please select Po Type");
			resultErrorPresent = true;
		}else{
			$("#errorPoType").hide();
			$("#errorPoType").text("");
		}
		 
		if($("#paymentTerm").val().trim()==""){
				$("#errorPaymentTerm").show();
				$("#errorPaymentTerm").text("Please select Payment Terms");
				resultErrorPresent = true;
			}else{
				$("#errorPaymentTerm").hide();
				$("#errorPaymentTerm").text("");
		}
		
		if($("#billingAddress").val()==""){
			$('#billingAddressError').show();
			resultErrorPresent = true;
		}else{
			$('#billingAddressError').hide();
		}
		
		/* if($("#costingAccountDiv").text().trim()==""){
			$("#errorCostingCenter").show();
			$("#errorCostingCenter").text("Enter Costing address");
			resultErrorPresent = true;
		}else{
			$("#errorCostingCenter").hide();
			$("#errorCostingCenter").text("");
		} */
		
		if($("#deliveryTermsId").val()==""){	
			$("#errorDeliveryTermsId").show();
			$("#errorDeliveryTermsId").text("please enter delivery terms");
			resultErrorPresent = true;
		}else{
			$("#errorDeliveryTermsId").hide();
			$("#errorDeliveryTermsId").text("");
		}
		if(awardCientName=="NCC"){
			var termNCondDate = CKEDITOR.instances.termsNcondId.getData();
			if(termNCondDate==""){
				$("#errorTermsId").show();
				$("#errorTermsId").text("please enter terms and conditions");
				resultErrorPresent = true;
			}else{
				$("#errorTermsId").hide();
				$("#errorTermsId").text("");
			}
		}else{
			if($("#termsNcondId").val()==""){
				$("#errorTermsId").show();
				$("#errorTermsId").text("please enter terms and conditions");
				resultErrorPresent = true;
			}else{
				$("#errorTermsId").hide();
				$("#errorTermsId").text("");
			}
		}
		
		
		
		if($("#businessPlace").val()==""){
			$("#errorBusinessPlace").show();
			$("#errorBusinessPlace").text("please enter business place");
			resultErrorPresent = true;
		}else{
			$("#errorBusinessPlace").hide();
			$("#errorBusinessPlace").text("");
		}
		
		if($("#sectionCode").val()==""){
			$("#errorSectionCode").show();
			$("#errorSectionCode").text("please enter section code");
			resultErrorPresent = true;
		}else{
			$("#errorSectionCode").hide();
			$("#errorSectionCode").text("");
		} 
		
		if($('#purchase_center').is(':visible')){
			
			if($("#purchase_center").val()==""){
				$("#purchase_center_error").show();
				$("#purchase_center_error").text("please select purchase center");
				resultErrorPresent = true;
			}else{
				$("#purchase_center_error").hide();
				$("#purchase_center_error").text("");
			} 
			
		}
		
		
		//alert('1------------'+resultErrorPresent);
		
		if(!resultErrorPresent && awardCientName=="NCC"){
			
			var hsn_error_status=false;
			var poId = $("#po_id").val();
			PoMngController.getVerifieAllItemHsnPercentage(poId,{async:false,callback:function(data_map){
					if(data_map!=null){
					//alert("need to update percentage ");
						var keys=Object.keys(data_map);
						if(keys.length>0){	
							for(var key in data_map){
								if(data_map[key]){
									hsn_error_status = true;
								}
							}
						}
						
					}
				
			}});
			
			
			//alert('hsn_error_status------------'+hsn_error_status);
			$("#error_item_tax_hsn_percentage").text("");
			$("#error_item_tax_hsn_percentage").hide();
			if(hsn_error_status){
			//	alert('resultErrorPresent------------'+resultErrorPresent);
				$("#error_item_tax_hsn_percentage").show();
				$("#error_item_tax_hsn_percentage").text("One of the HSN master is updated with revised tax percentage for these PO item(s), please update Item Tax breakup.");
				resultErrorPresent = true;
			}
		}
		
		
		return resultErrorPresent;
	}
	
	$('#submitPurchaseOrder').click(function(){
		$('#qty_error_for_date_address').hide();
		var poId = $("#po_id").val();
		var status = true;
		<c:if test="${conversion eq false}">
	   		alert("You cannot submit.Multi currency conversion value does not exist");
	  	 status=false;
	  	 return false;
	 	</c:if>
	 	<c:if test="${ADHOC_WORKFLOW eq true}">
		if($("#groupId").val() == ""){
			 $('#errorGroup').show();
	 		
			status = false;
			
		}else{
	 		  $('#errorGroup').hide();
	 		
	 	   } 
		</c:if>
	 	
	
	 	
	 	
	 	 if(status){
		PoMngController.getPoStatus(poId,{async:false,callback:function(data){
			 if(data != 0){
				    var result = submitValidation();
				    var deliveryStatus=false;
				    var awardCientName=$('#awardClientNames').val();
				    var forNcc=false;
				    var forNonNcc=false;
				    if(awardCientName=="NCC"){ 
						forNcc= deliveryScheduleValidationForNCC();
						if(forNcc==false){
				    	 deliveryStatus= deliveryScheduleValidation();
						}
				    }else if(awardCientName!="NCC" ){
				    	forNonNcc=deliveryScheduleValidationForNonNCC();
				    	if(forNonNcc==false){
				    	deliveryStatus= deliveryScheduleValidation();
				    	}
				    }
					 
					var quantity_exceed_error = false;
					var quantity_exceed_error1 = false;
					var quantity_exceed_error2 = false;
					var allowValidation=true;
					//alert("ncc:"+forNcc+" nonncc"+forNonNcc);
					if(awardCientName=="NCC" && forNcc==true){
						allowValidation=false;
					}else if(awardCientName!="NCC" && forNonNcc==true){
						allowValidation=false;
					}
					//alert("allowValida"+allowValidation);
					if(allowValidation==true){
						var map = new Map();
						//check quantity match with item's quantity
						if(master_item_list.length>0){
								var TableData = []; 
								var deliveryDate=[];
								  var data="";
								  var delData="";
								  var i=0;
									 $("table#deliveryScheduleTableID > tbody > tr").each(function(row, tr) {
								     TableData[row]={
								    	"itemName": $('td:eq(0) option:selected',this).text(),
								        "itemQty": $('td:eq(2) input',this).val()
								 };
								     deliveryDate[row]={
								    		 "itemName": $('td:eq(0) option:selected',this).text(),
								    		 	"itemDate":$('td:eq(1) input',this).val()
								     };
								     i=i+1;
								  data=JSON.stringify(TableData);
								  delData=JSON.stringify(deliveryDate);
								  });
									 var data1 = $.parseJSON(data);
									 var data1new = $.parseJSON(delData);
									 var newmap = new Map();
									 $.each(data1, function(key,value) {
										 if(map.has(value.itemName)){
											   map.set(value.itemName,map.get(value.itemName)+parseFloat(value.itemQty,10));
										   }else{
											   map.set(value.itemName,0+parseFloat(value.itemQty,10));
										   }
										});
									 /* let text = "";
									 newmap.forEach (function(value, key) {
										  text += key + ' = ' + value;
										}) */
									 var count1=0;
										var now = new Date().setHours(0, 0, 0, 0);
										$.each(data1new, function(key,value) {
											if(value.itemDate!=""){
											 if(newmap.has(value.itemName)){
												 var date = value.itemDate.substring(0, 2);
												   var month = value.itemDate.substring(3, 5);
												   var year = value.itemDate.substring(6, 10);
												   var dateToCompare = new Date(year, month - 1, date).setHours(0, 0, 0, 0);
											       var dt1 = now,
											       dt2 = dateToCompare;
											       console.log("dt1"+dt1+" dt2"+dt2);
											       if (dt2 < dt1) {
												 	newmap.set(value.itemName,newmap.get(value.itemName)+1);
												 }
											   }else{
												   var date = value.itemDate.substring(0, 2);
												   var month = value.itemDate.substring(3, 5);
												   var year = value.itemDate.substring(6, 10);
												   var dateToCompare = new Date(year, month - 1, date).setHours(0, 0, 0, 0);
											       var dt1 = now,
											       dt2 = dateToCompare;
											       console.log("dt1"+dt1+" dt2"+dt2);
											       if (dt2 < dt1) {
													   count1=count1+1;
												   }
												   newmap.set(value.itemName,count1);
											   }
											}
											});
						}
						var count =0;
						var errorMessage="";
						var dateCounter=0;
						var dateErrorMessage="";
						if(awardCientName=="NCC"){
						for(i=0 ; i < master_item_list.length ; i++){
								var item = master_item_list[i];
								var qty = item.itemQuantity;
								var qty1 = 0;
								var itemId = item.itemName+"-"+item.reqItemId;
								var datetemp = newmap.get(itemId);
								var temp= map.get(itemId).toFixed(2);
								var qtyTemp = parseFloat(qty).toFixed(2);
								if(!(qtyTemp==temp)){
											count=count+1;
											errorMessage=errorMessage+", "+itemId;
									}
								if(datetemp>0){
									dateCounter=dateCounter+1;
									dateErrorMessage=dateErrorMessage+", "+itemId;
								}
								}
						}else{
							var list= master_item_list.length;
							var mapSize = map.size;
							
							if(Number(list)>Number(mapSize)){
								
								quantity_exceed_error2=true;
								 $('#quantity_exceed_error2').text("Please enter delivery schedule for all items");
								$('#quantity_exceed_error2').show();
								 
							} else {
								$('#quantity_exceed_error2').hide();
								for(i=0 ; i < master_item_list.length ; i++){
									var item = master_item_list[i];
									var qty = item.itemQuantity;
									var qty1 = 0;
									var itemId = item.itemName+"-"+item.reqItemId;
									var datetemp = newmap.get(itemId);
									var temp= map.get(itemId).toFixed(2);
									var qtyTemp = parseFloat(qty).toFixed(2);
									if(!(qtyTemp==temp)){
												count=count+1;
												errorMessage=errorMessage+", "+itemId;
										}
									if(datetemp>0){
										dateCounter=dateCounter+1;
										dateErrorMessage=dateErrorMessage+", "+itemId;
									}
									}
							} 
						}
						var date_exceed_error =false;
						if(count>0){
							quantity_exceed_error = true;
							$('#quantity_exceed_error').text("Please give correct quantity for item"+errorMessage);
							$('#quantity_exceed_error').show();
						}else{
							$('#quantity_exceed_error').hide();
						}
						if(dateCounter>0){
							date_exceed_error=true;
							$('#date_exceed_error').text("Please give valid date for item"+dateErrorMessage);
							$('#date_exceed_error').show();
						}else{
							$('#date_exceed_error').hide();
						}
					}
					if(awardCientName=="NCC" && forNcc==true){
						quantity_exceed_error1=true;
						 $('#quantity_exceed_error1').text("Please enter delivery schedule for all items");
						$('#quantity_exceed_error1').show();
					}else {
						$('#quantity_exceed_error1').hide();
					} 
					if(!quantity_exceed_error && !deliveryStatus && !quantity_exceed_error1 && !quantity_exceed_error2 && !result && !date_exceed_error){
						
							$("#cancelComment").val("");
		    				$("#cancelComment_count").text("0");
		    				$("#errorCancelComment").hide();
		    				$('#CancelReqPopup').modal({backdrop: "static"});
		    				$('#CancelReqPopup').modal('show');
					}
			 }else{
				 alert("Po has been already submitted Please click on back button");
			 }
			 
				
			 
		}});
	}//status close
	});
	
	$('#draftPurchaseOrder').click(function(){
		var poId = $("#po_id").val();
		PoMngController.getPoStatus(poId,{async:false,callback:function(data){
			 if(data == 11 || data == 14){
						var error = false;
						var deliveryStatus=false;
					    var awardCientName=$('#awardClientNames').val();
					    var forNcc=false;
					    var forNonNcc=false;
					    if(awardCientName=="NCC"){ 
							forNcc= deliveryScheduleValidationForNCC();
							if(forNcc==false){
					    	 deliveryStatus= deliveryScheduleValidation();
							}
					    }else if(awardCientName!="NCC" ){
					    	forNonNcc=deliveryScheduleValidationForNonNCC();
					    	if(forNonNcc==false){
					    	deliveryStatus= deliveryScheduleValidation();
					    	}
					    }
					    
					    var resultErrorPresent = false;
					    PoMngController.getServiceItemListPrice(poId,{async:false,callback:function(data){
							//alert(data);
							for(i=0;i<data.length;i++){
								//alert(data[i].balancePrice);
								if(data[i].balancePrice!=0){
									resultErrorPresent = true;
									$("#main_itemPrice_error_0").show();
									$("#main_itemPrice_error_0").text("Sum of the subline item price should be equal to main item price of item"+" - "+data[i].itemName);
								
								}
								else{
									$("#main_itemPrice_error_0").hide();
								}
							}
							
						}});
					    
					    
						var quantity_exceed_error = false;
						var quantity_exceed_error1 = false;
						var allowValidation=true;
						//alert("ncc:"+forNcc+" nonncc"+forNonNcc);
						if(awardCientName=="NCC" && forNcc==true){
							allowValidation=false;
						}else if(awardCientName!="NCC" && forNonNcc==true){
							allowValidation=false;
						}
						//alert("allowValida"+allowValidation);
						if(allowValidation==true){
							var map = new Map();
							//check quantity match with item's quantity
							if(master_item_list.length>0){
									var TableData = []; 
									var deliveryDate=[];
									  var data="";
									  var delData="";
									  var i=0;
										 $("table#deliveryScheduleTableID > tbody > tr").each(function(row, tr) {
									     TableData[row]={
									    	"itemName": $('td:eq(0) option:selected',this).text(),
									        "itemQty": $('td:eq(2) input',this).val()
									 };
									     deliveryDate[row]={
									    		 "itemName": $('td:eq(0) option:selected',this).text(),
									    		 	"itemDate":$('td:eq(1) input',this).val()
									     };
									     i=i+1;
									  data=JSON.stringify(TableData);
									  delData=JSON.stringify(deliveryDate);
									  });
										 var data1 = $.parseJSON(data);
										 var data1new = $.parseJSON(delData);
										 var newmap = new Map();
										 $.each(data1, function(key,value) {
											 if(map.has(value.itemName)){
												   map.set(value.itemName,map.get(value.itemName)+parseFloat(value.itemQty,10));
											   }else{
												   map.set(value.itemName,0+parseFloat(value.itemQty,10));
											   }
											});
										 /* let text = "";
										 newmap.forEach (function(value, key) {
											  text += key + ' = ' + value;
											}) */
										 var count1=0;
											var now = new Date().setHours(0, 0, 0, 0);
											$.each(data1new, function(key,value) {
												if(value.itemDate!=""){
												 if(newmap.has(value.itemName)){
													 var date = value.itemDate.substring(0, 2);
													   var month = value.itemDate.substring(3, 5);
													   var year = value.itemDate.substring(6, 10);
													   var dateToCompare = new Date(year, month - 1, date).setHours(0, 0, 0, 0);
												       var dt1 = now,
												       dt2 = dateToCompare;
												       console.log("dt1"+dt1+" dt2"+dt2);
												       if (dt2 < dt1) {
													 	newmap.set(value.itemName,newmap.get(value.itemName)+1);
													 }
												   }else{
													   var date = value.itemDate.substring(0, 2);
													   var month = value.itemDate.substring(3, 5);
													   var year = value.itemDate.substring(6, 10);
													   var dateToCompare = new Date(year, month - 1, date).setHours(0, 0, 0, 0);
												       var dt1 = now,
												       dt2 = dateToCompare;
												       console.log("dt1"+dt1+" dt2"+dt2);
												       if (dt2 < dt1) {
														   count1=count1+1;
													   }
													   newmap.set(value.itemName,count1);
												   }
												}
												});
							}
							var count =0;
							var errorMessage="";
							var dateCounter=0;
							var dateErrorMessage="";
							for(i=0 ; i < master_item_list.length ; i++){
									var item = master_item_list[i];
									var qty = item.itemQuantity;
									var qty1 = 0;
									var itemId = item.itemName+"-"+item.reqItemId;
									var datetemp = newmap.get(itemId);
									var temp= map.get(itemId).toFixed(2);
									var qtyTemp = parseFloat(qty).toFixed(2);
									if(!(qtyTemp==temp)){
												count=count+1;
												errorMessage=errorMessage+", "+itemId;
										}
									if(datetemp>0){
										dateCounter=dateCounter+1;
										dateErrorMessage=dateErrorMessage+", "+itemId;
									}
									}
							var date_exceed_error =false;
							if(count>0){
								quantity_exceed_error = true;
								$('#quantity_exceed_error').text("Please give correct quantity for item"+errorMessage);
								$('#quantity_exceed_error').show();
							}else{
								$('#quantity_exceed_error').hide();
							}
							if(dateCounter>0){
								date_exceed_error=true;
								$('#date_exceed_error').text("Please give valid date for item"+dateErrorMessage);
								$('#date_exceed_error').show();
							}else{
								$('#date_exceed_error').hide();
							}
						}
						if(awardCientName=="NCC" && forNcc==true){
							quantity_exceed_error1=true;
							 $('#quantity_exceed_error1').text("Please enter delivery schedule for all items");
							$('#quantity_exceed_error1').show();
						}else {
							$('#quantity_exceed_error1').hide();
						}	
						if(!quantity_exceed_error &&  !deliveryStatus && !quantity_exceed_error1 && !resultErrorPresent && confirm("Are you sure, you want to draft ?")){
							$("#purchaseSubmitStatusId").val(11);
							$('#paymentTerm').prop('disabled', false);
							/* var erp  = $("#tempErpReferenceNumId").val().trim();
							$("#erpReferenceNumIdds").val(erp); */
								$('#poFromId2').attr("method","POST");
					        	$('#poFromId2').attr("action","submitPurchaseRaisedPO");
					        	$('#poFromId2').submit();
						}
			 }else{
				 alert("Po status has been changed please click on back button");
			 }
		}});
	});
	
	$('#supplierApproval').click(function(){
		var poId = $("#po_id").val();
		PoMngController.getPoStatus(poId,{async:false,callback:function(data){
			 if(data != 0){
				var result = submitValidation();
				var deliveryStatus = deliveryScheduleValidation();
				
				if( !deliveryStatus){
					if(confirm("Are you sure to send for supplier approval ?")){
							$("#purchaseSubmitStatusId").val(12);
							$('#paymentTerm').prop('disabled', false);
							/* var erp  = $("#tempErpReferenceNumId").val().trim();
							$("#erpReferenceNumIdds").val(erp); */
							$('#poFromId2').attr("method","POST");
				        	$('#poFromId2').attr("action","submitPurchaseRaisedPO");
				        	$('#poFromId2').submit();
					}
				}
			 }else{
				 alert("Po has been already submitted Please click on back button");
			 }
		}});
	});
	
	function changeItemName(thiss){
    	var itemId = $(thiss).val();
    	var selected = $(thiss).find('option:selected');
    	var poItemId = selected.attr('data-poItemId');
    	var id = thiss.id;
    	var fields = id.split('_');
    	var index = fields[1];
    	//$("#quantity_"+index).match("^quanity_").removeClass();
    	//$("#quantity_"+index).addClass("quanity_"+itemId);
    	//adv-reg-popup-textbox1 tbl-responsive-quantity quantity quanity_IT-8b2685-02-02-2018-02
    	$("#quantity_"+index).attr( "class", "adv-reg-popup-textbox1 tbl-responsive-quantity quantity" );
    	$("#quantity_"+index).addClass("quanity_"+itemId);
    	$("#poItemId_"+index).val(poItemId);
    	
    	$("#project_address_"+index).addClass("weare_"+poItemId);
    	$('#deliverydate_'+index).addClass('date_'+poItemId);
   	}
	
	
	
	
	
	
	function getDownloadDoc(poId,docName,docType){
		$("#po_id").val(poId);
		$("#doc_name").val(docName);
		$("#doc_type").val(docType);
		window.location.hash = null;
		$("#docDownloadForm").attr('method','GET');
		$("#docDownloadForm").attr('action','getDownloadDoc');
		$("#docDownloadForm").submit(); 
	}
	
	function getSourcingExeedDocDownload(docId,docName){
		$("#exceedDocId").val(docId);
		$("#exceedDocName").val(docName);
		window.location.hash = null;
		$("#sourcingExceedDocDownloadForm").attr('method','GET');
		$("#sourcingExceedDocDownloadForm").attr('action','getSourcingExeedDocDownload');
		$("#sourcingExceedDocDownloadForm").submit(); 
	}

	$('#deliveryAddressSelect').click(function(){		
		if($('.address').is(":checked")){			
			//$('#deliveryAddressDiv').html($('input[name="radio_address"]:checked').val());
			var da = $('input[name="radio_address"]:checked').val();
			$('#deliveryAddress').val("");
			if(da!='manual'){
				$('#deliveryAddress').val(da);
				
				var deliveryAddress_Id=	$('input[name="radio_address"]:checked').attr('address-id');
				$('#deliveryAddress_Id').val(deliveryAddress_Id);
			}
			//$('#deliveryAddressId').hide();
			//$('#deliveryAddressId2').val("");
			//set default billing address
			var stateId=$('#stateIdDelivery').val();
			var comp_code = $('#companyIdDelivery').val();
			
			PoMngController.getBillingAddressss(stateId,comp_code,$("#logged_user_client_id").val(),{async:false,callback:function(data_list){
			 if(data_list!=null){
					if(data_list.length>0){
						$('#billingAddressDiv').html(data_list[0].address);
						$('#billingAddress').val(data_list[0].addressId);
					}else{
						$('#billingAddressDiv').html("");
						$('#billingAddress').val("");
					}
			 }else{
				 $('#billingAddressDiv').html("");
					$('#billingAddress').val("");
			 }
			}});
			
			$('#deliveryAddress').prop("readonly",false);
			$('#listAddressModal').modal('toggle');
			//$(this).parent('div').removeClass('modal-backdrop fade in');
		}else{
			$('#deliveryAddress').val("");
			$('#billingAddressDiv').html("");
			$('#billingAddress').val("");
			alert("Please select delivery address");
		}
		
	}); 
	$('#supplierAddressSelect').click(function(){
		
		if($('.address').is(":checked")){
			var idexx = $('input[name="radio_supplier"]:checked').attr('index');
			var companyName = $('#radio_companyName'+idexx).val();
			var gstNo = $('#radio_gstNo'+idexx).val();
			var mobile = $('#radio_mobile'+idexx).val();
			var address = $('#radio_address_name'+idexx).val();
			var content = ''+companyName+'<br>'+address+'<br>'+mobile+'<br>'+gstNo+'';
			$('#supplierAddressDiv').html(content);
			$('#supplierAddressId').val($('input[name="radio_supplier"]:checked').val());
			$('#supplierAddressStateId').val($('#radio_state_id'+idexx).val());
			if($('#distributors').is(':visible')){
				$('#companyId').val($('#distributors').val());
			}
			$('#supplierAddressModal').modal('toggle');
			//$(this).parent('div').removeClass('modal-backdrop fade in');
		}else{
			alert("Please select supplier address");
		}
		
	});

	$('#billingAddressSelect').click(function(){
		if($('.address').is(":checked")){
			$('#billingAddressDiv').html($('input[name="radio_billing"]:checked').val());
			var address_id = $('input[name="radio_billing"]:checked').data('address_id');
			$('#billingAddress').val(address_id);
			$('#listBillingAddressModal').modal('toggle');
		}else{
			$('#billingAddressDiv').html("");
			$('#billingAddress').val("");
			alert("Please select billing address");
		}
		
	}); 
	function showDelUpload(){
		$("#poDeliveryDocOne").hide();
		$("#showDeliveryDocOne").show();
	}
	function showPOMainUploadDoc(){
		$("#poMainDocOne").hide();
		$("#showpoMainDocOne").show();
	}
	function showTermUpload(){
		$("#poTermDocOne").hide();
		$("#showpoTermDocOne").show();
	}
	
	
	function textCount(divId){
		
	    var text_length = $('#'+divId).val().length;
	    //var text_remaining = 2000 - text_length;
	    $('#'+divId+'_count').html(text_length);
		
	}
	
	function showListBillingAddressModal(){
		$('#stateIdBilling').val("");
		$('#radio-billing').html("");
		$('#listBillingAddressModal').modal('show');
		$('#radio-billing').html("Select state to proceed !");
	}

	
	function showListAddressModal(){
		$('#stateIdDelivery').val("");
		$('#radio-delivery').html("");
		$('#listAddressModal').modal('show');
		$('#radio-delivery').html("Select state to proceed !");
	}
	
	function showSupplierAddressModal(){
		$('#supplierState').val("");
		$('#radio-supplier').html("");
		
		
		
		
		$('#supplierAddressModal').modal('show');
		$('#radio-supplier').html("Select state to proceed !");
	}
	
	
	
	function setDeliveryAddress(){
		var stateId=$('#stateIdDelivery').val();
		$('#radio-delivery').html("");
		$('.address').remove();
		//var comp_code = $('#companyCode').val();
		//PoMngController.getDeliveryAddress(stateId,function(data_map){
			PoMngController.getDeliveryAddressDetails(stateId,$("#logged_user_client_id").val(),function(data_map){
	    		 if(data_map!=null){
	    				var keys=Object.keys(data_map);
	    				if(keys.length>0){
	    					var content="";
	    					var index1=0;
	    					for(var key in data_map){
	    						index1++;
	    						content+='<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 no-padding border-req-address">'
		                        + '<input type="radio" checked class="address" name="radio_address" id="radio-address'+index1+'" address-id="'+key+'" value="'+data_map[key].address+'" />'
		                        + '<label for="radio-address'+index1+'" class="adv-reg-comp-dtls-lbl modal-address-margin">'+data_map[key].address_name+' </label>'
	                    		+ '</div>';
	    					}
	    					//bellow code to add manual as option
	    					index1++;
							content+='<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 no-padding border-req-address">'
	                        + '<input type="radio" checked class="address" name="radio_address" id="radio-address'+index1+'" value="manual" />'
	                        + '<label for="radio-address'+index1+'" class="adv-reg-comp-dtls-lbl modal-address-margin">Enter Manually</label>'
	                		+ '</div>';
	    					$('#radio-delivery').append(content);
	    				}else{    				
	    					var content='<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 no-padding border-req-address">'
	                        + '<input type="radio" checked class="address" name="radio_address" id="radio-address1" value="manual" />'
	                        + '<label for="radio-address1" class="adv-reg-comp-dtls-lbl modal-address-margin">Enter Manually</label>'
	                		+ '</div>';
	                		$('#radio-delivery').append(content);        				
	        			}
	    			}else{
	    				$('#radio-delivery').html("No delivery address found !");
	    			}
		});
	}	

	
	function setSuppliersStates(){
		
		if($("#distributors").val()!='' && $("#distributors").val()!=null){
			
			PoMngController.getAllDistributorStatesCompanyId($("#distributors").val(),{async:false,callback:function(data_map){	
				if(data_map!=null){
					//alert("1");
					$("#supplierStateId").empty();
    				var keys=Object.keys(data_map);
    				if(keys.length>0){
    					//alert("2");
    					$("#supplierStateId").append("<option value=''>Select</option>");
    					for(var key in data_map){
    						//alert("key"+key);
    						$("#supplierStateId").append("<option value='" +key + "'>" +data_map[key]+ "</option>");
    					}
    				}
				}
			
			}});
			
		}else{
			alert("Please select Distributor");
		}
	}
	
	function setSupplierAddress(){
		var stateId=$('#supplierStateId').val();
		var companyId=$('#companyId').val();
		var error_satus=false;
		if($('#distributors').is(':visible')){
			companyId=$('#distributors').val();
			if($('#distributors').val()==null || $('#distributors').val()==''){
				error_satus=true;
			}
			
		}
	
		if(!error_satus){
			
		$('#radio-supplier').html("");
		PoMngController.getSupplierAddress(stateId,companyId,function(data_map){
	    		 if(data_map!=null){
	    				var keys=Object.keys(data_map);
	    				if(keys.length>0){
	    					var content3="";
	    					var index3=0;
	    					for(var key in data_map){
	    						index3++;
	    						content3+='<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 no-padding border-req-address">'
	    							+ '<input type="radio" checked class="address" name="radio_supplier" id="radio-supplier'+index3+'" index="'+index3+'" value="'+data_map[key].addressId+'" />'
	    							+ '<label for="radio-supplier'+index3+'" class="adv-reg-comp-dtls-lbl modal-address-margin">'+data_map[key].address_name+' </label>'
	    							+ '<input type="hidden" id="radio_state_id'+index3+'" value="'+data_map[key].stateId+'"/>'
	    							+ '<input type="hidden" id="radio_address_name'+index3+'" value="'+data_map[key].address_name+'"/>'
	    							+ '<input type="hidden" id="radio_companyName'+index3+'" value="'+data_map[key].companyName+'"/>'
	    							+ '<input type="hidden" id="radio_mobile'+index3+'" value="'+data_map[key].mobile+'"/>'
	    							+ '<input type="hidden" id="radio_gstNo'+index3+'" value="'+data_map[key].gstNo+'"/>'
	    							+ '</div>';
	    					}
	    					$('#radio-supplier').append(content3);
	    				}
	    			}else{
	    				$('#radio-supplier').html("No Supplier address found !");
	    			}
		});
		
		}else{
			alert("Please select Distributor");
		}
	}

	function setBillingAddress(){
		var stateId=$('#stateIdBilling').val();
		$('#radio-billing').html("");
		$('.address').remove();
		var comp_code = $('#companyIdBilling').val();	
		PoMngController.getBillingAddressss(stateId,comp_code,$("#logged_user_client_id").val(),function(data_list){			
			 if(data_list!=null){
				
					if(data_list.length>0){
						var content2="";
						var index2=0;
						for(i=0;i<data_list.length;i++){
							var data = data_list[i];
							index2++;
							content2+= '<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 no-padding border-req-address">'
							+ '<input type="radio" checked class="address" name="radio_billing" id="radio-billing'+index2+'" value="'+data.address+'" data-address_id="'+data.addressId+'" />'
							+ '<label for="radio-billing'+index2+'" class="adv-reg-comp-dtls-lbl modal-address-margin">'+data.address_name+' </label>'
							+ '</div>';
						}
						$('#radio-billing').append(content2);
					}
				}else{
					$('#radio-billing').html("No billing address found !");
				}
		});
		
	}
	
	function getRequisitionModal(reqId){
		 $('#requisitionDetailsModal').modal('show');
	}
	
	/* function getsupplierAwardInfoModal(){
		 $('#supplierAwardInfoModal').modal('show');
	} */
	
	function getsupplierAwardInfoModal(supplierId,awardSupplierId,awardDetailsId){
		var url=contextPath+"/getSupplierAwardInfo";
		var supplierId = supplierId;
		var sourcingReqId =  sourcingReqId;
		var awardSupplierId = awardSupplierId;
		var awardDetailsId = awardDetailsId;
		supplierAwardWindow = window.open(url+"?supplierId="+supplierId+"&awardSupplierId="+awardSupplierId+"&awardDetailsId="+awardDetailsId+"","4","location=0,status=0,scrollbars=1,width=1000,height=750,resizable=no");
		supplierAwardWindow.focus();
	 }

	

	function isDate(txtDate,index)
    {
	   var currVal = txtDate;
	   if(currVal == ''){
		    return false;
	   }

	   //Declare Regex 
	   var rxDatePattern = /^(\d{1,2})(-)(\d{1,2})(-)(\d{4})$/;
	   var dtArray = currVal.match(rxDatePattern); // is format OK?
	  
	   if (dtArray == null){
		     return false;
	   }
	
	   //Checks for mm/dd/yyyy format.
	   dtDay = dtArray[1];
	   dtMonth= dtArray[3];
	   dtYear = dtArray[5];
	
		if (dtMonth < 1 || dtMonth > 12){
		      return false;
		}else if (dtDay < 1 || dtDay> 31){
		      return false;
		}else if ((dtMonth==4 || dtMonth==6 || dtMonth==9 || dtMonth==11) && dtDay ==31){
		      return false;
		}else if (dtMonth == 2){
		     var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
		     if (dtDay> 29 || (dtDay ==29 && !isleap)){
			          return false;
		     }
	    }
		  return true;
	
		}
	
	function convertToDate(stringDate){
		var dat=new Date();
		var yesterday = new Date(dat);
		yesterday.setDate(dat.getDate() - 1); 
		dat.setHours(0, 0, 0, 0);
		var issueDate =stringDate.split('-');	
		var newIssueDate=issueDate[2]+"/"+issueDate[1]+"/"+issueDate[0];	
		 if (!/Invalid|NaN/.test(new Date(newIssueDate))) {
			 if(new Date(newIssueDate)>yesterday){
				 return false;
			 }else{
				 return true;
			 }
		 }else{
			 return null;
		 }
	}
	
	function getDownloadRequisitionDoc(requisitionDocId,requisitionDocName,requisitionId,docType){
       	$("#doc_Id").val(requisitionDocId);
       	$("#doc_Name").val(requisitionDocName);
       	$("#requisition_Id").val(requisitionId);
       	$("#docType").val(docType);
       	window.location.hash = null;
       	$("#requisitionDocDownloadForm").attr('method','GET');
       	$("#requisitionDocDownloadForm").attr('action','getDownloadRequisitionDoc');
       	$("#requisitionDocDownloadForm").submit(); 
	}
	
	$(".add-line-item-row").on('click', function() {
		//function addLineItem(itemName){
			
    	item_index++;
        var content = 
        	 '<tr class="adv-reg-comp-dtls-lbl secondRow-DS delivery_schedule" count="'+item_index+'">'
        		+ '<input type="hidden" name="deliveryScheduleId" id="deliveryScheduleId_'+item_index+'" value="">'
        		+ '<input type="hidden" name="poItemId" id="poItemId_'+item_index+'" value="">'
        		+ '<td class="tdr-purchase-1 no-word-break" style="width: 140px;">'
        		//+ '<input type="text" id="itemName_'+item_index+'" name="deliveryItemId" class="adv-reg-popup-textbox1 basic-reg-comp-dtls-txt" value="'+itemName+'">'
        		+ '<select class="basic-reg-comp-dtls-txt tbl-responsive-dropdown choosenBox itemName"  onchange="changeItemName(this);" id="itemName_'+item_index+'" name="deliveryItemId"></select>'
        		+ '</td>'
        		+ '<td class=" no-word-break text-center" style="width: 140px;"><input id="deliverydate_'+item_index+'"  name="deliveryDate" autocomplete="off"  class="datetimepicker basic-reg-comp-dtls-txt deliverydate" placeholder="Select Date"></td>'
        		+ '<td class=" no-word-break text-center" style="width: 100px;"><input type="text" maxlength="8"  class="adv-reg-popup-textbox1 tbl-responsive-quantity quantity" id="quantity_'+item_index+'" name="deliveryQty"></td>'
        		+ '<td class=" no-word-break text-center"><input type="text"  class="adv-reg-popup-textbox1 tbl-responsive-quantity deliverydetails" id="deliverydetails_'+item_index+'" name="deliveryDesc"></td>' ;
        		if(awardCientName=="NCC")	{
        			content=content+ '<td class="tdr-purchase-1 no-word-break" style="width: 180px;">'
        		//+ '<input type="text" id="itemName_'+item_index+'" name="deliveryItemId" class="adv-reg-popup-textbox1 basic-reg-comp-dtls-txt" value="'+itemName+'">'
        		+ '<select class="basic-reg-comp-dtls-txt tbl-responsive-dropdown choosenBox poItemId"  id="project_address_'+item_index+'" name="deliveryWarehouse"></select>'
        		+ '</td>';
		}
        		content=content	+ '<td class=" no-word-break valign "><img src="contract-images/deleteSmall.png" class="del-img-margin" onclick="removetblrow(this)" alt="Delete" title="Delete"></td></tr>';
       $('.deliveryTable').find('tr:last').after(content);
        $('.deliverydate').datetimepicker({
	    	format:'d-m-Y',
	    	timepicker:false,
	    	scrollMonth : false,
	    	scrollInput : false,
	    	minDate: new Date()
	    });
        $('.choosenBox').chosen();
        $('.chosen-single').css("height","35px");
        $('.chosen-container').css("width","140px");
        $('.chosen-drop').css("z-index","1999");
    	$('.chosen-container').css("position","absolute");
    	var item_name_id = 'itemName_'+item_index;
    	populateJQueryChosenSelectBoxForItem(item_name_id, master_item_list);
    	//populateJQueryChosenSelectBoxForItemForEdit(item_name_id, master_item_list,'Select',item);
    	var project_address = 'project_address_'+item_index;
    	populateJQueryChosenSelectBoxForIteWarehouse(project_address, warehouse);
    	
    });
   	
    function removetblrow(id) {
        $(id).closest('tr').remove();
	}
    
   function changePoType() {
	   $("#purchaseSubmitStatusId").val(11);
		$('#paymentTerm').prop('disabled', false);
		/* var erp  = $("#tempErpReferenceNumId").val().trim();
		$("#erpReferenceNumIdds").val(erp); */
		$('#poFromId2').attr("method","POST");
       	$('#poFromId2').attr("action","submitPurchaseRaisedPO");
       	$('#poFromId2').submit();
        
	}
   
   function changePaymentTerm() {
	   var paymentTerm = $("#paymentTerm").val();
	   PoMngController.getAdvancePerFromPaymentTerm(paymentTerm,function(data){ 
	   		$("#advancePercent").val(data);
	   });
	}
    
    function populateJQueryChosenSelectBoxForItem(select_box_id, data_list, select_box_header){
    	if($("#"+select_box_id)!=null && $("#"+select_box_id) != undefined){
    		$("#"+select_box_id).empty();
    		
    		if(select_box_header==undefined){
    			$("#"+select_box_id).append("<option value=''>Select</option>");
    		}else{
    			$("#"+select_box_id).append("<option value=''>"+select_box_header+"</option>");
    		}
    		if(data_list!=null){
    			if(data_list.length>0){
    				for(i=0 ; i < data_list.length ; i++){
    					var item = data_list[i];
    					$("#"+select_box_id).append("<option value='" + item.itemId + "'   data-poItemId='" + item.reqItemId + "'>" +item.itemName+"-"+item.reqItemId+ "</option>");
    				}
    			}
    		}
    		$("#"+select_box_id).trigger("chosen:updated");
    	}
    }
    function populateJQueryChosenSelectBoxForItemForEdit(select_box_id, data_list, select_box_header,savedItem){
    	if($("#"+select_box_id)!=null && $("#"+select_box_id) != undefined){
    		$("#"+select_box_id).empty();
    		
    		if(select_box_header==undefined){
    			$("#"+select_box_id).append("<option value=''>Select</option>");
    		}else{
    			$("#"+select_box_id).append("<option value=''>"+select_box_header+"</option>");
    		}
    		if(data_list!=null){
    			if(data_list.length>0){
    				console.log("data list length ----"+data_list.length);
    				for(i=0 ; i < data_list.length ; i++){
    					var item = data_list[i];
    					
    					var item_name_text = item.itemName+"-"+item.reqItemId;
    					var saved_item_name_text = savedItem.deliveryItemName+"-"+savedItem.poItemId;
    					
    					//alert(item_name_text+"----i-------"+saved_item_name_text);
    					
    					if(item_name_text==saved_item_name_text){
    						
    					//alert("item.reqItemId--"+item.reqItemId);
    					
    						$("#"+select_box_id).append("<option value='" + item.itemId + "'  selected='selected'  data-poItemId='" + item.reqItemId + "'>" +item.itemName+"-"+item.reqItemId+ "</option>");
    					}else{
    						$("#"+select_box_id).append("<option value='" + item.itemId + "'   data-poItemId='" + item.reqItemId + "'>" +item.itemName+"-"+item.reqItemId+ "</option>");
    					}
    					
    				}
    			}
    		}
    		$("#"+select_box_id).trigger("chosen:updated");
    	}
    }



    
    function showCostingAccountModal(){
    	var userId='${USER.userId}';
    	$('#radio-cost-center').html("");
    	PoMngController.getMasterCostingAccount(userId,function(data){
    		if(data!=null){
    				var content3="";
    				var index3=0;
    				for(var i=0 ; i<data.length ; i++){
    					var ca = data[i];
    					index3++;
    					content3+= '<div class="col-lg-12 col-md-12 col-sm-12 col-xs-1 border-req-address">'
                        + '<input type="radio" checked="checked" class="costing" name="radio_costing" data-comp-code="'+ca.companyId+'" id="first-choice-costing'+index3+'" value="'+ca.costCenter+'" />'
                        + '<label for="first-choice-costing'+index3+'" class="adv-reg-comp-dtls-lbl modal-address-margin">'+ca.costCenter+' </label>'
    					+ '</div>';
    				}
    				$('#radio-cost-center').append(content3);
    		}else{
    			$('#radio-cost-center').html("No Cost center data found !");
    		}
    	});
    	$('#costingAccountModal').modal('show');
    }
    
    $('#costAccountSelect').click(function(){
    	if($('.costing').is(":checked")){
    		$('#costingAccountDiv').html($('input[name="radio_costing"]:checked').val());
    		$('#costingAccount').val($('input[name="radio_costing"]:checked').val());
    		$('#costingAccountModal').modal('toggle');
    	}else{
    		alert("Please select Costing Account");
    	}
    	
    }); 
    
    function deliveryScheduleValidation(){
    	var itemNameError = false;
    	var deliveryDateError = false;
    	var deliveryDateFormat =false;
    	var qtyError = false;
    	var qtyError1 = false;
    	var qtyNumError = false;
    	var deliveryDescriptionError = false;
    	var deliveryWarehouseError = false;
    	var status = false;
    	var awardCientName=$('#awardClientNames').val();
    	 var reDate = /(?:0[1-9]|[12][0-9]|3[01])\-(?:0[1-9]|1[0-2])\-(?:19|20\d{2})/;
    	 
    	 var item_existes_status=false;
    		var samedateWarehouseError = false;
    	$('.delivery_schedule').each(function validation(){
      		count=$(this).attr('count');
      		
      		if($('#itemName_'+count+'').val()!='' || $('#deliverydate_'+count+'').val()!='' || 
      				$('#quantity_'+count+'').val()!='' || $('#deliverydetails_'+count+'').val().trim()!=''){
      			
				if($('#itemName_'+count+'').val()==''){
					itemNameError = true;
      			}
				if(awardCientName=="NCC"){
					if($('#deliverydate_'+count+'').val()==''){
						deliveryDateError = true;		
					}else if(!reDate.test($('#deliverydate_'+count+'').val())){
						deliveryDateFormat=true;
					}
				}
				if($('#quantity_'+count+'').val()==''){
					qtyError = true;
				}else if($('#quantity_'+count+'').val()=='0'){
					qtyError1=true;
				}
				if($('#deliverydetails_'+count+'').val().trim()==''){					
					deliveryDescriptionError = true;
				}
				if(awardCientName=="NCC"){
					if($('#project_address_'+count+'').val().trim()==''){					
						deliveryWarehouseError = true;
					}
				}
				
      		}if($('#itemName_'+count+'').val()=='' && $('#deliverydate_'+count+'').val()=='' && 
      				$('#quantity_'+count+'').val()=='' && $('#deliverydetails_'+count+'').val().trim()==''){
      			if(awardCientName=="NCC"){
      			itemNameError = true;
      			deliveryDateError = true;
      			qtyError = true;
      			deliveryDescriptionError = true;
      			deliveryWarehouseError = true;
      			}
      		}
      		
      		if($('#itemName_'+count+'').val()!=''){
	      		item_existes_status=true;
      		}
      		
      	});
    	
    	
    	
    	
    	if(itemNameError){
    		$('#item_name_error').show();
    		status = true;
    	}else{
    		$('#item_name_error').hide();
    	}
    	if(awardCientName=="NCC"){
	    	if(deliveryDateError){
	    		$('#delivery_date_error').show();
	    		status = true;
	    	}else{
	    		$('#delivery_date_error').hide();
	    	}
    	}
    	if(deliveryDateFormat){
    		$('#delivery_dateformat_error').show();
    		status = true;
    	}else{
    		$('#delivery_dateformat_error').hide();
    	}
    	if(qtyError){
    		$('#qty_error').show();
    		status = true;
    	}else{
    		$('#qty_error').hide();
    	}
    	if(qtyError1){
    		$('#qty_error1').show();
    		status = true;
    	}else{
    		$('#qty_error1').hide();
    	}
    	if(qtyNumError){
    		$('#qty_error_no').show();
    		status = true;
    	}else{
    		$('#qty_error_no').hide();
    	}
    	if(deliveryDescriptionError){
    		$('#delivery_description_error').show();
    		status = true;
    	}else{
    		$('#delivery_description_error').hide();
    	}
    	if(awardCientName=="NCC"){
    		if(deliveryWarehouseError){
        		$('#warehouse_error').show();
        		status = true;
        	}else{
        		$('#warehouse_error').hide();
        	} 
    	}
    	
    	if(awardCientName=="NCC"){
    	//alert('status---'+status);
    	if(!status){
			
    	//	alert('item_existes_status---'+item_existes_status);
    		
    		if(item_existes_status){
      			
    			var duItemArr=[];
    			$('.itemName').each(function validation(){
    				var id=$(this).attr('id');
    				//alert("id---------"+id);
    				var index =id.split('_')[1];
    				
    				//alert("index---------"+index+" "+$.inArray($('#itemName_'+index+' option:selected').text(),duItemArr));
    				//alert("$(this).text()----"+$('#itemName_'+index+' option:selected').text());
    		 	if($.inArray($('#itemName_'+index+' option:selected').text(),duItemArr) === -1) {
    					duItemArr.push($('#itemName_'+index+' option:selected').text());
    					//alert("itemname&poitemid---------"+$('#itemName_'+index+' option:selected').text());
    					
    				}else{ 
    					
    					var poitemid=$('#itemName_'+index+' option:selected').attr('data-poitemid');
    					//alert("poitemid---------"+poitemid);
    					var duWarArr=[];
    					
    					
    					$('.weare_'+poitemid).each(function validation(){
    						
    						
    						var countIndex=$(this).attr('id').split('_')[2];
    	    				//alert('countIndex-----------'+countIndex);
    						
    						if($.inArray($('#project_address_'+countIndex+' option:selected').val(),duWarArr) === -1) {
    							duWarArr.push($('#project_address_'+countIndex+' option:selected').val());
    	    					//alert("itemname&poitemid---------"+$('#project_address_'+countIndex+' option:selected').val());
    	    					
    	    				}else{
    	    					
    	    					var duDateArr=[];
    	    					$('#qty_error_for_date_address').hide();
    	    					$('.date_'+poitemid).each(function validation(){
    	    						
    	    						var dateId=$(this).attr('id');
    	    	    				//alert("dateId---------"+dateId);
    	    	    				var dateIndex =dateId.split('_')[1];
    	    	    				
	    	    					if($.inArray($('#deliverydate_'+dateIndex+'').val(),duDateArr) === -1) {
	    	    						duDateArr.push($('#deliverydate_'+dateIndex+'').val());
	        	    					//alert("deliverydate_---------"+$('#deliverydate_'+dateIndex+'').val());
	        	    					
	        	    				}else{
	        	    					//alert('error');
	        	    					//item qty should be same for same warehosue&date  need to show error message
	        	    					$('#qty_error_for_date_address').text('Please enter different date/warehouse to avoid duplication for item:'+$('#itemName_'+index+' option:selected').text());
										$('#qty_error_for_date_address').show();
	        	    					status = true;
	        	    					
	        	    				}
	    	    					
    	    					});
    	    					
    	    				}
    						
    					});
    				}
    				
    				
    			});
    			
      			
      			
      			
      		}
      		
    	}
    }
    	
    	return status;
    }
    
    function getEditItemAucCodes(reqItemId){
    	PoMngController.getEditItemAucCodes(reqItemId,{async:false,callback:function(data){			
			if(data!=null){						
					$('#po_item_id').val(reqItemId);
					$('#auc_code2').val(data.aucCode);
			 }
			$('#CostCenterEditModal').modal('show');
    	}});
    	$('#CostCenterEditModal').modal('show');
    }
    
    $('.updateCostCenter').click(function(){        
    	$('#auc_code2').val($('#auc_code2').val().trim());
    	var aucCode=$('#auc_code2').val();
    	var poItemId = $('#po_item_id').val();
    	var status=true;   
    	var aucStatus = true;
    	
		if(aucCode==''){        		
    		status=false;
    		aucStatus=false;
    		$('#aucCodeError1').show();
    	}
    	
       if(status){	        		
	    	if(confirm("Are you sure, you want to save?")){ 
		       $('#item_cost_center_form').attr("method","POST");
    			$('#item_cost_center_form').attr("action","updateItemAucCode");
    			$('#item_cost_center_form').submit();
	    	}
       }
    });
    function validateDecimalPoint(value) {
     	  var points = (Number(value)).getPrecision();
     	  var actualPoints = ${NO_OF_DECIMAL};
     		 if(value!=""){
     			 if(Number(points)<=Number(actualPoints)){
     				 return true;
     			 }else{
     				return false;
     			   }
     		   }
      }		
    			
     
    $("#saveCancelComment").click(function(){
    	if($("#cancelComment").val()!==""){		
    			$("#errorCancelComment").hide();
    			if(confirm("Are you sure to submit PO ?")){
    				$("#purchaseSubmitStatusId").val(0);
    				$('#paymentTerm').prop('disabled', false);
    				$("#submissionComments").val($("#cancelComment").val());
					$('#poFromId2').attr("method","POST");
		        	$('#poFromId2').attr("action","submitPurchaseRaisedPO");
		        	$('#poFromId2').submit();
    			}
    	}else{
    		$("#errorCancelComment").text("please enter comments");
    		$("#errorCancelComment").show();
    	}
    });
       
    Number.prototype.getPrecision = function() {
 	    var s = this + "",
 	        d = s.indexOf('.') + 1;
 	    return !d ? 0 : s.length - d;
   	};
   	
   	$('#backToSameList').click(function(){
    	$("#text_form").attr('method','GET');
		$("#text_form").attr('action','getPoDashboardPagination');
		$("#text_form").submit();
    });
	$('#backToDraftList').click(function(){
    	$("#my_text_form").attr('method','GET');
		$("#my_text_form").attr('action','getAllPoSearch');
		$("#my_text_form").submit();
    });
	
	$('#deletePurchaseOrder').click(function(){		
		if(confirm("Are you sure to delete PO?")){			
			$('#delete_po_form').attr("method","POST");
        	$('#delete_po_form').attr("action","deletePo");
        	$('#delete_po_form').submit();
	}
	});
	
	var serviceItemIndex=0;
	function getServiceItems(reqItemId,categoryId,subCategoryId,l3CategoryId){
		$('#saved_poItemIds').val(reqItemId);
		$('#saved_l3Category').val(l3CategoryId);
		$('#saved_Category').val(categoryId);
		$('#saved_subCategory').val(subCategoryId);
		   
		   $('#subCategory_label').hide();
		   
		   if(l3CategoryId!='' && l3CategoryId!=null){
			    var l3CategoryName=$('#'+l3CategoryId).val();
			  //  alert(l3CategoryId+'l3CategoryName------'+l3CategoryName);
              
			   $('#subCategory_label').html('<div class="col-md-2 col-sm-2 clearfix" style="padding-top: 30px;" >L3 Category :</div>'
			   +' <div class="col-md-3 col-sm-3 clearfix" style="padding-top: 30px;">'+l3CategoryName+'</div>');
			 
			   $('#subCategory_label').show();
		   }else if(subCategoryId!='' && subCategoryId!=null){
			    var subCategoryName=$('#'+subCategoryId).val();
			    $('#subCategory_label').html('<div class="col-md-2 col-sm-2clearfix" style="padding-top: 30px;" >Sub Category :</div>'
						   +' <div class="col-md-3 col-sm-3 clearfix" style="padding-top: 30px;">'+subCategoryName+'</div>');
						 
						   $('#subCategory_label').show();
		   }
		   
		$('#addServiceModel').modal('show');
	}
	
	
	function getSetviceItems(){
		
	    $('#addServiceModelsTable').empty();
		
	   var categoryId=$('#saved_Category').val();
	   var subCategoryId=$('#saved_subCategory').val();
	   var l3CategoryId=$('#saved_l3Category').val();
	   
	   var searchText=$("#searchedString").val();
	   
	   //alert('searchedString-------'+searchText);
	   
	   if(searchText!=null && searchText!=''){
	   
	   PoMngController.getAllServiceItems(categoryId,subCategoryId,l3CategoryId,searchText,{async:false,callback:function(data_map){		

		  // alert("size-------"+data_map.length);
	if(data_map.length>0){	
		for(var i=0 ; i<data_map.length ; i++){
		
			var itemNameL=data_map[i].itemName;
			//alert("size-------"+data_map[i].itemName.length);
					if(data_map[i].itemName.length > 100){
						itemNameL=data_map[i].itemName.substring(0, 100);
					}
			
		var content='<tr class="adv-reg-comp-dtls-lbl firstRow"><input type="hidden" name="serviceDtlsIds" value="" id="saved_serviceDtlsIds"/> '
					+' <input type="hidden" id="hidden_'+data_map[i].itemId+'" name="" value="'+data_map[i].itemId+'" />'
					+'  <td class=""> '
					/* +' <input name="items" id="items" class="filled-in form-control serviceItems" type="checkbox" value="'+data_map[i].itemId+'">' */
					/* +' <label for="items"></label> </label>' */
		 			+' </td> '
		 			+' <td class="tdr4-status-log" style="width: 200px;"> '
		 			+' <div data-toggle="tooltip" title="'+data_map[i].itemName+'"> '+itemNameL+' '
		 			+' </div>'
		 			+' </td> '
		 			+' <td class="">  '
		 			+' <textarea  name="serviceDescription1" value="" class="basic-reg-comp-dtls-txt" id="service_description_'+data_map[i].itemId+'" rows="4" cols="50"> </textarea>'
		 			+' <label id="error_serviceDescription_'+data_map[i].itemId+'" class="adv-reg-popup-validation-lbl" style="display: none;">Enter Description.</label>  '
		 			+'  </td> '
		 			+' <td class=""  style="width: 90px;">  '
		 			+' <input type="text" name="serviceQuantity1" value="" class="basic-reg-comp-dtls-txt"   id="service_quantity_'+data_map[i].itemId+'"> '
		 			+' <label id="error_service_quantity_'+data_map[i].itemId+'" class="adv-reg-popup-validation-lbl" style="display: none;">Enter Quantity</label>  '
		 			+'  </td> '
		 			+' <td class="" style="width: 100px;">'
		 			+'<select class="basic-reg-comp-dtls-txt" name="itemUoms1" id="itemUoms_'+data_map[i].itemId+'" style="width:100%;"> '
		 			+' <option value="">select</option> <c:forEach var="unit" items="${UOM_MAP}">'
		 			+'      <option value="${unit.key}">${unit.value}</option>'
		 			+'      </c:forEach> '
		 			+' </select> '
		 			+' <label id="error_itemUoms_'+data_map[i].itemId+'" class="adv-reg-popup-validation-lbl" style="display: none;">Select UOMItem</label> '
		 			+' </td> '
		 			+' <td class=""> '
		 			+' <input type="text"  value="" name="price1"  class="basic-reg-comp-dtls-txt"  id="service_price_'+data_map[i].itemId+'">  '
		 			+' <label id="error_serviceItemPrice_'+data_map[i].itemId+'" class="adv-reg-popup-validation-lbl" style="display: none;">Enter Price.</label> '
		 			+' </td> '
		 			+' <td> '
		 			+' <button  id="SaveService" type="button" class="req-btn submit-button-align" onclick="SaveServiceItems(\''+data_map[i].itemId+'\')"><b>Add</b></button>'
		 			+' </td> </tr> ';

		 			$('#addServiceModelsTable').append(content);
		 			
		 			
		
		 }		
	} 
	
	
	   }
	   });
	 			
		
	   $("#searchedString").val(searchText);
	   }else{
		   
		   alert("Please enter item name or item code");
	   }
		
	}
   
	
	
	function SaveServiceItems(itemId){
		
		//alert("submit-------------------");
		
		var status=false;
		
		/* if($("#servicItemId").val()==''){
			$("#error_serviceItems").show();
			status=true;
		}else{
			$("#error_serviceItems").hide();
		} */
		
		
		
		
		if($("#service_quantity_"+itemId).val()==''){
			$("#error_service_quantity_"+itemId).show();
			status=true;
		}else if (!$.isNumeric($("#service_quantity_"+itemId).val())){
			$("#error_service_quantity_"+itemId).show();
			$("#error_service_quantity_"+itemId).text("Please enter only numeric value");
			status=false;
		}else if ($("#service_quantity_"+itemId).val()<0){
		    $("#error_service_quantity_"+itemId).show();
			$("#error_service_quantity_"+itemId).text("Please enter only numeric value");
			status=false;
		}else{
			$("#error_service_quantity_"+itemId).hide();
		}
		
		if($("#service_description_"+itemId).val()==''){
			$("#error_serviceDescription_"+itemId).show();
			status=true;
		}else{
			$("#error_serviceDescription_"+itemId).hide();
		}
		
		if($("#itemUoms_"+itemId).val()==''){
			$("#error_itemUoms_"+itemId).show();
			status=true;
		}else{
			$("#error_itemUoms_"+itemId).hide();
		}
		
		if($("#service_price_"+itemId).val()==''){
			$("#error_serviceItemPrice_"+itemId).show();
			status=true;
		}else if (!$.isNumeric($("#service_price_"+itemId).val())){
			
		    $("#error_serviceItemPrice_"+itemId).show();
			$("#error_serviceItemPrice_"+itemId).text("Please enter only numeric value");
			status=true;
		}else if ($("#service_price_"+itemId).val()<0){
		    $("#error_serviceItemPrice_"+itemId).show();
			$("#error_serviceItemPrice_"+itemId).text("Please enter only numeric value");
			status=true;
		}else{
			$("#error_serviceItemPrice_"+itemId).hide();
		}
		
		       
		//alert("final status -------"+$("#itemUoms_"+itemId).find("option:selected").text());
		if(!status){
			
			$("#saved_itemUoms").val($("#itemUoms_"+itemId).find("option:selected").val());
			$("#saved_price").val($("#service_price_"+itemId).val());
			$("#saved_serviceQuantity").val($("#service_quantity_"+itemId).val());
			$("#saved_serviceDescription").val($("#service_description_"+itemId).val());
			$("#saved_servicItemId").val($("#hidden_"+itemId).val());
			
			$('#addServiceModelId').attr("method","POST");
	    	$('#addServiceModelId').attr("action","saveOrUpdateServiceItems");
	    	$('#addServiceModelId').submit();
		}
		
	}
	
	
	function addServicesData(event){
		event.preventDefault();
		
		
	}
	
	
	function populateJQuerySelectBox(select_box_id,data_map,select_box_header){
		if($("#"+select_box_id)!=null && $("#"+select_box_id) != undefined ){
			$("#"+select_box_id).empty();
			
			if(select_box_header==undefined) $("#"+select_box_id).append("<option value=''>Select</option>");
			else $("#"+select_box_id).append("<option value=''>"+select_box_header+"</option>");
		
			if(data_map!=null){
				var keys=Object.keys(data_map);
				if(keys.length>0){	
					for(var key in data_map){
						$("#"+select_box_id).append("<option value='" +key + "'>" +data_map[key]+ "</option>");
					}
				}
				
				$("#"+select_box_id).trigger("chosen:updated");
			}
		}
	}
	
	function removetServiceItem(id,poid){
		
		if(confirm("Are you sure to continue.")){
			$("#serviceDtlsId_delete").val(id);
			$('#deleteFormService').attr("method","POST");
	    	$('#deleteFormService').attr("action","deleteServiceItem");
	    	$('#deleteFormService').submit();
			
		}
	}
	
	
	
	 function populateJQueryChosenSelectBoxForIteWarehouse(select_box_id, data_map, select_box_header){
		// alert("testt");
	 
	    	if($("#"+select_box_id)!=null && $("#"+select_box_id) != undefined){
	    		$("#"+select_box_id).empty();
	    		
	    		if(select_box_header==undefined){
	    			$("#"+select_box_id).append("<option value=''>Select</option>");
	    		}else{
	    			$("#"+select_box_id).append("<option value=''>"+select_box_header+"</option>");
	    		}
	    		
	    		if(data_map!=null){
					var keys=Object.keys(data_map);
					if(keys.length>0){	
						//alert("length");
					
						for(var key in data_map){
							$("#"+select_box_id).append("<option value='" +key + "'>" +data_map[key]+ "</option>");
						}
					}
					
					$("#"+select_box_id).trigger("chosen:updated");
				}
	    		
	    		$("#"+select_box_id).trigger("chosen:updated");
	    	}
	    }
	 
	 
	 function showPaymentTerms(){
		 event.preventDefault();
		 
		 $('#paymentTermsModal').modal('show');
		 
		 event.preventDefault();
	 
	 }
	 
	 
	 function openQuantityModal(){
		 

		 
		 $('#quantityUpdateModal').modal('show');
		 
		 event.preventDefault();
	 
	 
	 }
	 
	 
	 
	 function updatePoQuantities(){
		 var status = true;
		 
		 var items=new Array;
		 var itemQuantity=new Array;
		 var presentQuantity=new Array;
		 var avilableQuantity=new Array;
		 var totalPrices = new Array;
		 var poItems=new Array;
		 
		 
		 $(".itemIds").each(function(){
				var id = $(this).attr('id');
				var innerIndex = id.split("_")[1];
				
				if($("#presentQuantity_"+innerIndex).val() == ""){
					
				status = false;
				}
				
			});
		 
		 
		 if(!status){
			 
		 alert("Please enter quantity");
		 
		 }
		 
		 $(".itemIds").each(function(){
				var id = $(this).attr('id');
				var innerIndex = id.split("_")[1];
				
				if(!$.isNumeric($("#presentQuantity_"+innerIndex).val())){
					
				status = false;
				}
				
			});
		 
		 
		 if(!status){
			 
		 alert("Please enter numeric values");
		 
		 }
		 
		 if(status){
			 
			 $(".itemIds").each(function(){
					var id = $(this).attr('id');
					var innerIndex = id.split("_")[1];
					
					if((Number($("#presentQuantity_"+innerIndex).val()) > Number($("#availableQuantity_"+innerIndex).val()))
							|| (Number($("#presentQuantity_"+innerIndex).val()) < 0)
					){
						
					status = false;
					
					}
					
				});
			 
			 
			 
			 if(!status){
				 
				 alert("Please enter quantity equal to or less than available quantity");
				 
				 }else{
					 
				 
					 $(".itemIds").each(function(){
							var id = $(this).attr('id');
							var innerIndex = id.split("_")[1];
							
							items.push($(this).val());
							itemQuantity.push($("#itemQuantity_"+innerIndex).val());
							presentQuantity.push($("#presentQuantity_"+innerIndex).val());
							poItems.push($("#updatePoItemId_"+innerIndex).val());
							avilableQuantity.push($("#availableQuantity_"+innerIndex).val());
							
							
							$("#updateQuantity").val(1);
							
							$("#updateItems").val(items);
							$("#updateItemQuantity").val(itemQuantity);
							$("#updatePresentQuantity").val(presentQuantity);
							$("#poItems").val(poItems);
							$("#updateAvailableQuantity").val(avilableQuantity);
							
							$("#itmQuan_"+innerIndex).text($("#presentQuantity_"+innerIndex).val());
							
							
							var price = $("#unitPrice_"+innerIndex).val();
							
						
							
							var totalPrice  = Number(price)*Number($("#presentQuantity_"+innerIndex).val());
							
						
							
							$("#finalCost_"+innerIndex).text(totalPrice);
							
							totalPrices.push(totalPrice);
							
							
							//$("#totalPrices").val(totalPrices);
							
							
							
							
							
							
							
							
						});
					 
					
					 
					 
					
					 var poId = $("#po_id").val();
						
					 PoMngController.getPoStatus(poId,{async:false,callback:function(data){
							 if(data == 11 || data == 14){
								 
								 if(confirm("Do you want, update item quantity? ")){
									 $('#quantityUpdateModal').modal('hide');
									 $("#purchaseSubmitStatusId").val(11);
										 $('#paymentTerm').prop('disabled', false);
										$('#poFromId2').attr("method","POST");
							        	$('#poFromId2').attr("action","submitPurchaseRaisedPO");
							        	$('#poFromId2').submit();
						 
						 		}
					 
							 }else{
								 alert("Po status has been changed please click on back button");
							 }
							 
						}});
				 
				 
				 }
			 
			 
			 
			 
			 
		 
		 
		 }
		 
		 
	 
	 
	 
	 }
	 
	 
	  function currencyFormatting(nStr){ nStr += ''; x = nStr.split('.'); x1 = x[0]; x2 = x.length > 1 ? '.' + x[1] : ''; var rgx = /(\d+)(\d{3})/; var z = 0; var len = String(x1).length; var num = parseInt((len/2)-1);  while (rgx.test(x1))  {    if(z > 0)    {      x1 = x1.replace(rgx, '$1' + ',' + '$2');    }    else    {      x1 = x1.replace(rgx, '$1' + ',' + '$2');      rgx = /(\d+)(\d{2})/;    }    z++;    num--;    if(num == 0)    {      break;    }  } return x1 + x2;}

	  function deliveryScheduleValidationForNCC(){//empty delivery schedule return true
	    	var status=false;
	    	var nccDSValidationAllow=0;
	    	$('.delivery_schedule').each(function validation(){
	      		count=$(this).attr('count');
	      		
	      		if( $('#deliverydate_'+count+'').val()=='' && 
	      				$('#quantity_'+count+'').val()=='' && $('#deliverydetails_'+count+'').val().trim()=='' && $('#project_address_'+count+'').val().trim()==''){
	      			
	      			
	      			nccDSValidationAllow=nccDSValidationAllow+1;
	      			
	      		}
	      	});
	    	
	    	//alert(nccDSValidationAllow);
	    	if(nccDSValidationAllow>0){
	    		status=true;
	    	}
	    	return status;
	    }
	  
	  function deliveryScheduleValidationForNonNCC(){//empty delivery schedule
	    	var status=false;
	    	var nonNccDSValidationAllow=0;
	    	var rowcount=0;
	    	var dateCount=0;
	    	$('.delivery_schedule').each(function validation(){
	      		count=$(this).attr('count');
	      		
	      		if( $('#deliverydate_'+count+'').val()==''){
	      			dateCount=dateCount+1;
	      			
	      		}else if($('#deliverydate_'+count+'').val()=='' && 
	      				$('#quantity_'+count+'').val()=='' && $('#deliverydetails_'+count+'').val().trim()==''){
	      			nonNccDSValidationAllow=nonNccDSValidationAllow+1;
	      		}
	      		rowcount=rowcount+1;
	      	});
	    	if(dateCount==rowcount){
	    		status=true;
	    	}else{
	    		status=false;
	    	}
	    	if(nonNccDSValidationAllow>0){
	    		status=true;
	    	}
	    	return status;
	    	
	    }
	  
	  
	  function getLineItems(reqItemId){
		  $('#scheduleLineItemId').empty();
				  PoMngController.getScheduleLineItems(reqItemId,{async:false,callback:function(data){
			  var  content = '';
			  if(data!=null){
					
				  var data2 = JSON.parse(data);
					var keys = Object.keys(data2);
					//alert("length:"+keys.length);
					if(keys.length > 0){
						for(var key in data2){
							 
							 $('#itemNameForSchedule').text(data2[key].itemName);
						 	$('#itemDescriptionSchedule').text(data2[key].itemDecription); 
						 	content=content+'<tr class="adv-reg-comp-dtls-lbl">'
							 +' <td class="tdr1-status-log breakword">'+data2[key].index+'</td>'
					            /* +' <td class="tdr1-status-log breakword">'+data2[key].itemName+'</td>'
						           +' <td class="tdr1-status-log breakword">'+data2[key].itemDecription+'</td>' */
						           +' <td class="tdr1-status-log breakword">'+data2[key].totalQty+'</td>'	/*('+data2[key].uom+')  */
						           +' <td class="tdr1-status-log breakword">'+data2[key].openQty+'</td>'	/* ('+data2[key].uom+') */
						           +' <td class="tdr1-status-log breakword">'+data2[key].deliveryDate+'</td>'
						           +' <td class="tdr1-status-log breakword">'+data2[key].requisitionId+'</td>'
						            +' </tr>';
						}
					}
						  
					$('#scheduleLineItemId').append(content);	
						// $("#scheduleLineItemModal").modal('show');
				
			  }
		  }});
				  $("#scheduleLineItemModal").modal({backdrop: "static"});
	  }
	  
	  function getPriceHistory(reqItemId){
		  $('#schedulePriceHistoryId').empty();
				  PoMngController.getSchedulePriceHistory(reqItemId,{async:false,callback:function(data){
			  var  content = '';
			  if(data!=null){
					
				  var data2 = JSON.parse(data);
					var keys = Object.keys(data2);
					//alert("length:"+keys.length);
					if(keys.length > 0){
						for(var key in data2){
							
							$('#itemNameForPriceHistory').text(data2[key].itemName);
						 	$('#itemDescriptionPriceHistory').text(data2[key].itemDecription); 
						 	
							 content=content+'<tr class="adv-reg-comp-dtls-lbl">'
							 /* +' <td class="tdr1-status-log breakword">'+data2[key].itemName+'</td>'
						           +' <td class="tdr1-status-log breakword">'+data2[key].itemDecription+'</td>' */
						           +' <td class="tdr1-status-log breakword">'+data2[key].startDate+'</td>'
						           +' <td class="tdr1-status-log breakword">'+data2[key].endDate+'</td>'
						           +' <td class="tdr1-status-log breakword">'+data2[key].unitPrice+'</td>'
						           +' <td class="tdr1-status-log breakword">'+data2[key].totalPrice+'</td>'
						            +' </tr>';
						}
					}
						  
					$('#schedulePriceHistoryId').append(content);	
						// $("#scheduleLineItemModal").modal('show');
				
			  }
		  }});
				  $("#schedulePriceHistoryModal").modal({backdrop: "static"});
	  }
	  function toggleSetUp() {
			$('.read-more').off();
			$('.read-more').click(function () {
				if ($('.truncated-text').is(":visible")) {
					$('.truncated-text').hide();
					$('.full-text').show();
					$(this).text("...less");
				} else {
					$('.full-text').hide();
					$('.truncated-text').show();
					$(this).text("...more");
				}
			});
		}
	
	$(document).ready(function() {
    $('.moree-read').on('click', function() {
        var container = $(this).closest('.itemDescriptionContainer');
        var truncatedText = container.find('.truncated-txt');
        var fullText = container.find('.full-txt');
        var moreLink = container.find('.moree-read');

        if (truncatedText.is(":visible")) {
            truncatedText.hide();
            fullText.show();
            moreLink.text("...less");
        } else {
            fullText.hide();
            truncatedText.show();
            moreLink.text("...more");
        }
    });
});
	
</script>


</html>