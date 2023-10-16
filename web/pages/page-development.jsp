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
                            <h5>Your Development</h5>
                            <div class="d-flex flex-wrap align-items-center">
                                <a href="#" class="btn btn-primary" data-target="#new-task-modal" data-toggle="modal">New</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row" id="developmentNames">
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
                <h3 class="modal-title" id="exampleModalCenterTitle">New</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group mb-3">
                            <label for="exampleInputText02" class="h5">Development Name</label>
                            <input type="text" class="form-control" id="name" placeholder="Enter Development Name" autofocus>
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

<!--Update Modal-->
<div class="modal fade bd-example-modal-lg" role="dialog" aria-modal="true" id="update-development-modal">
    <div class="modal-dialog  modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header d-block text-center pb-3 border-bttom">
                <h3 class="modal-title" id="exampleModalCenterTitle">Update Development</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group mb-3">
                            <label for="exampleInputText02" class="h5">Development</label>
                            <input type="text" class="form-control" id="updateName">
                            <input type="hidden" class="form-control" id="updateId">
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="d-flex flex-wrap align-items-ceter justify-content-center mt-4">
                            <div class="btn btn-primary mr-3" data-dismiss="modal" onclick="updateData()">Update</div>
                            <div class="btn btn-primary" data-dismiss="modal">Cancel</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--Delete Modal-->
<div class="modal fade bd-example-modal-lg" role="dialog" aria-modal="true" id="delete-role-modal">
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
        fetchData();
    }

    function fetchData() {
        $.post("../FetchDevelopmentNames", function (result) {
            let mainData = '';
            for (let i = 0; i < result.length; i++) {
                let html = `
                <div class="col-lg-12">
                        <div class="card card-widget task-card">
                            <div class="card-body">
                                <div class="d-flex flex-wrap align-items-center justify-content-between">
                                    <div class="d-flex align-items-center">
                                        <div>
                                            <h5 class="mb-2">` + result[i].name + `</h5>
                                        </div>
                                    </div>
                                    <div class="media align-items-center mt-md-0 mt-3">
                                        <a class="btn bg-warning-light mr-4 rounded-circle" role="button" onclick="editData(` + result[i].id + `,'` + result[i].name + `')" data-target="#update-development-modal" data-toggle="modal"><i class="ri-edit-box-fill m-0"></i></a>
                                        <a class="btn bg-secondary-light rounded-circle" role="button" onclick="deleteId(` + result[i].id + `)" data-target="#delete-role-modal" data-toggle="modal"><i class="ri-delete-bin-line m-0"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                `;
                mainData += html;
            }
            $("#developmentNames").html(mainData);
        });
    }

    function sendData() {
        var name = $("#name").val();
        let data = {
            name: name
        };

        $.post("../AddDevelopment", data, function (response) {
            console.log(response);
        });
        $("#name").val("");
        fetchData();
        window.location.reload();
    }

    function editData(id, name) {
        var name = name;
        var id = id;

        $("#updateName").val(name);
        $("#updateId").val(id);
    }

    function updateData() {
        var name = $("#updateName").val();
        var id = $("#updateId").val();
        let data = {
            name: name,
            id: id
        };

        $.post("../UpdateDevelopment", data, function (response) {
            console.log(response);
        });
        $("#updateName").val("");
        $("#updateId").val("");
        fetchData();
        window.location.reload();
    }

    function deleteId(id) {
        var id = id;

        $("#deleteId").val(id);
    }

    function deleteData() {
        var id = $("#deleteId").val();

        $.post("../DeleteDevelopment", {id: id}, function (response) {
            console.log(response);
        });
        fetchData();
        window.location.reload();
    }
</script>
