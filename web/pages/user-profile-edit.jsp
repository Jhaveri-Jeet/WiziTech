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
                    <div class="card-body p-0">
                        <div class="iq-edit-list usr-edit">
                            <ul class="iq-edit-profile d-flex nav nav-pills">
                                <li class="col-md-4 p-0">
                                    <a class="nav-link active" data-toggle="pill" href="#personal-information">
                                        Personal Information
                                    </a>
                                </li>
                                <li class="col-md-4 p-0">
                                    <a class="nav-link" data-toggle="pill" href="#chang-pwd">
                                        Change Password
                                    </a>
                                </li>
                                <li class="col-md-4 p-0">
                                    <a class="nav-link" data-toggle="pill" href="#social">
                                        Social
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="iq-edit-list-data">
                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="personal-information" role="tabpanel">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between">
                                    <div class="iq-header-title">
                                        <h4 class="card-title">Personal Information</h4>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form enctype="multipart/form-data">
                                        <div class="form-group row align-items-center">
                                            <div class="col-md-6">
                                                <label for="cname">Profile Photo</label>
                                                <div class="profile-img-edit">
                                                    <div class="crm-profile-img-edit">
                                                        <img class="crm-profile-pic rounded-circle avatar-100" src="../assets/images/user/11.png" alt="profile-pic">
                                                        <div class="crm-p-image bg-primary">
                                                            <i class="las la-pen upload-button"></i>
                                                            <input class="file-upload" type="file" id="profilePhoto">
                                                            <input type="hidden" id="oldImage">
                                                        </div>
                                                    </div>                                          
                                                </div>
                                            </div>
                                        </div>
                                        <div class=" row align-items-center">
                                            <div class="form-group col-sm-6">
                                                <label for="uname">Full Name:</label>
                                                <input type="text" class="form-control" id="name">
                                                <input type="hidden" class="form-control" id="developerId">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label for="dob">Date Of Birth:</label>
                                                <input type="date" class="form-control" id="birthDate">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label>Age:</label>
                                                <input class="form-control" id="age" type="text">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label>Number :</label>
                                                <input class="form-control" id="number" type="text">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label>Email :</label>
                                                <input class="form-control" id="email" type="text">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label>Caption :</label>
                                                <input class="form-control" id="caption" type="text">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label>About :</label>
                                                <input class="form-control" id="about" type="text">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label>Country:</label>
                                                <input class="form-control" id="country" type="text">
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label>State:</label>
                                                <input class="form-control" id="state" type="text">
                                            </div>
                                        </div>
                                        <input type="button" value="Save" class="btn btn-primary mr-2" onclick="UpdateDeveloper()"/>
                                        <a href="<%= request.getContextPath()%>/pages/user-profile.jsp" class="btn iq-bg-danger">Cancel</a>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="chang-pwd" role="tabpanel">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between">
                                    <div class="iq-header-title">
                                        <h4 class="card-title">Change Password</h4>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="cpass">New Password:</label>
                                            <a href="javascripe:void();" class="float-right"></a>
                                            <input type="text" class="form-control" id="password" value="">
                                        </div>
                                        <button type="submit" class="btn btn-primary mr-2" onclick="UpdateDeveloper()">Submit</button>
                                        <button type="reset" class="btn iq-bg-danger">Cancel</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="social" role="tabpanel">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between">
                                    <div class="iq-header-title">
                                        <h4 class="card-title">Manage Social Media Links</h4>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="cno">GitHub:</label>
                                            <input type="text" class="form-control" id="github">
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Instagram:</label>
                                            <input type="text" class="form-control" id="instagram">
                                        </div>
                                        <div class="form-group">
                                            <label for="url">Facebook</label>
                                            <input type="text" class="form-control" id="facebook">
                                        </div>
                                        <div class="form-group">
                                            <label for="url">Twitter</label>
                                            <input type="text" class="form-control" id="twitter">
                                        </div>
                                        <input type="button" class="btn btn-primary mr-2" value="Save" onclick="UpdateDeveloper()">
                                        <a href="<%= request.getContextPath()%>/pages/user-profile.jsp" class="btn iq-bg-danger">Cancel</a>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- Wrapper End-->

<%@ include file = "../includes/footer.jsp" %>
<%@ include file = "../includes/scripts.jsp" %>

<script>
    $(init);

    function init() {
        CurrentDeveloperDetails();
    }

    function CurrentDeveloperDetails() {
        $.post('../CurrentDeveloperDetails', function (response) {
            for (let i = 0; i < response.length; i++) {
                $('#age').val(response[i].age);
                $('#developerId').val(response[i].id);
                $('#name').val(response[i].developerName);
                $('#number').val(response[i].number);
                $('#status').text(response[i].status);
                $('#country').val(response[i].country);
                $('#state').val(response[i].state);
                $('#password').val(response[i].developerPassword);
                $('#birthDate').val(response[i].birthDate);
                $('#email').val(response[i].developerEmail);
                $('#caption').val(response[i].caption);
                $('#about').val(response[i].about);
                $("#facebook").val(response[i].facebook);
                $("#twitter").val(response[i].twitter);
                $("#instagram").val(response[i].instagram);
                $("#github").val(response[i].github);
                $("#oldImage").val(response[i].profilePhoto);
            }
        });
    }

    async function UpdateDeveloper() {
        let formData = new FormData();
        formData.append("id", $("#developerId").val());
        formData.append("developerName", $("#name").val());
        formData.append("developerPassword", $("#password").val());
        formData.append("number", $("#number").val());
        formData.append("developerEmail", $("#email").val());
        formData.append("birthDate", $("#birthDate").val());
        formData.append("age", $("#age").val());
        formData.append("country", $("#country").val());
        formData.append("state", $("#state").val());
        formData.append("github", $("#github").val());
        formData.append("instagram", $("#instagram").val());
        formData.append("twitter", $("#twitter").val());
        formData.append("facebook", $("#facebook").val());
        formData.append("about", $("#about").val());
        formData.append("caption", $("#caption").val());
        formData.append("image", $("#profilePhoto")[0].files[0]);
        formData.append("oldImage", $("#oldImage").val());

        var response = await $.ajax({
            url: "../UpdateDeveloper",
            method: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function () {
                console.log(response);
                window.location.reload();
            },
            fail: function (error) {
                console.log(error);
                window.location.reload();
            }
        });
        window.location.reload();
    }
</script>