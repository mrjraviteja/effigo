
<%@page import="org.bob.tender.enums.BidPerEnum"%>
<%@page import="org.bob.eprocure.model.PriceComponent"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="org.bob.authentication.UserUtil"%>
<%@page import="org.bob.tender.enums.RoleEnum"%>
<%@page import="org.bob.tender.pojo.TenderBasicInfo"%>
<%@ page import="org.bob.tender.security.RequestTokenUtil"%>
<c:set var="USER" value="<%= UserUtil.getUserFromSession(request)%>" />
<c:set var="PERUNIT" value="<%= BidPerEnum.PER_UNIT.getId()%>" />
<c:set var="PERTOTAL" value="<%= BidPerEnum.TOTAL_UNIT.getId()%>" />
<c:set var="CREATOR"  value="<%= RoleEnum.CREATOR.getRoleId()%>" />
<c:set var="APPROVER" value="<%= RoleEnum.APPROVER.getRoleId()%>"  />
<c:set var="VENDER" value="<%= RoleEnum.VENDOR.getRoleId()%>" />

<c:set var="SUBMITTED" value="<%=TenderBasicInfo.Status.SUBMITTED.getValue()%>" />
<c:set var="PUBLISHED" value="<%=TenderBasicInfo.Status.PUBLISHED.getValue()%>" />
<c:set var="AMOUNT" value="<%=PriceComponent.CompType.AMOUNT.getValue()%>"></c:set>
		<c:set var="PERCENTAGE" value="<%=PriceComponent.CompType.PERCENTAGE.getValue()%>"></c:set>
		<c:set var="BASEPRICE" value="<%=PriceComponent.CalculationOn.BASE_PRICE.getValue()%>"></c:set>
		<c:set var="CALCULATEDPRICE" value="<%= PriceComponent.CalculationOn.CALCULATED_PRICE.getValue()%>"></c:set>
		<c:set var="INCREMENT" value="<%= PriceComponent.CalculationType.ADDITION.getValue()%>"></c:set>
		<c:set var="DECREMENT" value="<%= PriceComponent.CalculationType.SUBTRACTION.getValue()%>"></c:set>


<link rel="stylesheet" href="${pageContext.request.contextPath}/new-tender-css/bootstrap.min.css">
<!-- Custom styles -->
<!-- <link rel="stylesheet" href="etender-dashboard-css/main.css"> -->
<!-- Over written bootstrap css file -->
<link href="etender-dashboard-css/bs-append.css" rel="stylesheet">
<!-- upload button css cdn -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/new-tender-css/jasny-bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.css">
<!-- Datepicker -->
<link rel="stylesheet" href="etender-dashboard-css/jquery.datetimepicker.css">
<!-- custum radio checkbox -->
<link rel="stylesheet" href="etender-dashboard-css/custum-radio-checkbox.css">
<!-- dual selection stylesheets -->
<link rel="stylesheet" href="etender-dashboard-css/bootstrap-duallistbox.css">
<!-- container starts here -->

<script src="javascript/jquery.min.js" type="text/javascript"></script>   
<script src="${pageContext.request.contextPath}/js-can-update/bootstrap.min.js"></script>
 <script src="${pageContext.request.contextPath}/req-js/chosen.jquery.js"></script>
<style>
 .control-label:after {
  content:"*";color:red;
}
</style>

<!-- container starts here -->
<section class="content-area">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <!-- top search bar -->
        <div class="top-bar-div clearfix">
        <div class="col-md-12 col-sm-12">
        	<div class=" col-md-6 col-sm-6">
        	
            	
             
            </div>
            <div class=" col-md-6 col-sm-6 "><%-- <a href="#" class="pull-right"><i class="fa fa-question"></i><spring:message code="label.need.help" /></a> --%></div>
        </div><!-- end of col -->
        </div><!-- end of top bar div -->
        <!-- top search bar end -->
        <!-- multi step container strarts here -->
        
        <div class="col-md-12 clrboth">
          <div class="white-block-container">
          
          	
            <h3 class="head-title"> </h3>
            
            
            <div class="tender-summary-block clearfix">
                 
                 
                    	<div class="tender-basic-detail-div clearfix">
                  <h4>Sourcing Requisition Details  <span class="pull-right"></span></h4>
                    <div class="tender-basic-detail-box clearfix">
                        <div class="form-group clearfix">
                             <label class="col-md-2 col-sm-2  ">Sourcing Requisition ID:</label>
                             <div class="col-md-3 col-sm-3 custumrc bdr-ryt-1d"> ${REQUISITION_DETAILS.sourcingReqId}</div>
        
                    	 <label class="col-md-2 col-sm-2  ">Business Unit:</label>
                            <div class="col-md-2 col-sm-2 custumrc">
                           		<c:if test="${not empty REQUISITION_DETAILS.businessUnitName}">${REQUISITION_DETAILS.businessUnitName}</c:if>
                                <c:if test="${empty REQUISITION_DETAILS.businessUnitName}">NA</c:if>
                            
                         </div>   
                           
                    </div> 
                	<div class="form-group clearfix">
                             <label class="col-md-2 col-sm-2  ">Requisition ID:</label>
                             <div class="col-md-2 col-sm-2 custumrc bdr-ryt-1d"> ${REQUISITION_DETAILS.reqId}</div>
        
                    
                             <label class="col-md-2 col-sm-2  ">Requestor:</label>
                            <div class="col-md-2 col-sm-2 custumrc">
                           		<c:if test="${not empty REQUISITOR.userName}">${REQUISITOR.userName}</c:if>
                                <c:if test="${empty REQUISITOR.userName}">NA</c:if>
                            
                         </div>   
                             <label class="col-md-2 col-sm-2  ">Department:</label>
                            <div class="col-md-2 col-sm-2 custumrc">
                           		<c:if test="${not empty REQUISITOR.departmentname}">${REQUISITOR.departmentname}</c:if>
                                <c:if test="${empty REQUISITOR.departmentname}">NA</c:if>
                            
                         </div>   
                    </div>  
                    	
                       <div class="form-group clearfix">
                            <label class="col-md-2 col-sm-2 ">Requisition Date:</label>
                            <div class="col-md-2 col-sm-5 custumrc">${REQUISITION_DETAILS.requisitionDate}</div>
                            <label class="col-md-2 col-sm-2 ">Requisition Title:</label>
                            <div class="col-md-2 col-sm-2 custumrc">${REQUISITION_DETAILS.reqTitle}</div>
                            <label class="col-md-2 col-sm-2 ">Requisition Type:</label>
                            <div class="col-md-2 col-sm-2 custumrc">
                          <c:if test="${not empty REQUISITION_DETAILS.reqTypeName}">${REQUISITION_DETAILS.reqTypeName}</c:if>  
                          <c:if test="${empty REQUISITION_DETAILS.reqTypeName}">NA</c:if>  
                            </div>
                       </div>
                   
            </div></div>
            
            
               
             <hr class="formhr clrboth">
             <div class="tender-basic-detail-div clearfix">
             
             
             <div class="form-group clearfix">
             
              <label for="document" class="col-md-2 col-sm-2 control-label">Offline Type:</label>
              <div class="col-md-2 col-sm-2">
              	<select    id="offline_type"  class="form-control" onchange="setOfflineType();" >
	                <option value="">Select Type</option>
				    <option value="1">Offline</option>
				    <option value="2">Offline Contract</option>
				    <option value="3">PostFacto</option>						    
			    </select>
                <span id="error_offline_type" style="display:none; color: red;">Please Select Type</span>	
              </div>
             
             </div>
             
             
              <div class="form-group clearfix" id="common_contract_div" >
             
              <label for="document" class="col-md-2 col-sm-2 control-label">Supplier:</label>
              <div class="col-md-3 col-sm-3 custumrc">
              	<select    id="common_supplier"  class="form-control common-supplier" onchange="getContracts();" >
	                <option value="">Select </option>
				    <c:forEach var="suppMap" items="${SUPPLIER_LIST}" varStatus="loop" >
							<option value="${suppMap.userId}">${suppMap.companyName}&nbsp;&nbsp;(${suppMap.name})</option>
					 </c:forEach> 				    
			    </select>
                
              </div>
              
               <label for="document" class="col-md-2 col-sm-2 control-label">Common Contract:</label>
              <div class="col-md-3 col-sm-3">
              	<select    id="common_contract"  class="form-control">
	                <option value="">Select </option>
				   			    
			    </select>
                
              </div>
             
             </div>
             <input type="hidden" id="currency" value="${REQUISITION_DETAILS.currencyName}">
    <div class="form-group clearfix" id="supplier_common_document">
                           
                      
                         
              <label for="document" class="col-md-2 col-sm-2 control-label">Supplier Common Document:</label>
              <div>
             <div class="col-md-2 col-sm-2">
              <div class="fileinput fileinput-new" data-provides="fileinput" id="uploadDiv"> 
              <span class="btn btn-primary btn-file" id="reqSupplier_doc_span">
               <span class="fileinput-new">
                <spring:message code="label.upload" />
                <img class="upload-btn-icon" src="assets/images/blank.png" /> 
                </span>
                <%--  <span class="fileinput-exists">
                <spring:message code="label.add" />
                <img class="upload-add-btn-icon" src="assets/images/blank.png" />
                </span> --%>
                <input type="file"  id="reqSupplierDocument" class="reqSupplierDocument" name="reqSupplierDocument" data-max-size="52428800">
                <!-- name="tenderDocuments" -->
               
                </span>
                <div id="progress_box" class="progress " style="display: none;margin-top: 20px;">
                  <div id="progress_bar" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width:20%"> 40% </div>
                </div>
                <div id="document_upload_error_msg" style="display: none;color: red;">Please upload Supplier Document</div>
                <div class="fileinput-filename"></div>
                
                <span id="reqSupplier_doc_size"></span>
                 <a href="#" id="delete_reqSupplierDoc_button" class="fileinput-exists deleteReqDoc" data-dismiss="fileinput" style="float: none" > 
                 <img class="delete-icon" src="assets/images/blank.png"/> </a>
                <div  id="reqSupplier_documents_upload_message" ></div>
               
              </div>
            </div>
            <div class="col-md-2 col-sm-2  ">
              <button type="button" class="btn btn-primary uploadReqDocButton" id="req_supplier_document_upload_button">
              <spring:message code="start.upload" />
              </button>
            </div>
            <div class="col-md-1 col-sm-1"  id="req_supplier_document_upload_div"  style="display: none;color: red;">
              <spring:message code="upload.documents.msg" />
            </div>
          </div>
          </div>         
             
             
             
<h4>List of Sourcing Requisition Items</h4>
             <div class="tender-basic-detail-box clearfix">
             
            
             <form method="POST" id="awardForm">  
             
              <input type="hidden" name="reqSupplierDocNames" id="reqSupplierDocNames" value="">
                <input type="hidden" name="reqSupplierDocSequenceNos" id="reqSupplierDocSequenceNos" value="">
                <input type="hidden" name="reqSupplierDocFlagStatus" id="reqSupplierDocFlagStatus" value="">
         <input type="hidden" name="token" value="<%=RequestTokenUtil.getLatestToken()%>"/>
        <input type="hidden" name="itemId" value="${param.itemId}">
        <input type="hidden" name="sourcingTitle" value="${REQUISITION_DETAILS.reqTitle}">
        <input type="hidden" id="sourcReqId" name="sourcingRequisitionId" value="${REQUISITION_DETAILS.sourcingReqId}">
       <!--  <input type="hidden" name="percentages" id="percentage_Id" value=""/>
		<input type="hidden" name="userIds" id="userIds_Id" value=""/>
		
		<input type="hidden" name="termsAndConditions" id="termsAndConditions_Id" value=""/>
		<input type="hidden" name="deliveryTerms" id="deliveryTerms_Id" value=""/>
		<input type="hidden" name="paymentTerms" id="paymentTerms_Id" value=""/> -->
		<input type="hidden" name="offlineType"  id="offline_type_form" value="">
		<input type="hidden" name="commonContract"  id="common_supplier_contract" value="">
        <input type="hidden" name="sourcingItemIdsList" id="sourcingItemIdsList" value="${REQUISITION_DETAILS.sourcingItemIdsList}" />
        
        
                	
                                <c:if test="${not empty REQUISITION_ITEMS}">    
                                <input type="hidden" name="sourcingReqId" value="${REQUISITION_DETAILS.sourcingReqId}">
	                              <c:forEach var="subItemDetails" items="${REQUISITION_ITEMS}" varStatus="loop"> 
	                                        <input type="hidden"  id="sourcingReqItemIds_${loop.count}" name="sourcingReqItemIds" class="sourcingReqItemIds" value="${subItemDetails.sourcingReqItemId}"/>
	                              	  <c:if test="${subItemDetails.bidPer eq PERUNIT}">
		                           		<input type="hidden" value="1" id="quantityMultiply_${subItemDetails.sourcingReqItemId}" />
		                       		  </c:if>                          
	                          <input type="hidden"  id="sourcingReqItemName_${subItemDetails.sourcingReqItemId}"   value="${subItemDetails.itemName}"/>
	                              
									  <input type="hidden"  id="sourcingReqItemQuentity_${subItemDetails.sourcingReqItemId}"   value="${subItemDetails.itemQuantity}"/>
                        <div class="form-group clearfix">
                            <label class="col-md-2 col-sm-2 ">Item Name:</label>
                            <div class="col-md-5 col-sm-5 custumrc bdr-ryt-1d">
                           ${subItemDetails.itemName}
                            </div>
                           
                         
                        </div>

                  
                  
                        <div class="form-group clearfix">
                            <label class="col-md-2 col-sm-2 ">Item description:</label>
                            <div class="col-md-5 col-sm-5 custumrc bdr-ryt-1d">
                          ${subItemDetails.itemDescription}
                            </div>
                             <label class="col-md-2 col-sm-2 ">Quantity:</label>
                            <div class="col-md-3 col-sm-3 custumrc ">
								${subItemDetails.itemQuantity}
                            </div>
                         
                        </div>

               
                   
                        <div class="form-group clearfix">
                            <label class="col-md-2 col-sm-2 ">UOM:</label>
                            <div class="col-md-5 col-sm-5 custumrc bdr-ryt-1d">
                       ${subItemDetails.itemUomName}
                            </div>
                              <label class="col-md-2 col-sm-2 ">Price (${REQUISITION_DETAILS.currencyName})</label>
                            <div class="col-md-3 col-sm-3 custumrc bdr-ryt-1d">
                      ${subItemDetails.itemPrice}
                            </div>
                             
                            <%--  <label class="col-md-2 col-sm-2 ">item type:</label>
                            <div class="col-md-3 col-sm-3 custumrc ">
								<c:if test="${subItemDetails.subItemType eq GOODS}">GOODS</c:if>
			                                <c:if test="${subItemDetails.subItemType eq SERVICE}">SERVICE</c:if>
                            </div> --%>
                         
                        </div>

                   
                   <%--  <div class="tender-basic-detail-box clearfix">
                        <div class="form-group clearfix">
                            <label class="col-md-2 col-sm-2 ">Category:</label>
                            <div class="col-md-5 col-sm-5 custumrc bdr-ryt-1d">
                       ${subItemDetails.categoryName}
                            </div>
                             
                         
                        </div>

                    </div> --%><!-- end of tender-basic-detail-box -->
                    
                  
		                           	
		                           	
		                          	
		                           	
		                           	
		                          <div  id="awarding_supp_${subItemDetails.sourcingReqItemId}" style="background-color:#d9d9d9">
		                          <h4>Suppliers</h4>
		                          <input type="hidden" name="subItemIds"   class="subItem" value="${subItemDetails.sourcingReqItemId}"/>
		                           <input type="hidden" name="subItems"   class="subItems" value="${subItemDetails.sourcingReqItemId}"/>
                         <div class="form-group clearfix">
                            <label class="col-md-1 col-sm-1 control-label">supplier:</label>
                               
                         <div class="col-md-3 col-sm-3 custumrc">                         
                          <select  id="userId_${subItemDetails.sourcingReqItemId}_1" name="supplierIds"  class="form-control chosen userIdsData userIds_${subItemDetails.sourcingReqItemId}" surId="${subItemDetails.sourcingReqItemId}" onchange="getPriceOfSupplier(this);">
                          <option value="">Select Supplier</option>
												    <c:forEach var="suppMap" items="${SUPPLIER_LIST}" varStatus="loop" >
						 								<option value="${suppMap.userId}">${suppMap.companyName}&nbsp;&nbsp;(${suppMap.name})</option>
						 						</c:forEach> 
						   </select><a href="javascript:void(0);" id="userId_${subItemDetails.sourcingReqItemId}_1_info" suppDrId="userId_${subItemDetails.sourcingReqItemId}_1" surId="${subItemDetails.sourcingReqItemId}" onClick="getsupplierProfile(this);" title="Supplier Profile" style="display: none;">
	              		
	              		 
	              		
	              		
	              				 <img src="${pageContext.request.contextPath}/catalog-images/help-img.png" style="height: 16px;">
	           				</a>
	           				
	           				<span id="userId_${subItemDetails.sourcingReqItemId}_1_price"></span><span class="price userId_${subItemDetails.sourcingReqItemId}_1_price" priceId="userId_${subItemDetails.sourcingReqItemId}_1_price" style="display: none;"></span>
								   <a href="javascript:void(0);" id="userId_${subItemDetails.sourcingReqItemId}_1_edit" suppDrId="userId_${subItemDetails.sourcingReqItemId}_1" surId="${subItemDetails.sourcingReqItemId}" onClick="getTaxStructure(this);" title="Tax" style="display: none;" >
		                                    		<img src="${pageContext.request.contextPath}/catalog-images/editSmall.png" style="height: 16px;"> 
		                                    		Edit
		                            </a>
	                           		
                                
								<br>	   
								<span id="errorSupplier_${subItemDetails.sourcingReqItemId}_1" style="display:none; color: red;">Please Select Supplier</span>	
								<span id="errorSupplierPrice_${subItemDetails.sourcingReqItemId}_1" style="display:none; color: red;">Please Add Price To Supplier</span>	
		                       <span id="errorSupplierId_${subItemDetails.sourcingReqItemId}_1" style="display:none; color: red;">Supplier is already selected for this item</span>		   
										   
                            </div> 
                           
                           <%-- <label class="col-md-1 col-sm-1 control-label">price:</label>
                            <div class="col-md-2 col-sm-2 custumrc">
		                           <a href="javascript:void(0);" id="userId_${subItemDetails.sourcingReqItemId}_1_edit" surId="${subItemDetails.sourcingReqItemId}" onclick="getTaxStructure(this);" suppDrId="userId_${subItemDetails.sourcingReqItemId}_1" >Add Price Structure</a>	<input type="text" name="prices" class="price positive_allowed price_${subItemDetails.sourcingReqItemId}" id="priceValue_${subItemDetails.sourcingReqItemId}_1" value=""/><br>
		                          <span id="errorPrice_${subItemDetails.sourcingReqItemId}_1" style="display:none; color: red;">Please Enter Price</span>		   
		                      <span id="errorPricePositive_${subItemDetails.sourcingReqItemId}_1" style="display:none; color: red;">Please enter positive numbers</span>		   
                            </div> --%>
                 <div class="documentDiv">        
              <label for="document" class="col-md-1 col-sm-1">Document:</label>
              <div id="supplierdocument_${subItemDetails.sourcingReqItemId}_1" class="supplier-doc-div">
              <input type="hidden" id="supplierDoc_${subItemDetails.sourcingReqItemId}_1" >
             <div class="col-md-2 col-sm-2">
              <div class="fileinput fileinput-new" data-provides="fileinput" id="uploadDiv_${subItemDetails.sourcingReqItemId}_1"> 
              <span class="btn btn-primary btn-file" id="supplier_doc_span_${subItemDetails.sourcingReqItemId}_1">
               <span class="fileinput-new">
                <spring:message code="label.upload" />
                <img class="upload-btn-icon" src="assets/images/blank.png" /> 
                </span>
                 <span class="fileinput-exists">
                <spring:message code="label.add" />
                <img class="upload-add-btn-icon" src="assets/images/blank.png" />
                </span>
                <input type="file"  id="supplierDocuments_${subItemDetails.sourcingReqItemId}_1" class="supplierDocs"  name="supplierDocument" onchange="checkSupplierDocs(this)" data-max-size="52428800">
                <!-- name="tenderDocuments" -->
                <input type="hidden" name="supplierDocNames" id="supplierDocName_${subItemDetails.sourcingReqItemId}_1" value="">
                <input type="hidden" name="supplierDocumentSequenceNos" id="supplier_documents_sequence_no_${subItemDetails.sourcingReqItemId}_1" value="">
                <input type="hidden" name="docFlagStatus" id="docFlagStatus_${subItemDetails.sourcingReqItemId}_1" value="">
                </span>
                <div id="progress_box_${subItemDetails.sourcingReqItemId}_1" class="progress " style="display: none;margin-top: 20px;">
                  <div id="progress_bar_${subItemDetails.sourcingReqItemId}_1" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width:20%"> 40% </div>
                </div>
                <div id="document_upload_error_msg_${subItemDetails.sourcingReqItemId}_1" style="display: none;color: red;">Please upload Supplier Document</div>
                <div class="fileinput-filename"></div>
                <span id="supplier_doc_size_${subItemDetails.sourcingReqItemId}_1"></span>
                 <a href="#" id="delete_supplierDoc_button_${subItemDetails.sourcingReqItemId}_1" class="fileinput-exists deleteDoc" data-dismiss="fileinput" style="float: none" > 
                 <img class="delete-icon" src="assets/images/blank.png"/> </a>
                <div  id="supplier_documents_upload_message_${subItemDetails.sourcingReqItemId}_1" ></div>
              </div>
            </div>
            <div class="col-md-2 col-sm-2  ">
              <button type="button" class="btn btn-primary uploadDocButton" id="supplier_document_upload_button_${subItemDetails.sourcingReqItemId}_1">
              <spring:message code="start.upload" />
              </button>
            </div>
            <div class="col-md-1 col-sm-1"  id="supplier_document_upload_div_${subItemDetails.sourcingReqItemId}_1"  style="display: none;color: red;">
              <spring:message code="upload.documents.msg" />
            </div>
          </div>
           <a href="#" class="blue-link" onclick="addSupplier(event,'awarding_supp_${subItemDetails.sourcingReqItemId}','${subItemDetails.sourcingReqItemId}');"><b>Add Supplier</b></a>
         </div>
         
         <div class="contractDiv" style="display: none;">
           <label for="document" class="col-md-2 col-sm-2 control-label">Contracts:</label>
              <div class="col-md-3 col-sm-3">
              	<select   id="contract_${subItemDetails.sourcingReqItemId}" name="contracts"  class="form-control supplierContracts">
	                <option value="">Select </option>
				   			    
			    </select>
                <span id="errorSupplierContract_${subItemDetails.sourcingReqItemId}" style="color: red;display: none;">Please Select Contract</span>
              </div>
         </div>
          </div>
      </div>
      <hr>
		                          </c:forEach>
		                     </c:if> 
		                     
		     <div class="form-group clearfix">
		         <label for="document" class="col-md-1 col-sm-1 control-label">comments:</label>
                 <div class="col-md-10 col-sm-10">
							
							<div class="row">
							  <textarea rows="5" cols="50" maxlength="2000" name="comments" id="comments" onkeyup="textCount('comments');" name="comment" class="popupTextArea"  placeholder=""></textarea>
							</div>
							<div class="row">
								<span id="comments_count">0</span>/2000	
								</div>
								<div class="row">
								<label id="error_comment_id" style="color:red;display:none;">Please Enter Comments</label>	
							</div>							
				</div>
              </div>                   
		                         
        
        <div class="form-group clearfix">
              <div class="col-md-12 col-sm-12">
              <div class="pull-right">
              
            
               
              
               
	              
	               <button class="btn btn-primary" type="button" id="saveOfflineSourcing">save</button>
	             <button class="btn btn-primary" type="button" id="close">Close</button>
               
            
              
              </div>
              </div>
              </div>   
         </form>
            
               </div></div>           
            </div><!-- end of tender-summary-block -->
          </div>
        </div>
        <!-- multi step container Ends here  --> 
      </div></div></div>
  
  
  <div id="taxStructureModal" class="modal fade" role="dialog">
             <div class="modal-dialog dialogAlign" style="width: 78% !important">
              <div class="modal-content popupAdjust">
               <div class="modal-header fieldspacing">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4 class="modal-title">Tax Edit</h4>
               </div>
			   
			<form id="updateTaxFormId" class="form-horizontal" role="form">
					<input type="hidden" name="suppReqPriceId" id="suppReqPriceId">				    
					<input type="hidden" name="supplierId" id="suppId">				    
					<input type="hidden" name="sourcingReqItemId" id="sourcingReqItemId">				    
					<input type="hidden" name="sourcingReqId" value="${param.sourcingReqId}">				    
					<input type="hidden" name="itemId" value="${param.itemId}">				    
					<input type="hidden" name="priceTempId" id="priceTempId"  >				    
					<input type="hidden" name="priceStructureId" id="priceStructureId"  >	
					<input type="hidden" name="page" value="${param.page}"/>			    
					<input type="hidden" name="quantityMultiply" class="quantityMultiply" />			    
					<input type="hidden" name="quantity" class="quantityMul" />		
					<input type="hidden" id="suppDivId" value="">	    
					<input type="hidden" name="noOfDecimal" value="${NO_OF_DECIMAL}"/>	 
				    <div class="fieldspacing inputfieldspacing col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
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
			                       <th class="thr2-status-log adv-reg-comp-sub-lbl">Value (${REQUISITION_DETAILS.currencyName})</th>
			                       <th class="thr3-status-log adv-reg-comp-sub-lbl">Calculation on</th>
			                       <th class="thr4-status-log adv-reg-comp-sub-lbl">Calculation type</th>
			                       <th class="thr4-status-log adv-reg-comp-sub-lbl">Add/Remove</th>
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
										 	    <input type="text"  name="taxValueName" id="BasePriceId_0" class="adv-reg-popup-textbox commonTaxValue" value=""  placeholder="Enter Base Price" maxlength="11">
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
				                         	 <a href="#"><i class="icon icon-plus sub-plus" onclick="addPriceData(event);"></i></a>
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
					 <button  id="updatesaveTax" type="button" class="btn btn-primary" onclick="updatesaveTax()"><b>Update</b></button>
					 <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
	               </div>
	             </div>
               </div>
              </div>
           </div>
    
    <div id="profileModal" class="modal fade" role="dialog">
             <div class="modal-dialog dialogAlign" style="width: 55% !important">
              <div class="modal-content popupAdjust">
               <div class="modal-header fieldspacing">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4 class="modal-title">Supplier Profile</h4>
               </div>
				    
					<div class="row">								
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="userPersonalInfo container-fluid">
                                        	
                                         <div class="col-lg-12 col-md-12 col-sm-12 ">
                                            
                                            <div class="col-lg-4 col-md-4 col-sm-4 no-padding labelDivider">
                                                <div class="adv-reg-comp-dtls-lbl">
                                                    <label>Name</label>
                                                </div>

                                                <div class="adv-reg-comp-dtls-lbl"id="supplierName">
                                                </div>
                                            </div>
											<div class="col-lg-4 col-md-4 col-sm-4 no-padding labelDivider">

                                                <div class="adv-reg-comp-dtls-lbl">
                                                   <label>Designation</label>
                                                </div>

                                                <div class="adv-reg-comp-dtls-lbl"id="desig">
                                                </div>
										
                                        </div>
											
										</div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 ">
                                            
                                            <div class="col-lg-4 col-md-4 col-sm-4 no-padding labelDivider">
                                                <div class="adv-reg-comp-dtls-lbl">
                                                    <label>Mobile No.</label>
                                                </div>

                                                <div class="adv-reg-comp-dtls-lbl"id="mobile">
                                                </div>
                                            </div>
											<div class="col-lg-4 col-md-4 col-sm-4 no-padding labelDivider">

                                                <div class="adv-reg-comp-dtls-lbl">
                                                   <label> Email Id</label>
                                                </div>

                                                <div class="adv-reg-comp-dtls-lbl"id="email">
                                                </div>
										
                                        </div>
											
										</div>
										
									<div class="col-lg-12 col-md-12 col-sm-12 ">
                                       <div class="col-lg-4 col-md-4 col-sm-4 no-padding labelDivider">
                                                <div class="adv-reg-comp-dtls-lbl">
                                                  <label>Pan no.</label> 
                                                </div>
                                                <div class="adv-reg-comp-dtls-lbl" id="pan_no">
                                                </div>
                                            </div> 
                                            <div class="col-lg-4 col-md-4 col-sm-4 no-padding labelDivider">

                                                <div class="adv-reg-comp-dtls-lbl">
                                                   <label>Address</label>
                                                </div>

                                                <div class="adv-reg-comp-dtls-lbl" id="address">
                                                </div>
										
                                        </div>
                                    </div>
                                </div>
                            </div>
						</div>
            		
					
	             <div class="modal-footer">
	               <div align="center">
					 <!-- <button  id="updatesaveTax" type="button" class="btn btn-default" onclick="updatesaveTax()"><b>Update</b></button> -->
	               </div>
	             </div>
               </div>
             
              </div>
           </div>
           
           
           
              <div id="confirmModal" class="modal fade" role="dialog">
              <div class="modal-dialog dialogAlign" style="width: 78% !important">
              <div class="modal-content popupAdjust">
              
              <div class="modal-header fieldspacing">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
                 <h4 class="modal-title">Do you want to proceed</h4>
               </div>
              
              
  
    <!-- Modal content-->
  
    
     
 <div id="modalBody">

 
  </div>
      <div class="modal-footer">
       <button type="button" id="submitModal" class="btn btn-primary" data-dismiss="modal">Submit</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
  
  
  </div>
  </div>
</div> 
           
           
 
<form id="close_tender_form">
<input type="hidden" name="token" value="<%=RequestTokenUtil.getLatestToken()%>"/>
<input type="hidden" id="item_Id" name="itemId" value="${param.itemId}">
<input type="hidden" id="openType" name="openType" value="">
<input type="hidden" name="tenderId"   id="tender_Id" value="${TENDER_ITEM.tenderId}">
</form>
       
  <form id="missed_Tender_form">
  <input type="hidden" name="tenderId" id="tender_Id" value="">
  </form>
  
</section>
 <form id="close_Forms">
<input type="hidden" name="itemId" id="item_Id" value="${param.itemId}">
<input type="hidden" name="tenderId"   id="tender_Id" value="${TENDER_ITEM.tenderId}">

</form>

<form id="close_Forms_template">
<input type="hidden" name="itemId" id="item_Id" value="${param.itemId}">
<input type="hidden" name="tenderId"   id="tender_Id" value="${TENDER_ITEM.tenderId}">

<input type="hidden" id="quick_tender_template_id" name="quick_tender_template_id" value="${quick_template_id}"/>

</form>


 <form id="view_form">
<input type="hidden" id="view_form_tender_id"   name="tenderId" value="">
</form>

<form id="view_temp_details">
<input type="hidden" name="tenderId" value="" id="tender_Id">
<input type="hidden" name="itemId" value="" id="item_Id">
<input type="hidden" id="coverNo" name="coverNo" value="">
<input type="hidden" id="docFileName" name="fileName" value="">
<input type="hidden" id="docId" name="docId" value=""/>
</form>

<form class="form-horizontal" name="addendumForms" id="addendumDetailForms">
<input type="hidden" name="itemId" id="itemIdss" value="">
<input type="hidden" name="citemId" id="citemIdss" value="">
</form>

<form id="download_pre_bid_meeting_docs">
	<input type="hidden" id="pre_bid_file_name" name="fileName" value="">
	<input type="hidden" id="pre_bid_doc_id" name="docId" value="">
	<input type="hidden" name="itemId" id="itemsIds" value="">
	<input type="hidden" name="tenderId" id="tenderId" value="${TENDER_ITEM.tenderId}">
</form>
 <form class="form-horizontal" name="raiseAmendmentForm" id="raiseAmendmentForm">
		<input type="hidden" name="itemId" value="${param.itemId}" id="item_id">
		<input type="hidden" name="tenderId" id="tender_Id" value="${TENDER_ITEM.tenderId}">
		<input type="hidden" name="viewType" id="viewType" value="">
		<input type="hidden" name="page" id="page" value="">
		<input type="hidden" name="loginFrom" id="loginFrom" value="mainForm">
		<input type="hidden" name="token" value="<%=RequestTokenUtil.getLatestToken()%>">
   </form>

<form id="k">
       <input type="hidden" name="itemId" id="itemIds" value=""> 
       <input type="hidden" name="fileName" id="fileName" value="">
</form>


<form id="startEvalForm">
<input type="hidden" id="itemId"   name="itemId" value="${TENDER_ITEM.itemId}">
<input type="hidden" id="stageChange"   name="stage">
<input type="hidden" id="token" name="token" value="<%=RequestTokenUtil.getLatestToken()%>">
</form>
<form id="convertSourcingReq">
<input type="hidden"   name="sourReqId" value="${REQUISITION_DETAILS.sourcingReqId}">
<input type="hidden"  name="token" value="<%=RequestTokenUtil.getLatestToken()%>">
</form>
<!-- container ends here --> 
<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/engine.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/util.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dwr/interface/TenderDwrRequestHandler.js"></script> 
<script>

dwr.engine.setAsync(false);
var contextPath='<%=request.getContextPath()%>';


/*   $(".userIdsData").chosen({
		 
});   */

jQuery(document).ready(function(){
	jQuery(".chosen").chosen();
});
 

$("#common_supplier").chosen({
	
});


$("#common_contract_div").hide();




function getContracts(){
	
	var supplierId=$("#common_supplier").val();
	
	if(supplierId!=""){
		
		
		TenderDwrRequestHandler.getSupplierContracts(supplierId,{async:false,callback:function(data){
			populateJQuerySelectBox("common_contract",data);
		 }});
	}else{
		$("#common_contract").empty();
		$("#common_contract").append("<option value=''>Select</option>");
	}
	
	
	
	
	
}


function populateJQuerySelectBox(select_box_id,data_map,select_box_header){
	
	if($("#"+select_box_id)!=null && $("#"+select_box_id) != undefined ){
		$("#"+select_box_id).empty();
		if(select_box_header==undefined) $("#"+select_box_id).append("<option value=''>Select</option>");
		else $("#"+select_box_id).append("<option value=''>"+select_box_header+"</option>");
	
		
		if(data_map!=null){
			
			//var keys=Object.keys(data_map);
			if(data_map.length>0){
				
				for(var i=0;i<data_map.length;i++){
					$("#"+select_box_id).append("<option value='" +data_map[i].contractId + "'>" +data_map[i].contractTitle+"("+data_map[i].contractNo+ ")</option>");
				}
			}
		}
	
	}
}


var count=0;

var index=1;
function addSupplier(event,id,subitemId){

	
	
	 index++;
	 
	 var userid="userId_"+subitemId+"_"+index;
	 var priceValue = "priceValue_"+subitemId+"_"+index;
	
	
	 var erroruserid="errorSupplier_"+subitemId+"_"+index;
	 var errorsupplierId="errorSupplierId_"+subitemId+"_"+index;
	 var errorPrice="errorPrice_"+subitemId+"_"+index;
	 var errorSupplierPrice="errorSupplierPrice_"+subitemId+"_"+index;
	
	 var price="price positive_allowed price_"+subitemId;
	 var errorPricePositive="errorPricePositive_"+subitemId+"_"+index;
	 var userIdClass="form-control chosen userIdsData userIds_"+subitemId;
	 
	
	 var addRowSup="supp_Id_"+count;
	 var subItemIdIndex=subitemId+"_"+index;
	
	 var content= '<div id="'+addRowSup+'">'
               +'<input type="hidden" name="subItemIds"   class="subItem" value="'+subitemId+'"/>'
               +'<input type="hidden" name="contracts" value="">'
                 +'<div class="form-group clearfix">'
                 +'<label class="col-md-1 col-sm-1 control-label">supplier:</label>'
                 +'<div class="col-md-3 col-sm-3 custumrc">'

                +'<select  id="'+userid+'" name="supplierIds" surId="'+subitemId+'"  class="'+userIdClass+'" onchange="getPriceOfSupplier(this);" >'
                +'<option value="">Select Supplier</option>'
                +' <c:forEach var="suppMap" items="${SUPPLIER_LIST}" varStatus="loop" >'
			   +'<option value="${suppMap.userId}">${suppMap.companyName}&nbsp;&nbsp;(${suppMap.name})</option>'
			   +'</c:forEach>'  
		        +'</select> <a href="javascript:void(0);" id="'+userid+'_info" suppDrId="'+userid+'" surId="'+subitemId+'" onClick="getsupplierProfile(this);" title="Supplier Profile" style="display: none;" > '
         		+'<img src="${pageContext.request.contextPath}/catalog-images/help-img.png" style="height: 16px;"></a><span id="'+userid+'_price"></span> <span class="price '+userid+'_price" priceId="'+userid+'_price" style="display: none;"></span> '
		        
		        +'<a href="javascript:void(0);" id="'+userid+'_edit" suppDrId="'+userid+'" surId="'+subitemId+'" onClick="getTaxStructure(this);" title="Tax" style="display: none;" > '
        		+'<img src="${pageContext.request.contextPath}/catalog-images/editSmall.png" style="height: 16px;">Edit</a><br>'
		        
				+'<span id="'+erroruserid+'" style="display:none; color: red;">Please Select Supplier</span>'		 
				+'<span id="'+errorSupplierPrice+'" style="display:none; color: red;">Please Add Price To Supplier</span>	'

                +'<span id="'+errorsupplierId+'" style="display:none; color: red;">Supplier is already selected for this item</span>'		   
                +'</div> '
                +'  <div class="documentDiv"> '
              +' <label for="document" class="col-md-1 col-sm-1">Document:</label>'
              +' <div id="supplierdocument_'+subItemIdIndex+'" class="supplier-doc-div">'
              +' <input type="hidden" id="supplierDoc_'+subItemIdIndex+'" value="">'
              +' <div class="col-md-2 col-sm-2">'
              +' <div class="fileinput fileinput-new" data-provides="fileinput" id="uploadDiv_'+subItemIdIndex+'"> <span class="btn btn-primary btn-file" id="supplier_doc_span_'+subItemIdIndex+'"> <span class="fileinput-new">'
              +' Upload'
              +' <img class="upload-btn-icon" src="assets/images/blank.png" /> </span> <span class="fileinput-exists">'
              +' Add '
              +' <img class="upload-add-btn-icon" src="assets/images/blank.png"/></span>'
              +' <input type="file" name="supplierDocument" class="supplierDocs" id="supplierDocuments_'+subItemIdIndex+'" onchange="checkSupplierDocs(this)" data-max-size="52428800"/>'
              +' <input type="hidden" name="supplierDocNames" id="supplierDocName_'+subItemIdIndex+'" value="">'
              +' <input type="hidden" name="supplierDocumentSequenceNos" id="supplier_documents_sequence_no_'+subItemIdIndex+'" value="">'
              +' <input type="hidden" name="docFlagStatus" id="docFlagStatus_'+subItemIdIndex+'" value="">'
              +' </span>'
              +' <div id="progress_box_'+subItemIdIndex+'" class="progress" style="display: none;margin-top: 20px;">'
              +' <div id="progress_bar_'+subItemIdIndex+'" class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width:20%"> 40% </div>'
              +' </div>'
              +' <div id="document_upload_error_msg_'+subItemIdIndex+'" style="display: none;color: red;">Please upload Supplier Document</div>'
              +' <div class="fileinput-filename"></div>'
              +' <span id="supplier_doc_size_'+subItemIdIndex+'"></span> <a href="#" id="delete_supplierDoc_button_'+subItemIdIndex+'" class="fileinput-exists deleteDoc" data-dismiss="fileinput" style="float: none"> <img class="delete-icon" src="assets/images/blank.png"/> </a>'
              +' <div  id="supplier_documents_upload_message_'+subItemIdIndex+'" ></div>'
              +' </div>'
              +' </div>'
              +' <div class="col-md-2 col-sm-2  ">'
              +' <button type="button" class="btn btn-primary uploadDocButton" id="supplier_document_upload_button_'+subItemIdIndex+'">'
              +' Start Upload '
              +' </button>'
              +' </div>'
              +' <div class="col-md-1 col-sm-1"  id="supplier_document_upload_div_'+subItemIdIndex+'"  style="display: none;color: red;">'
              +' Please upload document '
              +' </div>'
              +' </div>'
              +' <a href="#" class="blue-link removeSuppDataContent" onclick="removeData(event,\''+addRowSup+'\');"><b>Remove Supplier</b></i></a>'             
              +' </div>'
              +'</div> '
              +' </div>';
              
              
			$('#'+id).append(content);
			
			
				jQuery(".chosen").chosen();
			
			
			/* $(".userIdsData").chosen({
			}); */
			
			
			
			
			count++;
			event.preventDefault();
  }

function removeData(event,id){
	 //alert("ccccccccc"+id);
	 $('#'+id).remove();
	 index--;
	 event.preventDefault();
}



$("#saveOfflineSourcing").click(function(){
	
	if(validateFields()){
		//$("#confirmModal").modal({backdrop: "static"}); 
		var users=new Array;
		$('.subItems').each(function(){
	var itmId = $(this).val();
	users.push(itmId);
		});
		
		TenderDwrRequestHandler.getOfflineSubmissionStatus(users,{async:false,callback:function(data){
		if(data){
			showConfirmModal();
		}else{
			alert("You have already submitted this items.");
		}
		
		
		}});
	/* 	$('#awardForm').attr("method","POST");
		$('#awardForm').attr("action","saveSourcingOfflineDetails");
		$('#awardForm').submit();   */
	}
});




$("#close").click(function(){
	$('#convertSourcingReq').attr("method","GET");
	$('#convertSourcingReq').attr("action","getSourcingRequisitionDetails");
	$('#convertSourcingReq').submit();
	
});


function setOfflineType(){
	$("#offline_type_form").val($("#offline_type").val());
	
	if($("#offline_type").val()=="2"){
		$("#common_contract_div").show();
		$("#supplier_common_document").hide();
		$(".documentDiv").hide();
		$(".contractDiv").show();
	}else{
		$("#common_contract_div").hide();
		$("#supplier_common_document").show();
		$(".documentDiv").show();
		$(".contractDiv").hide();
	}
	
}


function validateFields(){
	var status = true;
	
	if($("#offline_type").val()==''){
		status=false;
		$("#error_offline_type").show();
	}else{
		$("#error_offline_type").hide();
	}
	
	
	

	if($("#offline_type").val()=='2'){
		
		
		$('.userIdsData').each(function(){
			
			
			var indx=$(this).attr("id").split("_")[1];
			var indx1=$(this).attr("id").split("_")[2];
			
			//alert("indx=="+indx)
			var index = 	indx+"_"+indx1;
		
			
				if($('#userId_'+index).val()==""){
					status=false;
					
					
					$('#errorSupplier_'+index).show();
				}else{
					
					//alert("33333"+$('#techDocSequenceNos_'+indx).val());
					$('#errorSupplier_'+index).hide();
				}
			
		});
		


if($("#common_contract").val() == ""){

	$(".supplierContracts").each(function(){
		var id = $(this).attr('id');
	var itemId = id.split("_")[1];
		if($("#"+id).val() == ""){
			status=false;
			$('#errorSupplierContract_'+itemId).show();
		}else{
			$('#errorSupplierContract_'+itemId).hide();
		}
		
	});
	
	
	
}




	if(status){
		
		
		$('.price').each(function(){
			
			
			var indx=$(this).attr("priceId").split("_")[1];
			var indx1=$(this).attr("priceId").split("_")[2];
			
			var index = 	indx+"_"+indx1;
				if($(this).text()=="0" || $(this).text()==""){
					status=false;
					
					
					$('#errorSupplierPrice_'+index).show();
				}else{
					
					//alert("33333"+$('#techDocSequenceNos_'+indx).val());
					$('#errorSupplierPrice_'+index).hide();
				}
			
		});
		
		
			 $('.sourcingReqItemIds').each(function(){
				 var id=$(this).attr("id");
				
					var itemId = $('#'+id).val();
				 var userArr = [];
			if(status){	 
				 $('.userIds_'+itemId).each(function(){
					 var indx=$(this).attr("id").split("_")[1];
						var indx1=$(this).attr("id").split("_")[2];
						var index = indx+"_"+indx1;
					 userArr.push($('#userId_'+index).val());
					 
				 });
				 
				 if(userArr!= null && userArr.length==1){
					 if($("#comments").val() == ""){
						 status = false;
							$("#error_comment_id").show();
						}
				 }else{
					 $("#error_comment_id").hide();
				 }
			} 
			 });
		
		
	}
	
	}else{
	
$('.userIdsData').each(function(){
		
	
		var indx=$(this).attr("id").split("_")[1];
		var indx1=$(this).attr("id").split("_")[2];
		
		//alert("indx=="+indx)
		var index = 	indx+"_"+indx1;
	
		
			if($('#userId_'+index).val()==""){
				status=false;
				
				
				$('#errorSupplier_'+index).show();
			}else{
				
				//alert("33333"+$('#techDocSequenceNos_'+indx).val());
				$('#errorSupplier_'+index).hide();
			}
		
	});
	

if($("#reqSupplierDocSequenceNos").val()==""){
	
$('.supplierDocs').each(function() {
	 var id=$(this).attr('id');
	 var index=id.split('_')[1]+"_"+id.split('_')[2]; 
	// alert("index===="+index);
		if(($('#userId_'+index).val()!="" || $('#priceValue_'+index).val()!="") && $("#supplierDocName_"+index).val()==""){
			status=false;
			$("#document_upload_error_msg_"+index).show();
		}else{
			$("#document_upload_error_msg_"+index).hide();
		}
});

if(status==false){
	
	$("#document_upload_error_msg").show();
}


}else{
	
	$('.supplierDocs').each(function() {
		 var id=$(this).attr('id');
		 var index=id.split('_')[1]+"_"+id.split('_')[2]; 
		
				$("#document_upload_error_msg_"+index).hide();
			
	});
	
	$("#document_upload_error_msg").hide();
}





if(status){
	
	
	$('.price').each(function(){
		
		
		var indx=$(this).attr("priceId").split("_")[1];
		var indx1=$(this).attr("priceId").split("_")[2];
		
		var index = 	indx+"_"+indx1;
			if($(this).text()=="0" || $(this).text()==""){
				status=false;
				
				
				$('#errorSupplierPrice_'+index).show();
			}else{
				
				//alert("33333"+$('#techDocSequenceNos_'+indx).val());
				$('#errorSupplierPrice_'+index).hide();
			}
		
	});
	
	 
	 $('.sourcingReqItemIds').each(function(){
			var id=$(this).attr("id");
			/* var indd=$(this).attr("id").split("_")[1];
			var subitemName = $("sourcingReqItemName_"+indd).val(); */
			var itemId = $('#'+id).val();
			
			var userArray = [];
			
			$('.userIds_'+itemId).each(function(){
				var indx=$(this).attr("id").split("_")[1];
				var indx1=$(this).attr("id").split("_")[2];
				var index = indx+"_"+indx1;
				
				if($('#userId_'+index).val()!=""){
				 if(userArray.indexOf($('#userId_'+index).val()) > -1){
					 status = false;
					 $('#errorSupplierId_'+index).show();
					 
				 }else{
					 userArray.push($('#userId_'+index).val());
					 $('#errorSupplierId_'+index).hide();
				 }
					
				}
			
				
			});
			
		});
		
		
		 $('.sourcingReqItemIds').each(function(){
			 var id=$(this).attr("id");
			
				var itemId = $('#'+id).val();
			 var userArr = [];
		if(status){	 
			 $('.userIds_'+itemId).each(function(){
				 var indx=$(this).attr("id").split("_")[1];
					var indx1=$(this).attr("id").split("_")[2];
					var index = indx+"_"+indx1;
				 userArr.push($('#userId_'+index).val());
				 
			 });
			 
			 if(userArr!= null && userArr.length==1){
				 if($("#comments").val() == ""){
					 status = false;
						$("#error_comment_id").show();
					}
			 }else{
				 $("#error_comment_id").hide();
			 }
		} 
		 });
	
	
	
}	
	
	
}

return status;
}
function isNumeric(val){
	 val = $.trim( val );
	if(val.indexOf("+")>= 0)
		return false;
return $.isNumeric(val);
	
}

function isGreaterThanZero(val){
	val=$.trim( val );
	if ((val)<=0){
		return false;
	}else{
		return true;
	}
}


var globalUploadLock=true;

$(document).on('click', '.uploadDocButton', function () {
	var id=$(this).parents('.supplier-doc-div').find('.supplierDocs').attr('id');
	//alert(id);
	var index=id.split('_')[1]+"_"+id.split('_')[2];
	 //alert("index:::"+index);
	 
	 
	 
		if(globalUploadLock==true){
			globalUploadLock = false;
			var completeSupplierDocStatus = false;
			var input = $("#supplierDocuments_"+index);
			var result=false;
			//$("#delete_supplierDoc_button_"+index).css("display","none");
			var oMyForm = new FormData(); 
		 	if(!input.val()==''){
				var file_show=getFileSize(input);      
				$("#supplier_doc_size_"+index).text(file_show);
	 			oMyForm.append("document", input.get(0).files[0]); 
	 			//alert(input.get(0).files[0].name);
		   		oMyForm.append("documentType", 1); 
		   		var path=contextPath+"/uploadOfflineSourcingDocument";
		   		$.ajax({
		   			xhr: function () {
		   		        var xhr = new window.XMLHttpRequest();
		   		        xhr.upload.addEventListener("progress", function (evt) {
		   			        if (evt.lengthComputable) {
		   			                var percentComplete = evt.loaded / evt.total;
		   			                console.log(percentComplete);
		   			                $("#progress_bar_"+index).width((percentComplete * 100).toFixed() + '%');
		   							$("#progress_bar_"+index).html((percentComplete * 100).toFixed() + '%');
		   			            }
		   			        }, false);
	   			          return xhr;
		   			    },
		   				url: path,
		   			    data: oMyForm,
		   			    dataType: 'text',
		   			    processData: false,
		   			    contentType: false,
		   			    type: 'POST',
		   			    success: function(data){ 
		   			    	var myJSON = JSON.parse(data);
					    	$("#supplier_documents_sequence_no_"+index).val(myJSON[1]);
					    	//alert("antivirus Status"+myJSON[0]);            					    	
				    		
					    	if(myJSON[0]=="PASSED"){ 
					    	if(myJSON[1]!=""){           		   			    
		   			    		$("#document_upload_error_msg_"+index).hide();
		   			    		$("#supplier_document_upload_button_"+index).hide();
		   			    		$("#supplier_document_upload_div_"+index).hide();
		   			    		$("#supplierDocName_"+index).val(input.get(0).files[0].name);
		   			    		if(myJSON[0]!='PASSED'){
		   			    			
					    			$('#delete_supplierDoc_button_'+index).trigger('click');
					    			$("#docFlagStatus_"+index).val(true);	    			
					    		}else{
		   			    		completeSupplierDocStatus = true;
		   			    		result=true;
					    		}
		   			    	}
					    	}else{
					    		
				    			$("#docFlagStatus_"+index).val(true);	
		   			    		}
		   			    	
		   			      },
		   			      beforeSend : function() {
		   						$("#progress_bar_"+index).width('0%');
		   						$("#progress_bar_"+index).html("0%");
		   						$("#progress_box_"+index).show();
		   						
		   				  },
		   				  complete : function(response) {
				   					if(completeSupplierDocStatus == true){
				   						if(result){
				   							$("#progress_box_"+index).hide();
				   							$("#delete_supplierDoc_button_"+index).css("display","");
				   							$("#supplier_doc_span_"+index).hide();
					   						$("#supplier_documents_upload_message_"+index).html("<font color='blue'>Your file has been uploaded!No Virus detected</font>");
				   						}else{
				   							$("#delete_tender_button_"+index).css("display","");
			   								$("#supplier_documents_upload_message_"+index).html("<font color='red'> Error : Unable to upload file,please check internet connection.</font>");	
			   							} 
				   					}else{
			   							if($("#docFlagStatus_"+index).val()){
			   								$("#supplier_doc_size_"+index).empty();
			   								
			   								$("#delete_supplierDoc_button_"+index).trigger('click');
			   								$("#supplier_doc_span_"+index).show();
			   							 $("#progress_box_"+index).hide();
											$("#supplier_documents_upload_message_"+index).html("<font color='red'> Error :Virus detected! Please upload new file</font>");
										} 
			   							else{
   										alert("No Net Connection");
   									}
				   					}
			   						globalUploadLock = true;
		   					},
		   					error : function() {
		   						globalUploadLock = true;
		   						$("#delete_supplierDoc_button_"+index).css("display","");
		   						$("#supplier_documents_upload_message_"+index).html("<font color='red'> Error : Unable to upload file,please check internet connection.</font>");
		   					}
		   				});
		         }else{
		        	globalUploadLock = true;
			 		$("#delete_supplierDoc_button_"+index).css("display","");
			 		alert("Please upload file");
		 		}
			  }else{
				alert("File Uploading is in progress");
			}
	}); 

$(document).on('click', '.deleteDoc', function () {
	var id=$(this).parents('.supplier-doc-div').find('.supplierDocs').attr('id');
	var index=id.split('_')[1]+"_"+id.split('_')[2]; 
	//alert("index1::"+index);
	 $("#progress_box_"+index).hide();
		var oMyForm = new FormData(); 
		$("#supplierDocuments_"+index).val("");
		//$("#supplier_doc_span_"+index).show();
				 oMyForm.append("sequenceNumber", $("#supplier_documents_sequence_no_"+index).val()); 
				 var path=contextPath+"/deleteOfflineSourcingDocument";
					$.ajax({
						url: path,
					    data: oMyForm,
					    dataType: 'text',
					    processData: false,
					    contentType: false,
					    type: 'POST',
					    success: function(data){
					    	globalUploadLock=true;
					    }
					});
				$("#supplier_document_upload_button_"+index).show();
		    	$("#supplier_documents_sequence_no_"+index).val("");
		    	$("#supplierDocName_"+index).val("");
		    	$("#supplier_documents_upload_message_"+index).empty();
				$("#progress_bar_"+index).width('0%');
				$("#progress_bar_"+index).html("0%");
				$("#supplier_doc_size_"+index).empty();
				$("#supplier_doc_span_"+index).show();
});
		

/* $('.supplierDocs').change(function(){
	var id=$(this).parents('.supplier-doc-div').find('.supplierDocs').attr('id');
	var index=id.split('_')[1]+"_"+id.split('_')[2]; 
	var filename = $(this).val();
	var fileInput = $(this);
	var maxSize = fileInput.data('max-size');
	var fileSize = fileInput.get(0).files[0].size; // in bytes
	if(filename!=''){
	 if(filename.length>200){
		alert('File name is too large');
	            this.value='';
	 }if (!testFileName(filename)) {
		 alert('Please select .xlsx |.doc |.docx  |.xls |.pdf|.XLSX|.DOC|.DOCX|.XLS|.PDF|.ZIP|.DWG|.msg|.jpeg|.jpg|.png file');
         this.value='';
	 }if(fileSize>maxSize){
	     alert('File size is more than ' + maxSize/(1024*1024) + ' MB is not allowed');
	            this.value='';
	 }if(fileSize==0){        	
	      alert("File size should be greater than 0");
		  this.value='';
	 } else {
		 var ck_fName =/[-',+#%&"\/]/;
			 if (ck_fName.test(filename)) {
				 this.value='';
				 alert("Please Enter Valid File Name without this special characters([-',+#%&\/]) and double quotes");
				 }
	 }
	 
	 
	 alert($("#supplierDocuments_"+index).val());
	 
	 if($("#supplierDocuments_"+index).val()!=''){
		 alert("in");
	       $("#supplier_doc_span_"+index).hide();
	 } 
  } 
}); */
 
 function testFileName(filename){
		return /\.xlsx|.doc|.docx|.xls|.pdf|.XLSX|.DOC|.DOCX|.XLS|.PDF|.msg|.MSG|.zip|.ZIP|.DWG|.dwg|.gif|.jpeg|.jpg|.png|.GIF|.JPEG|.JPG|.PNG$/.test(filename);
	}

 
 function getFileSize(input){  
	    var maxSize = input.data('max-size');
		var fileSize = input.get(0).files[0].size; // in bytes
		var fileSizeFloat=parseFloat(fileSize);
	    var filesizeInKB =    fileSizeFloat/1024.00;
		var file_show;
		if
		(filesizeInKB<1024.00)
		{
			file_show='('+filesizeInKB.toFixed(2)+"KB"+')';
		}else{
			var filesizeInKB=filesizeInKB/1024.00;
			file_show='('+filesizeInKB.toFixed(2)+"MB"+')';
		}
		
		return file_show;
	}
 $(document).ready(function(e) {
		global_price_component_list=${MASTER_PRICE_COMP_LIST};
		//alert(global_price_component_list);
	});
 var global_price_component_list=null;
 var id_index		= 1;
 function getTaxStructure(thiss){
		var suId =$(thiss).attr('suppDrId');
		var itemId =$(thiss).attr('surId');
		var suppId=$("#"+suId).val();
		$("#sourcingReqItemId").val(itemId);
		var formId="updateTaxFormId";
		$('.secondRow').remove();
		$("#"+formId +" #BasePriceId_0").val("");
		$("#"+formId +" #tsPoItemId").val(itemId);
		$("#"+formId +" #suppId").val(suppId);
		
		var quaMul=$("#quantityMultiply_"+itemId).val();
		var quaMul1=$("#sourcingReqItemQuentity_"+itemId).val();
		$(".quantityMul").val(quaMul1);
		if(quaMul=="1"){
		$(".quantityMultiply").val(1);
		}else{
		$(".quantityMultiply").val(0);
		}
		TenderDwrRequestHandler.getItemTaxStructure(itemId,suppId,{async:false,callback:function(data){
			
			if(data!=null){
				if(data.length>0){
					
					$("#"+formId +" #BasePriceId_0").val(data[0].taxValue);
					$("#"+formId +" #suppReqPriceId").val(data[0].suppReqPriceId);
					$("#"+formId +" #priceTempId").val(data[0].priceTempId);
					$("#"+formId +" #priceStructureId").val(data[0].priceStructureId);
					
					for(var i=1;i<=((data.length)-1);i++){
				             
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
			        		 	+ ' 	<input type="text" id="taxValueId_'+id_index+'"  name="taxValueName" class="adv-reg-popup-textbox commonTaxValue" value="" placeholder=""> '
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
			        	    	+ ' 		<option value="${DECREMENT}">Decremeant</option> '
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
				 			//alert(data[i].masterCompId);
				 			$('#'+price_label_select_boxId).val(data[i].masterCompId);
				 			$('#'+price_type_id).val(data[i].compType);
				 			$('#taxValueId_'+id_index).val(data[i].taxValue);
				 			$('#'+calculation_on_select_boxId).val(data[i].calcOn);
				 			$('#'+calculation_type).val(data[i].calcType);
					}
				}
			}
			
		}});
		
		$("#suppDivId").val(suId);
		$('#updatesaveTax').show();
		$("#taxStructureModal").modal({backdrop: "static"});
	 
	}
 
 
 $(document).on('click','.removePriceDataContent',function(event){
		event.preventDefault();
		$(this).parents('.secondRow').remove();	
		return false;
	});
 
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
			 	+ ' 	<input type="text" id="taxValueId_'+id_index+'"  name="taxValueName" class="adv-reg-popup-textbox commonTaxValue" value="" placeholder=""> '
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
		    	+ ' 		<option value="${DECREMENT}">Decremeant</option> '
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
 				
 			//	console.log("priceComp.masterCompId="+priceComp.masterCompId);
 			//	console.log("priceComp.compName="+priceComp.compName);
 				if($.inArray(priceComp.masterCompId, selectedBasePrice)==-1){				
 					$("#"+formId+" #"+dynamic_select_box_id).append("<option value='" +priceComp.masterCompId + "'>" +priceComp.compName+ "</option>");
 				}
 			}
 		}
 		$("#"+formId+" #"+dynamic_select_box_id).change(function(){
 			
 			if($(this).val()){
 				for(var i=0;i<data_list.length;i++){
 					var priceComp=data_list[i];
 					console.log("priceComp.MasterCompId="+priceComp.masterCompId);
 					console.log("priceComp.compType="+priceComp.compType);
 					if(priceComp.masterCompId==$(this).val()){
 						if(priceComp.compType==0){
 							$("#"+formId+" #"+dynamic_price_type_id).val(0);
 						}							
 						if(priceComp.compType==1){
 							$("#"+formId+" #"+dynamic_price_type_id).val(1);
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
 					//console.log("priceComp.masterCompId="+priceComp.masterCompId+"="+$.inArray(priceComp.masterCompId, selectedBasePrice));
 					if($.inArray(priceComp.masterCompId, selectedBasePrice)!=-1){
 						$("#"+formId+" #"+dynamic_select_box_id).append("<option value='" +priceComp.masterCompId + "'>" +priceComp.compName+ "</option>");
 					}
 				}
 			}
 	}		
 }

 function updatesaveTax() {
		var res = componentValidation();
		
		var suppDivId = $("#suppDivId").val();
		if(res==false){
			
			if(confirm("Are you sure you want to update tax structure ?")){
				
				$('#updatesaveTax').hide();
				
				$(".commonPriceType").each(function(){
					var id = $(this).attr('id');
					var innerIndex = id.split("_")[1];
					$("#priceTypeId_"+innerIndex).attr('disabled',false);
				});
				
				
				
				
				
				
				var form = $('#updateTaxFormId');
				 
				var path=contextPath+"/offlineUpdateTaxstructureDetailsForSourcing";
				$.ajax({
				 	url: path,
			    	data: form.serialize(),
			    	dataType: 'text',
			    	type: 'POST',
			    	success: function(data){ 
			    		
			    		
			    		 $("."+suppDivId+"_price").text(data); 
						 $("#"+suppDivId+"_price").text("This Supplier Price is :"+data); 
						 $("#taxStructureModal").removeClass("fade").modal("hide"); 
			     	}
			      
				}); 
				
				
				
		/* 	  $("#updateTaxFormId").attr('method','POST');
				$("#updateTaxFormId").attr('action','offlineUpdateTaxstructureDetailsForSourcing');
				$("#updateTaxFormId").submit();  */ 
				
				
				
				
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
		}else if(!validateDecimalPoint(Number($("#BasePriceId_0").val()))){
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
 function onlyNumeric(value) {
	 var pattern=/^\d{0,8}(\.\d{1,2})?$/g;
	if(value!=""){
		return pattern.test(value);
   }else{
   	return false;
   }
   return false;
}
 function getPriceOfSupplier(thiss){
		var sourItemId =$(thiss).attr('surId');
		var id=$(thiss).attr('id');
		var suppDocDiv=$(thiss).attr('suppDocDiv');
		var suppId=$("#"+id).val();
			var indx1=$(thiss).attr("id").split("_")[2];
			
			
			$("#errorSupplierId_"+sourItemId+'_'+indx1).hide();
			
		if(suppId!=undefined && suppId!="")
		{
		
			$("#"+id+"_price").text("");
			$("."+id+"_price").text("0");
			$("#"+id+"_edit").hide();
			$("#"+id+"_info").hide();
			
			var sourcReqId = $("#sourcReqId").val();
			
			//TenderService.getAllSupplierItemsTotalPriceMapByDwr(sourcReqId,{async:false,callback:function(data){
			TenderDwrRequestHandler.getAllSupplierItemsTotalPriceMapByDwr(sourcReqId,{async:false,callback:function(data){
				
				var data1 = JSON.parse(data);
				
				 if(data1 != null){
				
				var map2=data1[sourItemId];
				var price=0;
				if(map2!=undefined){
				if(map2[suppId]!=undefined){
					var docName=map2[suppId].docName;
					var docSize=map2[suppId].docSize;
					var priceId=map2[suppId].supplierPriceId;
					price=Number(map2[suppId].supplierPrice).toFixed(${NO_OF_DECIMAL}); 
				}
				}
				
				if(price!=0){
					$("."+id+"_price").text(price);
				$("#"+id+"_price").text("This Supplier Price is :"+price);
				}
				else{
					$("."+id+"_price").text("0");
					$("#"+id+"_price").text("Please Enter Supplier Price");
				}
				$("#"+id+"_edit").show();
				$("#"+id+"_info").show();
				
				} 
				
			}});
			
			
			
			
			
			
			
			
		
			
			
			
			if('${SOURCING_BASIC_INFO.sourcingType}'==3){
		var doc='<div class="form-group clearfix doc_div_'+sourItemId+'_'+indx1+' ">'
	    +'<label class="col-md-2 col-sm-2">Supplier Document:</label> '
	    +' <div class="col-md-6 col-sm-6 custumrc">'
	  +'<span>'+docName+'&nbsp;('+docSize+')</span> '
	  +' <a href="javascript:void(0);" title="Download" class="download-blue-icon" onclick="getDownloadOfflineDoc(\''+docName+'\',\''+docSize+'\',\''+priceId+'\');"></a> '		   
	   
	   
	    +'</div> '
	+'</div>';

	$(".doc_div_"+sourItemId+'_'+indx1).remove();
			$("#"+suppDocDiv).append(doc);
			}
			
			
			
			
		}
		else{
			
		$(".doc_div_"+sourItemId+'_'+indx1).remove();
		$("#"+id+"_price").text("");
		$("."+id+"_price").text("0");
		$("#"+id+"_edit").hide();
		$("#"+id+"_info").hide();
		}
	}
			
	 function validateDecimalPoint(value) {
		 
		 var pattern = /^0$|^[0-9]\d*$|^\.\d+$|^0\.\d*$|^[0-9]\d*\.\d*$/;
			if(value!="" && pattern.test(value)){        	       
		 	  var points = (Number(value)).getPrecision();
		 	  var actualPoints = ${NO_OF_DECIMAL};
		 		 if(value!=""){
		 			 if(Number(points)<=Number(actualPoints)){
		 				 return true;
		 			 }else{
		 				return false;
		 			   }
		 		   }
		  }else{
			  return false;
		  }		 
	 }	
	 
	 Number.prototype.getPrecision = function() {
	 	    var s = this + "",
	 	        d = s.indexOf('.') + 1;
	 	    return !d ? 0 : s.length - d;
	   	};
/* $('#convertoSourcing').click(function(){
	$('#MySourcingModal').modal();
	
});


 
$('#getSubmittedCreator').click(function close(){
	location.replace("getTenderCreatorHomePage");
});


$('#MySourcingModal').modal({
        backdrop: 'static',
        keyboard: true, 
        show: false
});

function convertSourcing(){
	if($("#rfq").is(':checked')){
	$('#convertSourcingReq').attr("method","GET");
	$('#convertSourcingReq').attr("action","convertSourcingRequisition");
	$('#convertSourcingReq').submit();
	}
	else if($("#auction").is(':checked')){
		alert("Please Login with Auction For Converstion");
		}

} */

/* 
$(document).ready(function(){
	var count=0;
	var index=1;
	alert(count+"aaaaa");
}); */

	    function getsupplierProfile(thiss){
	    	var suId =$(thiss).attr('suppDrId');
			var suppId=$("#"+suId).val();
			
		 	TenderDwrRequestHandler.getsupplierCompleteProfile(suppId,{async:false,callback:function(data){
				if(data!=null){
					var data1 = JSON.parse(data);
				
					// $("#companyId").val(data1.supplierId);
		    			$("#supplierName").html(data1.contactPerson);
		    			//$("#aadharNo").html(data.aadharNo);
		    	        $("#email").html(data1.email);
		    			$("#mobile").html(data1.mobile1);
		    			$("#address").html(data1.regiAddress);  
		    			$("#desig").html(data1.designation);
		    			$("#pan_no").html(data1.panNum);
		    			
				}
				
			}});
		 	$("#profileModal").modal({backdrop: "static"}); 
		} 
		
		
		
		
		
$(document).on('click', '.uploadReqDocButton', function () {
	
	 //alert("index:::"+index);
	 
	 
	 $("#document_upload_error_msg").hide();
		if(globalUploadLock==true){
			globalUploadLock = false;
			var completeSupplierDocStatus = false;
			var input = $("#reqSupplierDocument");
			var result=false;
			$("#delete_reqSupplierDoc_button").css("display","none");
			var oMyForm = new FormData(); 
		 	if(!input.val()==''){
				var file_show=getFileSize(input);      
				$("#reqSupplier_doc_size").text(file_show);
	 			oMyForm.append("document", input.get(0).files[0]); 
	 			//alert(input.get(0).files[0].name);
		   		oMyForm.append("documentType", 1); 
		   		var path=contextPath+"/uploadOfflineSourcingDocument";
		   		$.ajax({
		   			xhr: function () {
		   		        var xhr = new window.XMLHttpRequest();
		   		        xhr.upload.addEventListener("progress", function (evt) {
		   			        if (evt.lengthComputable) {
		   			                var percentComplete = evt.loaded / evt.total;
		   			                console.log(percentComplete);
		   			                $("#progress_bar_"+index).width((percentComplete * 100).toFixed() + '%');
		   							$("#progress_bar_"+index).html((percentComplete * 100).toFixed() + '%');
		   			            }
		   			        }, false);
	   			          return xhr;
		   			    },
		   				url: path,
		   			    data: oMyForm,
		   			    dataType: 'text',
		   			    processData: false,
		   			    contentType: false,
		   			    type: 'POST',
		   			    success: function(data){ 
		   			    	var myJSON = JSON.parse(data);
		   			    	
					    	$("#reqSupplierDocSequenceNos").val(myJSON[1]);
					    	//alert("antivirus Status"+myJSON[0]);            					    	
				    	if(myJSON[0]=="PASSED"){ 
					    	if(myJSON[1]!=""){           		   			    
				    			
		   			    		
		   			    		$("#req_supplier_document_upload_button").hide();
		   			    		$("#req_supplier_document_upload_div").hide();
		   			    		$("#reqSupplierDocNames").val(input.get(0).files[0].name);
		   			    		if(myJSON[0]=='FAILED'){
					    			$('#delete_reqSupplierDoc_button').trigger('click');
					    			$("#reqSupplierDocFlagStatus").val(true);	    			
					    		}else{
		   			    		completeSupplierDocStatus = true;
		   			    		result=true;
					    		}
		   			    	}
				    	}else{
				    		
				    		$("#reqSupplierDocFlagStatus").val(true);	
				    	}
		   			      },
		   			      beforeSend : function() {
		   						$("#progress_bar_"+index).width('0%');
		   						$("#progress_bar_"+index).html("0%");
		   						$("#progress_box_"+index).show();
		   						
		   				  },
		   				  complete : function(response) {
				   					if(completeSupplierDocStatus == true){
				   						if(result){
				   							$("#progress_box").hide();
				   							$("#delete_reqSupplierDoc_button").css("display","");
				   							$("#reqSupplier_doc_span").hide();
					   						$("#reqSupplier_documents_upload_message").html("<font color='blue'>Your file has been uploaded!No Virus detected</font>");
				   						}else{
				   							$("#delete_reqSupplierDoc_button").css("display","");
			   								$("#reqSupplier_documents_upload_message").html("<font color='red'> Error : Unable to upload file,please check internet connection.</font>");	
			   							} 
				   					}else{
			   							if($("#reqSupplierDocFlagStatus").val()){
			   								$('#delete_reqSupplierDoc_button').trigger('click');
			   								$("#reqSupplier_doc_size").empty();
											$("#reqSupplier_documents_upload_message").html("<font color='red'> Error :Virus detected! Please upload new file</font>");
											$("#reqSupplier_doc_span").show();
										} 
			   							else{
   										alert("No Net Connection");
   									}
				   					}
			   						globalUploadLock = true;
		   					},
		   					error : function() {
		   						globalUploadLock = true;
		   						$("#delete_reqSupplierDoc_button").css("display","");
		   						$("#reqSupplier_documents_upload_message").html("<font color='red'> Error : Unable to upload file,please check internet connection.</font>");
		   					}
		   				});
		         }else{
		        	globalUploadLock = true;
			 		$("#delete_reqSupplierDoc_button").css("display","");
			 		alert("Please upload file");
		 		}
			  }else{
				alert("File Uploading is in progress");
			}
	}); 
	
	
$(document).on('click', '.deleteReqDoc', function () {
	

	/* var id=$(this).parents('.supplier-doc-div').find('.supplierDocs').attr('id');
	var index=id.split('_')[1]+"_"+id.split('_')[2];  */
	//alert("index1::"+index);
	 $("#progress_box").hide();
		var oMyForm = new FormData(); 
		$("#reqSupplierDocNames").val("");
		//$("#supplier_doc_span_"+index).show();
				 oMyForm.append("sequenceNumber", $("#reqSupplierDocSequenceNos").val()); 
				 var path=contextPath+"/deleteOfflineSourcingDocument";
					$.ajax({
						url: path,
					    data: oMyForm,
					    dataType: 'text',
					    processData: false,
					    contentType: false,
					    type: 'POST',
					    success: function(data){
					    	globalUploadLock=true;
					    }
					});
				$("#req_supplier_document_upload_button").show();
		    	$("#reqSupplierDocSequenceNos").val("");
		    	$("#reqSupplierDocNames").val("");
		    	$("#reqSupplier_documents_upload_message").empty();
				$("#progress_bar").width('0%');
				$("#progress_bar").html("0%");
				$("#reqSupplier_doc_size").empty();
				$("#reqSupplier_doc_span").show();
});
	
		
$('.reqSupplierDocument').change(function(){
	
	var filename = $(this).val();
	var fileInput = $(this);
	if(filename!=''){
	var maxSize = fileInput.data('max-size');
	var fileSize = fileInput.get(0).files[0].size; // in bytes
	
	 if(filename.length>200){
		alert('File name is too large');
	            this.value='';
	 }if (!testFileName(filename)) {
		 alert('Please select .xlsx |.doc |.docx  |.xls |.pdf|.XLSX|.DOC|.DOCX|.XLS|.PDF|.ZIP|.DWG|.msg|.gif|.jpeg|.jpg|.png|.GIF|.JPEG|.JPG|.PNG file');
         this.value='';
	 }if(fileSize>maxSize){
	     alert('File size is more than ' + maxSize/(1024*1024) + ' MB is not allowed');
	            this.value='';
	 }if(fileSize==0){        	
	      alert("File size should be greater than 0");
		  this.value='';
	 } else {
		 var ck_fName =/[-',+#%&"\/]/;
			 if (ck_fName.test(filename)) {
				 this.value='';
				 alert("Please Enter Valid File Name without this special characters([-',+#%&\/]) and double quotes");
				 }
	 }
	 
	 
	 
	 
	 if($("#reqSupplierDocument").val()!=''){
	       $("#reqSupplier_doc_span").hide();
	 } 
  } 
});



function showConfirmModal(){
	 var data_list=${SUPP_LIST};
	 var comments = $("#comments").val();
	 var commonContract =$("#common_contract option:selected").text();


	
	var content =  '';
	$("#modalBody").empty();
	if($("#offline_type").val()=='2'){
		
		  content=content+' <div class="modal-body col-md-12 col-sm-12">'+  
		     '   <label class="col-md-2 col-sm-2">Common Contract:</label>'+
		      '  <div class="col-md-4 col-sm-4">';
		      if($("#common_contract").val() != ""){
		    	  content=content+	  ' '+commonContract+' ';
		      }else{
		    	  content=content+	  ' NA ';
		      }
		      
		   
		      content=content+   '  </div>'+
			'	</div>	'; 
			
			
		      $('.subItems').each(function(){
		    		var itmId = $(this).val();
		    		
		    		 
		    	     
		    	   
		    	     content=content+' <div class="modal-body col-md-12 col-sm-12">'+  
		    	     '   <label class="col-md-4 col-sm-4">Item Name:</label>'+
		    	      '  <div class="col-md-4 col-sm-4">'+
		    	    ' '+$("#sourcingReqItemName_"+itmId).val()+'  '+
		    	      '  </div>'+
		    		'	</div>	'; 
		    		
		    		$('.userIds_'+itmId).each(function(){
		    			var currency = $("#currency").val();
		    			var supp = $(this).val();
		    			var id = $(this).attr('id');
		    			var index=id.split('_')[1]+"_"+id.split('_')[2]; 
		    			var price ="userId_"+index+"_price";
		    			
		    			  content=content+' <div class="modal-body col-md-12 col-sm-12" style="background-color:#d9d9d9">'+
		    			     '  <label class="col-md-2 col-sm-2">Supplier:</label>';
		    			     for(var i=0;i<data_list.length;i++){
		    			    	 
		    			    if(data_list[i].userId == supp){
		    			    	 content=content+  ' <div class="col-md-4 col-sm-4">'+
		    				      '  '+data_list[i].companyName+' ('+data_list[i].name+') <br>'+
		    				      ' '+$("#"+price).text()+' ('+currency+')'+
		    				     '  </div>';
		    			    }
		    			  
		    			    	
		    			     }
		    			     var itemId = id.split('_')[1];
		    			     var contractId = "contract_"+itemId;
		    			     var contract =$('#'+contractId).find('option:selected').text();
		    			     content=content+  '   <label class="col-md-2 col-sm-2">Contract:</label>'+
		    			      '  <div class="col-md-4 col-sm-4">';
		    			     if($("#"+contractId).val() != ""){
		    			    	  content=content+	  '  '+contract+'' ;
		    			      }else{
		    			    	  content=content+	  ' NA ';
		    			      }
		    			      
		    			   
		    			     content=content+   '  </div>'+
		    			     '  </div>'; 
		    		
		    			
		    		});
		    		
		    			
		    		});
		    		 content=content+' <div class="modal-body col-md-12 col-sm-12">'+  
		    	    
		    		'	</div>	'+
		    			     ' <div class="modal-body col-md-12 col-sm-12">'+  
		    			     '   <label class="col-md-4 col-sm-4">Comments:</label>'+
		    			      '  <div class="col-md-8 col-sm-8">';
		    			   if(comments !=""){
		    				   content=content+      ''+comments+'';
		    			   }else{
		    				   content=content+      'NA';
		    			   }
		    			     
		    			     
		    			      content=content+  '	</div>	'+
		    				'	</div>	';	
			
		
	
		
	}else{
		
	
	
	
	   content=content+' <div class="modal-body col-md-12 col-sm-12">'+  
	     '   <label class="col-md-4 col-sm-4">Supplier Common Document:</label>'+
	      '  <div class="col-md-4 col-sm-4">';
	      if($("#reqSupplierDocNames").val() != ""){
	    	  content=content+	  ' '+$("#reqSupplierDocNames").val()+'  '+$('#reqSupplier_doc_size').text()+' ';
	      }else{
	    	  content=content+	  ' NA ';
	      }
	      
	   
	      content=content+   '  </div>'+
		'	</div>	'; 
	
	$('.subItems').each(function(){
	var itmId = $(this).val();
	
	 
     
   
     content=content+' <div class="modal-body col-md-12 col-sm-12">'+  
     '   <label class="col-md-4 col-sm-4">Item Name:</label>'+
      '  <div class="col-md-4 col-sm-4">'+
    ' '+$("#sourcingReqItemName_"+itmId).val()+'  '+
      '  </div>'+
	'	</div>	'; 
	
	$('.userIds_'+itmId).each(function(){
		var currency = $("#currency").val();
		var supp = $(this).val();
		var id = $(this).attr('id');
		var index=id.split('_')[1]+"_"+id.split('_')[2]; 
		var price ="userId_"+index+"_price";
		
		  content=content+' <div class="modal-body col-md-12 col-sm-12" style="background-color:#d9d9d9">'+
		     '  <label class="col-md-2 col-sm-2">Supplier:</label>';
		     for(var i=0;i<data_list.length;i++){
		    	 
		    if(data_list[i].userId == supp){
		    	 content=content+  ' <div class="col-md-4 col-sm-4">'+
			      '  '+data_list[i].companyName+' ('+data_list[i].name+') <br>'+
			      ' '+$("#"+price).text()+' ('+currency+')'+
			     '  </div>';
		    }
		  
		    	
		     }
		     content=content+  '   <label class="col-md-2 col-sm-2">Document:</label>'+
		      '  <div class="col-md-4 col-sm-4">';
		     if($("#supplierDocName_"+index).val() != ""){
		    	  content=content+	   ' '+$("#supplierDocName_"+index).val()+' '+$('#supplier_doc_size_'+index).text()+' ';
		      }else{
		    	  content=content+	  ' NA ';
		      }
		      
		   
		     content=content+   '  </div>'+
		     '  </div>'; 
	
		
	});
	
		
	});
	 content=content+' <div class="modal-body col-md-12 col-sm-12">'+  
    
	'	</div>	'+
		     ' <div class="modal-body col-md-12 col-sm-12">'+  
		     '   <label class="col-md-4 col-sm-4">Comments:</label>'+
		      '  <div class="col-md-8 col-sm-8">';
		   if(comments !=""){
			   content=content+      ''+comments+'';
		   }else{
			   content=content+      'NA';
		   }
		     
		     
		      content=content+  '	</div>	'+
			'	</div>	';
			
			
	}	
			
	
	$("#modalBody").append(content); 
	
	$("#confirmModal").modal({backdrop: "static"}); 
}


$("#submitModal").click(function(){
		
$("#common_supplier_contract").val($("#common_contract").val());
	
	 	$('#awardForm').attr("method","POST");
		$('#awardForm').attr("action","saveSourcingOfflineDetails");
		$('#awardForm').submit();   
	
});

function textCount(divId){
 	 
    var text_length = $('#'+divId).val().length;
    //var text_remaining = 2000 - text_length;

    $('#'+divId+'_count').html(text_length);

}

$('#common_supplier').on('change', function(event) {
	event.preventDefault();

	
	  $(".userIdsData").each(function(){
		 
			//$('.userIdsData option').removeAttr('selected');
			
		  $('select[name^="supplierIds"] option:selected').attr("selected",null);
		});  

			$(".userIdsData").each(function(){
				
			var userId = $("#common_supplier").val();
				var id = $(this).attr('id');
			
				if(userId != ''){
					
					//$('#'+id+' option[value='+userId+']').attr('selected','true');
					//$('select[name^="supplierIds"] option[value='+userId+']').attr("selected","selected");
					
					//$("div.userIdsData select").val(userId);
					
					/*  $('#'+id+' option').prop('selected', false).filter(function() {
                   return $(this).val() == userId;  
                    }).prop('selected', true);  */
                    
                    $("#"+id).val(userId).trigger("chosen:updated");
                    //$("#"+id).prop('selectedValue', userId);
                    
                   
					
					getContractsForSuppliers();
					getPriceOfSupplier(this);
					
				}
			
				
				
			});
});


function getContractsForSuppliers(){
	
	var supplierId=$("#common_supplier").val();
	
	if(supplierId!=""){
		
		
		TenderDwrRequestHandler.getSupplierContracts(supplierId,{async:false,callback:function(data){
			
		$(".supplierContracts").each(function(){
			var id = $(this).attr('id');
			
			populateJQuerySelectBox(id,data);
		});
		
			
			
			
		 }});
	}else{
		$(".supplierContracts").empty();
		$(".supplierContracts").append("<option value=''>Select</option>");
	}
	
}


$('.userIdsData').on('change', function(event) {
	
    var id = $(this).attr('id');
    var supplierId = $('#'+id).val();

	var itemId = $(this).attr('surId');
	
	
	$("#contract_"+itemId).empty();
	$("#contract_"+itemId).append("<option value=''>Select</option>");
	
if(supplierId!=""){
		
		
		TenderDwrRequestHandler.getSupplierContracts(supplierId,{async:false,callback:function(data){
			
		
			
			populateJQuerySelectBox("contract_"+itemId,data);
		
		
			
			
			
		 }});
	}
		
	
	
});



function checkSupplierDocs(ind) {
 var id=$(ind).attr('id');
 var index=id.split('_')[1]+"_"+id.split('_')[2];

	var filename = $(ind).val();
	if(filename!=''){
	var fileInput = $(ind);
	var maxSize = fileInput.data('max-size');
	
	var fileSize = fileInput.get(0).files[0].size; // in bytes
	
	 if(filename.length>200){
		alert('File name is too large');
		 $("#"+id).val('');
	 }if (!testFileName(filename)) {
		 alert('Please select .xlsx |.doc |.docx  |.xls |.pdf|.XLSX|.DOC|.DOCX|.XLS|.PDF|.ZIP|.DWG |.msg|.jpeg|.jpg|.png file');
		 $("#"+id).val('');
	 }if(fileSize>maxSize){
	     alert('File size is more than ' + maxSize/(1024*1024) + ' MB is not allowed');
	     $("#"+id).val('');
	 }if(fileSize==0){        	
	      alert("File size should be greater than 0");
	      $("#"+id).val('');
	 } else {
		 var ck_fName =/[-',+#%&"\/]/;
			 if (ck_fName.test(filename)) {
				 $("#"+id).val('');
				 alert("Please Enter Valid File Name without this special characters([-',+#%&\/]) and double quotes");
				 }
	 }
	 
	 
	 
	 
	 if($("#supplierDocuments_"+index).val()!=''){
	       $("#supplier_doc_span_"+index).hide();
	 } 
  }  
}

		
</script>
