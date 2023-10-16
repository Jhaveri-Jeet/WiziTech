<%@ page language   ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                            <h5>Your Developers</h5>
                            <div class="d-flex align-items-center">                                
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
                                        <a href="#" class="btn btn-primary" data-target="#new-user-modal" data-toggle="modal">New Developer</a>
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
            <div class="row" id="gridHtml">
            </div>
        </div>

        <!--List View-->
        <div id="list" class="item-content animate__animated animate__fadeIn" data-toggle-extra="tab-content">
            <div class="table-responsive rounded bg-white mb-4">
                <table class="table mb-0 table-borderless tbl-server-info">
                    <tbody id="listHtml">
                        <tr>
                            <td>
                                <div class="media align-items-center">
                                    <img src="../assets/images/user/01.jpg" class="img-fluid rounded-circle avatar-40" alt="image">
                                        <h5 class="ml-3">Paityn Siphron</h5>
                                </div>
                            </td>
                            <td>paitynsiphron@gmail.com</td>
                            <td>
                                <div class="media align-items-center">
                                    <div class="bg-secondary-light rounded-circle iq-card-icon-small mr-3"><i class="ri-mail-open-line m-0"></i></div>
                                    <div class="bg-primary-light rounded-circle iq-card-icon-small mr-3"><i class="ri-chat-3-line m-0"></i></div>
                                    <div class="bg-success-light rounded-circle iq-card-icon-small"><i class="ri-phone-line m-0"></i></div>
                                </div>
                            </td>
                            <td>
                                <a href="#" class="btn btn-primary">Message</a>
                            </td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <a href="#" class="text-body"><i class="las la-pen mr-3"></i></a>
                                    <a href="#" class="text-body"><i class="las la-trash-alt mr-0"></i></a>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Page end  -->
    </div>
</div>
</div>
<!-- Wrapper End-->

<!-- Modal list start -->
<div class="modal fade bd-example-modal-lg" role="dialog" aria-modal="true" id="new-user-modal">
    <div class="modal-dialog  modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header d-block text-center pb-3 border-bttom">
                <h3 class="modal-title" id="exampleModalCenterTitle02">New Developer</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText2" class="h5">Full Name</label>
                            <input type="text" class="form-control" id="name" placeholder="Enter your full name">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText2" class="h5">Password</label>
                            <input type="text" class="form-control" id="password" placeholder="Enter your Password">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText2" class="h5">Role</label>
                            <select name="type" class="form-control" id="roles" data-style="py-0">
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText04" class="h5">Phone Number</label>
                            <input type="text" class="form-control" id="number" placeholder="Enter phone number">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText006" class="h5">Email</label>
                            <input type="text" class="form-control" id="email" placeholder="Enter your Email">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText006" class="h5">Age</label>
                            <input type="text" class="form-control" id="age" placeholder="Enter your Age">
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText006" class="h5">Birth-Date</label>
                            <input type="date" class="form-control" id="birthDate" placeholder="Enter your Birth Date">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText006" class="h5">Joining Date</label>
                            <input type="date" class="form-control" id="joiningDate" placeholder="Enter your Joining Date">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText006" class="h5">Gender</label>
                            <input type="text" class="form-control" id="gender" placeholder="Enter your Gender">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText006" class="h5">Country</label>
                            <input type="text" class="form-control" id="country" placeholder="Enter your Country">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText006" class="h5">State</label>
                            <input type="text" class="form-control" id="state" placeholder="Enter your State">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText006" class="h5">Salary</label>
                            <input type="text" class="form-control" id="salary" placeholder="Enter your Salary">
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="d-flex flex-wrap align-items-ceter justify-content-center mt-2">
                            <div class="btn btn-primary mr-3" data-dismiss="modal" onclick="addDeveloper()">Save</div>
                            <div class="btn btn-primary" data-dismiss="modal">Cancel</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--Delete Developer-->
<div class="modal fade bd-example-modal-lg" role="dialog" aria-modal="true" id="delete-developer-modal">
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
        FetchRoleName();
        FetchDeveloperDetails();
        setStatus();
    }

    async function FetchRoleName() {
        let result = await $.post("../FetchRoleName");
        console.log(result);
        let options = ``;
        for (let i = 0; i < result.length; i++) {
            options += `<option value="` + result[i].id + `" >` + result[i].name + `</option>`;
        }
        console.log(options);
        $("#roles").html(options);
    }

    async function FetchDeveloperDetails() {
        let result = await $.post("../FetchDeveloperDetails");
        console.log(result);
        let gridhtml = '';
        let listhtml = '';
        for (let i = 0; i < result.length; i++) {
            gridhtml += `
                <div class="col-lg-4 col-md-6">
                    <div class="card-transparent card-block card-stretch card-height">
                        <div class="card-body text-center p-0">                            
                            <div class="item">
                                <div class="odr-img">
                                    <img src="../assets/uploads/developer-profile-photo/` + result[i].profilePhoto + `" class="img-fluid rounded-circle avatar-100 m-auto" alt="image" style="object-fit: cover !important;box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;">
                                </div>                        
                                <div class="odr-content rounded">                                          
                                    <h4 class="mb-2">` + result[i].developerName + ` <i class="ri-aliens-fill m-0 p-0 text-success" id="456` + result[i].id + `"></i></h4>
                                    <p class="mb-3 mt-3 text-black">` + result[i].roleName + `</p>
                                    <ul class="list-unstyled mb-3">
                                        <li class="bg-warning-light rounded-circle iq-card-icon-small mr-4"><a href="` + result[i].github + `" class="bg-warning-light rounded-circle iq-card-icon-small" target="_blank"><i class="ri-github-fill m-0"></i></a></li>
                                        <li class="bg-info-light rounded-circle iq-card-icon-small mr-4"><a href="` + result[i].twitter + `" class="bg-info-light rounded-circle iq-card-icon-small" target="_blank"><i class="ri-twitter-fill m-0"></i></a></li>
    <c:if test="${userName eq 'Owner'}">
                                        <li class="bg-secondary-light rounded-circle iq-card-icon-small mr-4"><a onclick="deleteId(` + result[i].id + `)" data-target="#delete-developer-modal" data-toggle="modal" class="bg-secondary-light rounded-circle iq-card-icon-small" target="_blank"><i class="ri-delete-bin-line m-0"></i></a></li>
    </c:if>
                                        <li class="bg-success-light rounded-circle iq-card-icon-small "><a href="https://wa.me/+91` + result[i].number + `" class="bg-success-light rounded-circle iq-card-icon-small" target="_blank"><i class="ri-whatsapp-line m-0"></i></a></li>
                                    </ul>                                    
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        `;

            listhtml += `
                                    <tr>
                            <td>
                                <div class="media align-items-center">
                                    <img src="../assets/uploads/developer-profile-photo/` + result[i].profilePhoto + `" class="img-fluid rounded-circle avatar-40" alt="image" style="object-fit: cover !important;box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;">
                                        <h5 class="ml-3">` + result[i].developerName + `</h5>
                                </div>
                            </td>
                            <td>` + result[i].roleName + `</td>
                            <td>
                                <div class="media align-items-center">
                                    <div class="bg-warning-light rounded-circle iq-card-icon-small mr-3"><a href="` + result[i].github + `" class="bg-warning-light rounded-circle iq-card-icon-small" target="_blank"><i class="ri-github-fill m-0"></i></a></div>
                                    <div class="bg-info-light rounded-circle iq-card-icon-small mr-3"><a href="` + result[i].twitter + `" class="bg-info-light rounded-circle iq-card-icon-small" target="_blank"><i class="ri-twitter-fill m-0"></i></a></div>
    <c:if test="${userName eq 'Owner'}">
                                    <div class="bg-secondary-light rounded-circle iq-card-icon-small mr-3"><a onclick="deleteId(` + result[i].id + `)" data-target="#delete-developer-modal" data-toggle="modal" class="bg-secondary-light rounded-circle iq-card-icon-small" target="_blank"><i class="ri-delete-bin-line m-0"></i></a></div>
    </c:if>
                                    <div class="bg-success-light rounded-circle iq-card-icon-small"><a href="https://wa.me/+91` + result[i].number + `" class="bg-success-light rounded-circle iq-card-icon-small" target="_blank"><i class="ri-whatsapp-line m-0"></i></a></div>
                                </div>
                            </td>
                        </tr>
        `;
        }
        $("#gridHtml").html(gridhtml);
        $("#listHtml").html(listhtml);
    }

    async function addDeveloper() {
        let data = {
            name: $('#name').val().trim(),
            password: $('#password').val().trim(),
            number: $('#number').val().trim(),
            email: $('#email').val().trim(),
            roleId: $("#roles option:selected").val(),
            birthDate: $('#birthDate').val().trim(),
            age: $('#age').val().trim(),
            gender: $('#gender').val().trim(),
            country: $('#country').val().trim(),
            state: $('#state').val().trim(),
            dateOfJoining: $('#joiningDate').val().trim(),
            salary: $('#salary').val().trim()
        };
        var response = await $.ajax({
            url: "../AddDeveloper",
            data: data,
            method: "POST",
            success: function () {
                console.log(response);
                location.reload();
            }
        });
        $('#name').val("");
        $('#email').val("");
        $('#age').val("");
        $('#birthdate').val("");
        $('#joiningdate').val("");
        $('#gender').val("");
        $('#salary').val("");
        $('#password').val("");
        $('#number').val("");
        $('#address').val("");
        $('#country').val("");
        $('#state').val("");
        window.location.reload();
    }

    function deleteId(id) {
        var id = id;

        $("#deleteId").val(id);
    }

    function deleteData() {
        var id = $("#deleteId").val();

        $.post("../DeleteDeveloper", {id: id}, function (response) {
            console.log(response);
        });
        window.location.reload();
    }

    function setStatus() {
        setInterval(function () {

            $.post("../FetchDeveloperNames", function (response) {
                for (let i = 0; i < response.length; i++) {
                    let selector;
                    if (response[i].status === 'Online') {
                        selector = '#456' + response[i].id;
                        $(selector).addClass('text-success');
                        $(selector).removeClass('text-secondary');
                        $(selector).removeClass('text-warning');

                    } else if (response[i].status === 'Offline') {
                        selector = '#456' + response[i].id;
                        $(selector).addClass('text-secondary');
                        $(selector).removeClass('text-success');
                        $(selector).removeClass('text-warning');

                    } else if (response[i].status === 'Working') {
                        selector = '#456' + response[i].id;
                        $(selector).addClass('text-warning');
                        $(selector).removeClass('text-success');
                        $(selector).removeClass('text-secondary');
                    }
                }
                ;
            });

        }, 1000);
    }
</script>