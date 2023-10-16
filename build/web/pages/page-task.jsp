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
                            <h5>Your Task</h5>
                            <c:if test="${userName eq 'Owner'}">
                                <div class="d-flex flex-wrap align-items-center">
                                    <div class="dropdown dropdown-project mr-3">
                                        <div class="dropdown-toggle" id="dropdownMenuButton03" data-toggle="dropdown">
                                            <div class="btn bg-body"><span class="h6">Select Project </span><i class="ri-arrow-down-s-line ml-2 mr-0"></i></div>
                                        </div>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton03" id="dropdownProjectList">
                                        </div>
                                    </div>
                                    <a href="#" class="btn btn-primary" data-target="#new-task-modal" data-toggle="modal">New Task</a>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row" id="taskDetails">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page end  -->
    </div>
</div>
</div>
<!-- Wrapper End-->

<!-- Modal list start -->
<div class="modal fade bd-example-modal-lg" role="dialog" aria-modal="true" id="new-task-modal">
    <div class="modal-dialog  modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header d-block text-center pb-3 border-bttom">
                <h3 class="modal-title" id="exampleModalCenterTitle">New Task</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group mb-3">
                            <label for="exampleInputText02" class="h5">Task Name</label>
                            <input type="text" class="form-control" id="task" placeholder="Enter task Name">
                            <a href="#" class="task-edit text-body"><i class="ri-edit-box-line"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group mb-3">
                            <label for="exampleInputText3" class="h5">Assigned to</label>
                            <select name="type" class="form-control" data-style="py-0" id="developerName">
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group mb-3">
                            <label for="exampleInputText05" class="h5">Due Dates*</label>
                            <input type="date" class="form-control" id="duedate">
                        </div>                        
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group mb-3">
                            <label for="exampleInputText2" class="h5">Project</label>
                            <select name="type" class="form-control" data-style="py-0" id="project">
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="form-group mb-3">
                            <label for="exampleInputText040" class="h5">Description</label>
                            <textarea class="form-control" id="description" rows="2"></textarea>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="d-flex flex-wrap align-items-ceter justify-content-center mt-4">
                            <div class="btn btn-primary mr-3" data-dismiss="modal" onclick="sendData()">Save</div>
                            <div class="btn btn-primary" data-dismiss="modal">Cancel</div>
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
        FetchProjectsName();
        FetchDeveloperName();
    <c:if test="${userName ne 'Owner'}">
        FetchTaskDetails();
    </c:if>
    <c:if test="${userName eq 'Owner'}">
        FetchTaskFullDetails();
    </c:if>
        $(".stopBtn").hide();
    }

    async function FetchProjectsName() {
        let result = await $.post("../FetchProjectNames");
        let options = ``;
        let dropdownOptions = '';
        for (let i = 0; i < result.length; i++) {
            options += `<option value="` + result[i].Id + `" >` + result[i].projectTitle + `</option>`;
            dropdownOptions += `<a class="dropdown-item" href="#">` + result[i].projectTitle + `</a>`;
        }
        $("#project").html(options);
        $("#dropdownProjectList").html(dropdownOptions);
    }

    async function FetchDeveloperName() {
        let result = await $.post("../FetchDeveloperNames");
        console.log(result);
        let options = ``;
        for (let i = 0; i < result.length; i++) {
            options += `<option value="` + result[i].id + `" >` + result[i].developerName + `</option>`;
        }
        $("#developerName").html(options);
    }

    async function FetchTaskDetails() {
        let result = await $.post("../FetchTaskDetails");
        let taskData = ``;
        for (let i = 0; i < result.length; i++) {
            let playBtn = result[i].status === 'NotWorking' ? `<a class="btn bg-warning-light rounded-circle mr-2" role="button" href="#" onclick="play(` + result[i].id + `)"><i class="ri-play-fill m-0" onclick="play(` + result[i].id + `)"></i></a>` : '';
            let completeBtn = result[i].status === 'NotWorking' ? `<a class="btn bg-success-light rounded-circle mr-2" role="button" href="#" onclick="complete(` + result[i].id + `)"><i class="ri-check-fill m-0" onclick="complete(` + result[i].id + `)"></i></a>` : '';
            let stopBtn = result[i].status === 'Working' ? `<a class="btn bg-secondary-light rounded-circle mr-2" role="button" href="#" onclick="stop(` + result[i].id + `)"><i class="ri-stop-fill m-0" onclick="stop(` + result[i].id + `)"></i></a>` : '';
            let complete = result[i].status === 'Complete' ? `<a class="btn bg-success-light rounded-circle mr-2" role="button" href="#"><i class="ri-check-fill m-0"></i></a>` : '';
            taskData += `
                <div class="col-lg-12">
                    <div class="card card-widget task-card">
                        <div class="card-body">
                            <div class="d-flex flex-wrap align-items-center justify-content-between">
                                <div class="d-flex align-items-center">
                            <div>
                            <h5 class="mb-1">` + result[i].task + `</h5>
                            <div class="row">
                                <div class="media align-items-center ml-2">
                                    <div class="btn bg-body mt-1"><i class="ri-briefcase-fill mr-2"></i>` + result[i].projectName + `</div>
                                </div>
                                <div class="media align-items-center ml-2">
                                    <div class="btn bg-body mt-1"><i class="ri-passport-line mr-2"></i>` + result[i].developerName + `</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="media align-items-center mt-md-0 mt-3">
                        ` + playBtn + `
                        ` + completeBtn + `
                        ` + complete + `
                        ` + stopBtn + `
                    </div>
                </div>  
            </div>
        </div>                                                                                                        
    </div>
            `;
        }
        $(".stopBtn").hide();
        $("#taskDetails").html(taskData);
    }

    async function FetchTaskFullDetails() {
        let result = await $.post("../FetchTaskFullDetails");
        console.log(result);
        let taskData = ``;
        for (let i = 0; i < result.length; i++) {
            let playBtn = result[i].status === 'NotWorking' ? `<a class="btn bg-warning-light rounded-circle mr-2" role="button" href="#"><i class="ri-play-fill m-0"></i></a>` : '';
            let stopBtn = result[i].status === 'Working' ? `<a class="btn bg-secondary-light rounded-circle mr-2" role="button" href="#"><i class="ri-stop-fill m-0"></i></a>` : '';
            let complete = result[i].status === 'Complete' ? `<a class="btn bg-success-light rounded-circle mr-2" role="button" href="#"><i class="ri-check-fill m-0"></i></a>` : '';
            taskData += `
                <div class="col-lg-12">
                    <div class="card card-widget task-card">
                        <div class="card-body">
                            <div class="d-flex flex-wrap align-items-center justify-content-between">
                                <div class="d-flex align-items-center">
                            <div>
                            <h5 class="mb-1">` + result[i].task + `</h5>
                            <div class="row">
                                <div class="media align-items-center ml-2">
                                    <div class="btn bg-body mt-1"><i class="ri-briefcase-fill mr-2"></i>` + result[i].projectName + `</div>
                                </div>
                                <div class="media align-items-center ml-2">
                                    <div class="btn bg-body mt-1"><i class="ri-passport-line mr-2"></i>` + result[i].developerName + `</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="media align-items-center mt-md-0 mt-3">
                        ` + playBtn + `
                        ` + complete + `
                        ` + stopBtn + `
                    </div>
                </div>  
            </div>
        </div>                                                                                                        
    </div>
            `;
        }
        $(".stopBtn").hide();
        $("#taskDetails").html(taskData);
    }

    async function sendData() {
        let task = $("#task").val().trim();
        let description = $("#description").val().trim();
        let dueDate = $("#duedate").val();
        let developerId = $("#developerName option:selected").val();
        let projectId = $("#project option:selected").val();
        let data = {
            task: task,
            developerId: developerId,
            dueDate: dueDate,
            projectId: projectId,
            description: description
        };
        let response = await $.post("../AddTask", data );
        console.log(response);
        $('#task').val('');
        $('#duedate').val('');
        $('#description').val('');
        window.location.reload();
    }

    function play(id) {
        let taskid = id;
        $.post("../TaskStatusToWorking", {id: taskid}, function (response) {
            console.log(response);
        });
        FetchTaskDetails();
    }

    function complete(id) {
        let taskid = id;
        $.post("../TaskStatusToComplete", {id: taskid}, function (response) {
            console.log(response);
        });
        FetchTaskDetails();
    }

    function stop(id) {
        let taskid = id;
        $.post("../TaskStatusToStop", {id: taskid}, function (response) {
            console.log(response);
        });
        FetchTaskDetails();
    }
</script>