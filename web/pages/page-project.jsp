<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${empty sessionScope.userId}">
    <c:redirect url="./username.jsp" />
</c:if>

<%@ include file = "../includes/styles.jsp" %>
<%@ include file = "../includes/navbar.jsp" %>
<%@ include file = "../includes/header.jsp" %>

<div class="content-page">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-wrap align-items-center justify-content-between breadcrumb-content">
                            <h5>Your Projects</h5>
                            <div class="d-flex flex-wrap align-items-center justify-content-between">
                                <div class="list-grid-toggle d-flex align-items-center mr-3">
                                    <div data-toggle-extra="tab" data-target-extra="#grid" class="active">
                                        <div class="grid-icon mr-3">
                                            <svg width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect>
                                            </svg>
                                        </div>
                                    </div>
                                    <div data-toggle-extra="tab" data-target-extra="#list">
                                        <div class="grid-icon">
                                            <svg  width="20" height="20" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                <line x1="21" y1="10" x2="3" y2="10"></line><line x1="21" y1="6" x2="3" y2="6"></line><line x1="21" y1="14" x2="3" y2="14"></line><line x1="21" y1="18" x2="3" y2="18"></line>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${userName eq 'Owner'}">
                                    <div class="pl-3 border-left btn-new">
                                        <a href="#" class="btn btn-primary" data-target="#new-project-modal" data-toggle="modal">New Project</a>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Grid View-->
        <div id="grid" class="item-content animate__animated animate__fadeIn active" data-toggle-extra="tab-content">
            <div class="row" id="displayProjectDataGridView">
            </div>
        </div>

        <!--List View-->                    
        <div id="list" class="item-content animate__animated animate__fadeIn" data-toggle-extra="tab-content">
            <div class="row" id="displayProjectDataListView">
            </div>
        </div>
        <!-- Page end  -->
    </div>
</div>
</div>
<!-- Wrapper End-->

<!-- Modal list start -->
<div class="modal fade" role="dialog" aria-modal="true" id="new-project-modal">
    <div class="modal-dialog  modal-dialog-centered" role="document" style="max-width: 800px !important">
        <div class="modal-content">
            <div class="modal-header d-block text-center pb-3 border-bttom">
                <h3 class="modal-title" id="exampleModalCenterTitle01">New Project</h3>
            </div>
            <form enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group mb-4">
                                <label for="exampleInputText01" class="h5">Project Name *</label>
                                <input type="text" class="form-control" id="name" placeholder="Project Name" required autofocus>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group mb-4">
                                <label for="exampleInputText01" class="h5">Project Description *</label>
                                <input type="text" class="form-control" id="description" placeholder="Project Description" required>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group mb-4">
                                <label for="exampleInputText01" class="h5">Project Requirements *</label>
                                <textarea class="form-control" id="requirements" placeholder="Project Requirements" required ></textarea>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group mb-4">
                                <label for="exampleInputText01" class="h5">Upload Logo</label>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="logo">
                                        <label class="custom-file-label" for="inputGroupFile02">Choose file</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group mb-4">
                                <label for="exampleInputText01" class="h5">Amount *</label>
                                <input type="text" class="form-control" id="amount" placeholder="Amount" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group mb-4">
                                <label for="exampleInputText004" class="h5">Date Of Taken *</label>
                                <input type="date" class="form-control" id="takenDate" value="">
                            </div>                        
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group mb-4">
                                <label for="exampleInputText004" class="h5">Date Of Started </label>
                                <input type="date" class="form-control" id="startingDate" value="">
                            </div>                        
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group mb-4">
                                <label for="exampleInputText004" class="h5">Frontend Technology *</label>
                                <input type="text" class="form-control" id="frontendTechnology" value="" placeholder="Frontend Techology">
                            </div>                        
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group mb-4">
                                <label for="exampleInputText004" class="h5">Backend Technology *</label>
                                <input type="text" class="form-control" id="backendTechnology" value="" placeholder="Backend Technology">
                            </div>                        
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group mb-4">
                                <label for="exampleInputText004" class="h5">Database to be Used *</label>
                                <input type="text" class="form-control" id="databaseName" value="" placeholder="Database Name">
                            </div>                        
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group mb-4">
                                <label for="exampleInputText004" class="h5">Warranty *</label>
                                <input type="text" class="form-control" id="warranty" value="" placeholder="Warranty for the Service">
                            </div>                        
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group mb-4">
                                <label for="exampleInputText2" class="h5">Type *</label>
                                <select class="form-control" data-style="py-0" id="type">
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="d-flex flex-wrap align-items-ceter justify-content-center mt-2">
                                <div class="btn btn-primary mr-3" data-dismiss="modal" onclick="AddProject()">Save</div>
                                <div class="btn btn-primary" data-dismiss="modal">Cancel</div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>  

<!--Update Project-->
<div class="modal fade" role="dialog" aria-modal="true" id="update-project-modal">
    <div class="modal-dialog  modal-dialog-centered" role="document" style="max-width: 800px !important">
        <div class="modal-content">
            <div class="modal-header d-block text-center pb-3 border-bttom">
                <h3 class="modal-title" id="exampleModalCenterTitle01">Update Project</h3>
            </div>
            <form enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group mb-4">
                                <label for="exampleInputText01" class="h5">Project Name *</label>
                                <input type="text" class="form-control" id="updateName" placeholder="Project Name"  autofocus>
                                    <input type="hidden" class="form-control" id="updateId">
                                        </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-group mb-4">
                                                <label for="exampleInputText01" class="h5">Project Description *</label>
                                                <input type="text" class="form-control" id="updateDescription" placeholder="Project Description">
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-group mb-4">
                                                <label for="exampleInputText01" class="h5">Project Requirements *</label>
                                                <textarea class="form-control" id="updateRequirements" placeholder="Project Requirements" ></textarea>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-group mb-4">
                                                <label for="exampleInputText01" class="h5">Upload Logo</label>
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" id="updateLogo">
                                                        <input type="hidden" id="oldLogo">
                                                            <label class="custom-file-label" for="inputGroupFile02">Choose file</label>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            <div class="col-lg-12">
                                                                <div class="form-group mb-4">
                                                                    <label for="exampleInputText01" class="h5">Amount *</label>
                                                                    <input type="text" class="form-control" id="updateAmount" placeholder="Amount">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-12">
                                                                <div class="form-group mb-4">
                                                                    <label for="exampleInputText01" class="h5">Amount Status</label>
                                                                    <input type="text" class="form-control" id="updateAmountStatus" placeholder="Amount Status">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group mb-4">
                                                                    <label for="exampleInputText004" class="h5">Date Of Taken *</label>
                                                                    <input type="date" class="form-control" id="updateTakenDate" value="">
                                                                </div>                        
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group mb-4">
                                                                    <label for="exampleInputText004" class="h5">Date Of Started </label>
                                                                    <input type="date" class="form-control" id="updateStartingDate" value="">
                                                                </div>                        
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group mb-4">
                                                                    <label for="exampleInputText004" class="h5">Frontend Technology *</label>
                                                                    <input type="text" class="form-control" id="updateFrontendTechnology" value="" placeholder="Frontend Techology">
                                                                </div>                        
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group mb-4">
                                                                    <label for="exampleInputText004" class="h5">Backend Technology *</label>
                                                                    <input type="text" class="form-control" id="updateBackendTechnology" value="" placeholder="Backend Technology">
                                                                </div>                        
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group mb-4">
                                                                    <label for="exampleInputText004" class="h5">Database to be Used *</label>
                                                                    <input type="text" class="form-control" id="updateDatabaseName" value="" placeholder="Database Name">
                                                                </div>                        
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group mb-4">
                                                                    <label for="exampleInputText004" class="h5">URL *</label>
                                                                    <input type="text" class="form-control" id="updateUrl" value="" placeholder="URL">
                                                                </div>                        
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group mb-4">
                                                                    <label for="exampleInputText004" class="h5">Warranty *</label>
                                                                    <input type="text" class="form-control" id="updateWarranty" value="" placeholder="Warranty for the Service">
                                                                </div>                        
                                                            </div>
                                                            <div class="col-lg-6">
                                                                <div class="form-group mb-4">
                                                                    <label for="exampleInputText004" class="h5">Status *</label>
                                                                    <input type="text" class="form-control" id="updateStatus" value="">
                                                                </div>                        
                                                            </div>
                                                            <div class="col-lg-12">
                                                                <div class="form-group mb-4">
                                                                    <label for="exampleInputText2" class="h5">Type *</label>
                                                                    <select class="form-control" data-style="py-0" id="updateType">
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-12">
                                                                <div class="d-flex flex-wrap align-items-ceter justify-content-center mt-2">
                                                                    <div class="btn btn-primary mr-3" data-dismiss="modal" onclick="updateProject()">Update</div>
                                                                    <div class="btn btn-primary" data-dismiss="modal">Cancel</div>
                                                                </div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            </form>
                                                            </div>
                                                            </div>
                                                            </div>

                                                            <!--Delete Project-->
                                                            <div class="modal fade bd-example-modal-lg" role="dialog" aria-modal="true" id="delete-project-modal">
                                                                <div class="modal-dialog  modal-dialog-centered modal-lg" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header d-block text-center pb-3 border-bttom">
                                                                            <h3 class="modal-title" id="exampleModalCenterTitle">Are you sure you want to delete ?</h3>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <div class="row">
                                                                                <div class="col-lg-12">
                                                                                    <div class="d-flex flex-wrap align-items-ceter justify-content-center mt-4">
                                                                                        <input type="hidden" id="deleteId" class="form-control"> 
                                                                                            <div class="btn btn-secondary mr-3" data-dismiss="modal" onclick="deleteData()">Yes</div>
                                                                                            <div class="btn btn-primary" data-dismiss="modal">No</div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <%@ include file = "../includes/footer.jsp" %>
                                                            <%@ include file = "../includes/scripts.jsp" %>

                                                            <script>

                                                                $(init);

                                                                function init() {
                                                                    FetchProjectsDetails();
                                                                    FetchDevelopmentName();
                                                                }

                                                                async function FetchDevelopmentName() {
                                                                    let result = await $.post("../FetchDevelopmentNames");
                                                                    let options = ``;
                                                                    for (let i = 0; i < result.length; i++) {
                                                                        options += `<option value="` + result[i].id + `" >` + result[i].name + `</option>`;
                                                                    }
                                                                    $("#type").html(options);
                                                                }

                                                                async function FetchDevelopmentUpdateName(developementName) {
                                                                    let result = await $.post("../FetchDevelopmentNames");
                                                                    let updateOptions = ``;
                                                                    for (var i = 0; i < result.length; i++) {
                                                                        let isSelected = result[i].name === developementName ? 'selected' : '';
                                                                        updateOptions += `<option value="` + result[i].id + `" ` + isSelected + ` >` + result[i].name + `</option>`;
                                                                    }
                                                                    $("#updateType").html(updateOptions);
                                                                }

                                                                async function FetchProjectsDetails() {
                                                                    let result = await $.post("../FetchProjectDetails");
                                                                    let projectData = ``;
                                                                    let projectDataListView = '';
                                                                    for (let i = 0; i < result.length; i++) {
                                                                        projectData += `<div class="col-lg-4 col-md-6">
                                                                                <div class="card card-block card-stretch card-height">
                                                                                    <div class="card-body">
                                                                                        <div class="d-flex align-items-center justify-content-between mb-4">
                                                                                            <div id="circle-progress-0` + (i + 1) + `" class="circle-progress-0` + (i + 1) + ` circle-progress circle-progress-primary" data-min-value="0" data-max-value="100" data-value="90" data-type="percent"></div>
                                                                                        </div>
                                                                                        <h5 class="mb-1">` + result[i].projectTitle + `</h5>
                                                                                        <p class="mb-3">` + result[i].projectDescription + `</p>
                                                                                        <div class="d-flex align-items-center justify-content-between pt-3 border-top">
                                                                                            <div class="iq-media-group">
                                                                                                <a href="#" class="iq-media">   
                                                                                                    <img class="img-fluid avatar-40 rounded-circle" src="<%=request.getContextPath()%>/assets/uploads/project-logo/` + result[i].logo + `" alt="">
                                                                                                </a>
                                                                                            </div>
                                                                                            <div>
                                                                                                <a class="btn bg-success-light rounded-circle" role="button" href="../FetchProjectFullDetails?id=` + result[i].Id + `"><i class="ri-eye-2-line m-0"></i></a>
                                                                <c:if test="${userName eq 'Owner'}">
                                                                                                <a class="btn bg-warning-light ml-1 rounded-circle" role="button" data-target="#update-project-modal" data-toggle="modal" onclick="updateData('` + result[i].projectTitle + `','` + result[i].projectDescription + `','` + result[i].projectRequirements + `','` + result[i].logo + `',` + result[i].amount + `,'` + result[i].amountStatus + `','` + result[i].dateOfTaken + `','` + result[i].dateOfStarted + `','` + result[i].frontendTechnology + `','` + result[i].backendTechnology + `','` + result[i].databaseName + `','` + result[i].developmentName + `','` + result[i].url + `',` + result[i].warranty + `,'` + result[i].status + `',` + result[i].Id + `)"><i class="ri-edit-box-fill m-0"></i></a>
                                                                                                <a class="btn bg-secondary-light ml-1 rounded-circle" role="button" onclick="deleteId(` + result[i].Id + `)" data-target="#delete-project-modal" data-toggle="modal"><i class="ri-delete-bin-line m-0"></i></a>
                                                                </c:if>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>`;

                                                                        projectDataListView += `<div class="col-lg-6">
                                                                                <div class="card">
                                                                                    <div class="card-body">
                                                                                        <div class="row">
                                                                                            <div class="col-sm-8">
                                                                                                <div class="d-flex align-items-center">
                                                                                                    <div id="circle-progress-1` + (i + 1) + `" class="circle-progress-0` + (i + 1) + ` circle-progress circle-progress-primary" data-min-value="0" data-max-value="100" data-value="90" data-type="percent"></div>
                                                                                                    <div class="ml-3">
                                                                                                        <h5 class="mb-1">` + result[i].projectTitle + `</h5>
                                                                                                        <p class="mb-0">` + result[i].projectDescription + `</p>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="col-sm-4 text-sm-right mt-3 mt-sm-0">
                                                                                                <div class="iq-media-group">
                                                                                                    <a href="#" class="iq-media">
                                                                                                        <img class="img-fluid avatar-40 rounded-circle" src="<%=request.getContextPath()%>/assets/uploads/project-logo/` + result[i].logo + `" alt="">
                                                                                                    </a>
                                                                                                </div>
                                                                                                <a class="btn btn-white text-primary link-shadow" href="../FetchProjectFullDetails?id=` + result[i].Id + `">View</a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>`;
                                                                    }
                                                                    $("#displayProjectDataGridView").html(projectData);
                                                                    $("#displayProjectDataListView").html(projectDataListView);
                                                                }

                                                                function AddProject() {
                                                                    let formData = new FormData();
                                                                    formData.append("image", $("#logo")[0].files[0]);
                                                                    formData.append("name", $('#name').val().trim());
                                                                    formData.append("description", $('#description').val().trim());
                                                                    formData.append("requirements", $('#requirements').val().trim());
                                                                    formData.append("amount", $('#amount').val().trim());
                                                                    formData.append("startingDate", $('#startingDate').val().trim());
                                                                    formData.append("takenDate", $('#takenDate').val().trim());
                                                                    formData.append("frontendTechnology", $('#frontendTechnology').val().trim());
                                                                    formData.append("backendTechnology", $('#backendTechnology').val().trim());
                                                                    formData.append("databaseName", $('#databaseName').val().trim());
                                                                    formData.append("warranty", $('#warranty').val().trim());
                                                                    formData.append("type", $('#type option:selected').val());
                                                                    $.ajax({
                                                                        url: "../AddProject",
                                                                        method: "POST",
                                                                        data: formData,
                                                                        contentType: false,
                                                                        processData: false,
                                                                        success: function (response) {
                                                                            alert(response);
                                                                        }
                                                                    });
                                                                    window.location.reload();
                                                                }

                                                                function updateData(projectTitle, projectDescription, projectRequirements, logo, amount, amountStatus, dateOfTaken, dateOfStarted, frontendTechnology, backendTechnology, databaseName, developmentName, url, warranty, status, Id) {
                                                                    $('#updateName').val(projectTitle);
                                                                    $('#updateDescription').val(projectDescription);
                                                                    $('#updateRequirements').val(projectRequirements);
                                                                    $('#updateAmount').val(amount);
                                                                    $('#updateAmountStatus').val(amountStatus);
                                                                    $('#updateTakenDate').val(dateOfTaken);
                                                                    $('#updateStartingDate').val(dateOfStarted);
                                                                    $('#updateFrontendTechnology').val(frontendTechnology);
                                                                    $('#updateBackendTechnology').val(backendTechnology);
                                                                    $('#updateDatabaseName').val(databaseName);
                                                                    $('#updateUrl').val(url);
                                                                    $('#oldLogo').val(logo);
                                                                    $('#updateWarranty').val(warranty);
                                                                    $('#updateStatus').val(status);
                                                                    $('#updateId').val(Id);
                                                                    FetchDevelopmentUpdateName(developmentName);
                                                                }
                                                                ;

                                                                async function updateProject() {
                                                                    let formData = new FormData();
                                                                    formData.append("image", $('#updateLogo')[0].files[0]);
                                                                    formData.append("oldLogo", $('#oldLogo').val());
                                                                    formData.append("projectTitle", $('#updateName').val());
                                                                    formData.append("projectDescription", $('#updateDescription').val());
                                                                    formData.append("projectRequirement", $('#updateRequirements').val());
                                                                    formData.append("amount", $('#updateAmount').val());
                                                                    formData.append("amountStatus", $('#updateAmountStatus').val());
                                                                    formData.append("dateOfStarted", $('#updateStartingDate').val());
                                                                    formData.append("dateOfTaken", $('#updateTakenDate').val());
                                                                    formData.append("frontendTechnology", $('#updateFrontendTechnology').val());
                                                                    formData.append("backendTechnology", $('#updateBackendTechnology').val());
                                                                    formData.append("databaseName", $('#updateDatabaseName').val());
                                                                    formData.append("url", $('#updateUrl').val());
                                                                    formData.append("warranty", $('#updateWarranty').val());
                                                                    formData.append("status", $('#updateStatus').val());
                                                                    formData.append("id", $('#updateId').val());
                                                                    formData.append("developmentId", $('#updateType option:selected').val());

                                                                    var response = await $.ajax({
                                                                        url: "../UpdateProject",
                                                                        method: "POST",
                                                                        data: formData,
                                                                        contentType: false,
                                                                        processData: false,
                                                                        success: function () {
                                                                            alert(response);
                                                                        },
                                                                        fail: function (error) {
                                                                            window.location.reload();
                                                                            console.log(error);
                                                                        }
                                                                    });
                                                                    window.location.reload();
                                                                }
                                                                ;

                                                                function deleteId(id) {
                                                                    var id = id;
                                                                    $("#deleteId").val(id);
                                                                }
                                                                ;

                                                                function deleteData() {
                                                                    var id = $("#deleteId").val();

                                                                    $.post("../DeleteProject", {id: id}, function (response) {
                                                                        console.log(response);
                                                                    });
                                                                    window.location.reload();
                                                                }
                                                                ;

                                                            </script>