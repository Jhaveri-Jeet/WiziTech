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
                            <h5>Your Clients</h5>
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
                                <div class="pl-3 border-left btn-new">
                                    <a href="#" class="btn btn-primary" data-target="#new-user-modal" data-toggle="modal">New Client</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Grid View-->
        <div id="grid" class="item-content animate__animated animate__fadeIn active" data-toggle-extra="tab-content">
            <div class="row" id="clientData">
            </div>
        </div>

        <!--List view-->
        <div id="list" class="item-content animate__animated animate__fadeIn" data-toggle-extra="tab-content">
            <div class="table-responsive rounded bg-white mb-4">
                <table class="table mb-0 table-borderless tbl-server-info">
                    <tbody id="clientDataListView">
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
                <h3 class="modal-title" id="exampleModalCenterTitle02" >New Client</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText2" class="h5">Full Name</label>
                            <input type="text" class="form-control" id="name" placeholder="Enter your full name" autofocus tabindex="1">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText04" class="h5">Phone Number</label>
                            <input type="number" class="form-control" id="number" placeholder="Enter phone number" tabindex="2">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText006" class="h5">Address</label>
                            <input type="text" class="form-control" id="address" placeholder="Enter your Address" tabindex="3">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText006" class="h5">Country</label>
                            <input type="text" class="form-control" id="country" placeholder="Enter your Country" tabindex="4">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText006" class="h5">State</label>
                            <input type="text" class="form-control" id="state" placeholder="Enter your State" tabindex="5">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText2" class="h5">Project</label>
                            <select name="type" class="form-control" data-style="py-0" tabindex="6" id="project">
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="d-flex flex-wrap align-items-ceter justify-content-center mt-2">
                            <input type="button" value="Save" class="btn btn-primary mr-3" data-dismiss="modal" tabindex="7" onclick="addClient()"></input>
                            <input type="button" value="Cancle" class="btn btn-primary" data-dismiss="modal"></input>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 

<!--VIew Modal-->
<div class="modal fade bd-example-modal-lg" role="dialog" aria-modal="true" id="view-client-modal">
    <div class="modal-dialog  modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header d-block text-center pb-3 border-bttom">
                <h3 class="modal-title" id="exampleModalCenterTitle02" >View Client</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText2" class="h5">Full Name</label>
                            <input type="text" class="form-control" id="viewName" disabled autofocus tabindex="1">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText04" class="h5">Phone Number</label>
                            <input type="number" class="form-control" id="viewNumber" disabled tabindex="2">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText006" class="h5">Address</label>
                            <input type="text" class="form-control" id="viewAddress" disabled tabindex="3">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText006" class="h5">Country</label>
                            <input type="text" class="form-control" id="viewCountry" disabled tabindex="4">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText006" class="h5">State</label>
                            <input type="text" class="form-control" id="viewState" disabled tabindex="5">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText006" class="h5">Project</label>
                            <input type="text" class="form-control" id="projectTitle" disabled tabindex="5">
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="d-flex flex-wrap align-items-ceter justify-content-center mt-2">
                            <input type="button" value="Close" class="btn btn-primary" data-dismiss="modal"></input>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 

<!--Update Modal-->
<div class="modal fade bd-example-modal-lg" role="dialog" aria-modal="true" id="update-client-modal">
    <div class="modal-dialog  modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header d-block text-center pb-3 border-bttom">
                <h3 class="modal-title" id="exampleModalCenterTitle02" >Update Client</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group mb-3">
                            <label for="exampleInputText2" class="h5">Full Name</label>
                            <input type="text" class="form-control" id="updateName" placeholder="Enter your full name" autofocus tabindex="1">
                                <input type="hidden" class="form-control" id="updateId">
                                    </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-3">
                                            <label for="exampleInputText04" class="h5">Phone Number</label>
                                            <input type="number" class="form-control" id="updateNumber" placeholder="Enter phone number" tabindex="2">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-3">
                                            <label for="exampleInputText006" class="h5">Address</label>
                                            <input type="text" class="form-control" id="updateAddress" placeholder="Enter your Address" tabindex="3">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-3">
                                            <label for="exampleInputText006" class="h5">Country</label>
                                            <input type="text" class="form-control" id="updateCountry" placeholder="Enter your Country" tabindex="4">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-3">
                                            <label for="exampleInputText006" class="h5">State</label>
                                            <input type="text" class="form-control" id="updateState" placeholder="Enter your State" tabindex="5">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group mb-3">
                                            <label for="exampleInputText2" class="h5">Project</label>
                                            <select name="type" class="form-control" data-style="py-0" tabindex="6" id="updateProject">
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="d-flex flex-wrap align-items-ceter justify-content-center mt-2">
                                            <input type="button" value="Update" class="btn btn-primary mr-3" data-dismiss="modal" tabindex="7" onclick="updateClient()"></input>
                                            <input type="button" value="Cancel" class="btn btn-primary" data-dismiss="modal"></input>
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
                                                                    <div class="btn btn-secondary mr-3" data-dismiss="modal" onclick="deleteClient()">Yes</div>
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
                                            FetchClientDetails();
                                            FetchProjectsName();
                                        }

                                        async function FetchProjectsName() {
                                            let result = await $.post("../FetchProjectNames");
                                            let options = ``;
                                            for (var i = 0; i < result.length; i++) {
                                                options += `<option value="` + result[i].Id + `" >` + result[i].projectTitle + `</option>`;
                                            }
                                            $("#project").html(options);
                                        }

                                        async function FetchProjectsUpdateName(projectTitle) {
                                            let result = await $.post("../FetchProjectNames");
                                            let updateOptions = ``;
                                            for (var i = 0; i < result.length; i++) {
                                                let isSelected = result[i].projectTitle === projectTitle ? 'selected' : '';
                                                updateOptions += `<option value="` + result[i].Id + `" ` + isSelected + ` >` + result[i].projectTitle + `</option>`;
                                            }
                                            $("#updateProject").html(updateOptions);
                                        }
                                        
                                        async function FetchClientDetails() {
                                            let result = await $.post("../FetchClientDetails");
                                            let dataGridView = '';
                                            let dataListView = '';
                                            for (let i = 0; i < result.length; i++) {

                                                dataGridView += `
                                                                                        <div class="col-lg-4 col-md-6">
                                                                                            <div class="card-transparent card-block card-stretch card-height">
                                                                                                <div class="card-body text-center p-0">                            
                                                                                                    <div class="item">
                                                                                                        <div class="odr-img">
                                                                                                            <img src="<%=request.getContextPath()%>/assets/uploads/project-logo/` + result[i].logo + `" class="img-fluid rounded-circle avatar-90 m-auto" alt="image">
                                                                                                        </div>                        
                                                                                                        <div class="odr-content rounded">                                          
                                                                                                            <h4 class="mb-2">` + result[i].clientName + `</h4>
                                                                                                            <p class="mb-3"><a href="` + result[i].url + `" target="_blank">` + result[i].projectTitle + `</a></p>
                                                                                                            <div class="pt-3 border-top">
                                                                                                                <a class="bg-success-light rounded-circle iq-card-icon-small m-1" onclick="viewData('` + result[i].clientName + `','` + result[i].clientNumber + `','` + result[i].clientAddress + `','` + result[i].clientCountry + `','` + result[i].clientState + `','` + result[i].projectTitle + `')" data-target="#view-client-modal" data-toggle="modal"><i class="ri-eye-2-line m-0"></i></a>
                                                                                                                <a class="bg-warning-light rounded-circle iq-card-icon-small m-1" onclick="updateData(` + result[i].Id + `,'` + result[i].clientName + `','` + result[i].clientNumber + `','` + result[i].clientAddress + `','` + result[i].clientCountry + `','` + result[i].clientState + `','` + result[i].projectTitle + `')" data-target="#update-client-modal" data-toggle="modal"><i class="ri-edit-box-fill m-0"></i></a>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    `;
                                                dataListView += `
                                                                                        <tr>
                                                                                            <td>
                                                                                                <div class="media align-items-center">
                                                                                                    <img src="<%=request.getContextPath()%>/assets/uploads/project-logo/` + result[i].logo + `" class="img-fluid rounded-circle avatar-40" alt="image">
                                                                                                    <h5 class="ml-3">` + result[i].clientName + `</h5>
                                                                                                </div>
                                                                                            </td>
                                                                                            <td><a href="` + result[i].url + `" target="_blank">` + result[i].projectTitle + `</a></td>
                                                                                            <td>
                                                                                                <a class="bg-success-light rounded-circle iq-card-icon-small m-1"><i class="ri-eye-2-line m-0" onclick="viewData('` + result[i].clientName + `','` + result[i].clientNumber + `','` + result[i].clientAddress + `','` + result[i].clientCountry + `','` + result[i].clientState + `','` + result[i].projectTitle + `')" data-target="#view-client-modal" data-toggle="modal"></i></a>
                                                                                                <a class="bg-warning-light rounded-circle iq-card-icon-small m-1" onclick="updateData(` + result[i].Id + `,'` + result[i].clientName + `','` + result[i].clientNumber + `','` + result[i].clientAddress + `','` + result[i].clientCountry + `','` + result[i].clientState + `','` + result[i].projectTitle + `')" data-target="#update-client-modal" data-toggle="modal"><i class="ri-edit-box-fill m-0"></i></a>
                                                                                            </td>
                                                                                        </tr>
                                                                                    `;
                                            }

                                            $("#clientData").html(dataGridView);
                                            $("#clientDataListView").html(dataListView);
                                        }

                                        function addClient() {
                                            let data = {
                                                name: $('#name').val().trim(),
                                                number: $('#number').val().trim(),
                                                address: $('#address').val().trim(),
                                                country: $('#country').val().trim(),
                                                state: $('#state').val().trim(),
                                                projectId: $("#project option:selected").val()
                                            };
                                            $.ajax({
                                                url: "../AddClient",
                                                data: data,
                                                method: "POST",
                                                success: function (response) {
                                                    console.log(response);
                                                    $('#name').val("");
                                                    $('#number').val("");
                                                    $('#address').val("");
                                                    $('#country').val("");
                                                    $('#state').val("");
                                                    location.reload();
                                                }
                                            });
                                            window.location.reload();
                                        }

                                        function viewData(name, number, address, country, state, projectTitle) {
                                            var name = name;
                                            var number = number;
                                            var address = address;
                                            var country = country;
                                            var state = state;
                                            var projectTitle = projectTitle;
                                            $('#viewName').val(name);
                                            $('#viewNumber').val(number);
                                            $('#viewAddress').val(address);
                                            $('#viewCountry').val(country);
                                            $('#viewState').val(state);
                                            $('#projectTitle').val(projectTitle);
                                        }

                                        function updateData(id, name, number, address, country, state, projectTitle) {
                                            $('#updateId').val(id);
                                            $('#updateName').val(name);
                                            $('#updateNumber').val(number);
                                            $('#updateAddress').val(address);
                                            $('#updateCountry').val(country);
                                            $('#updateState').val(state);

                                            FetchProjectsUpdateName(projectTitle);
                                        }

                                        function updateClient() {
                                            let data = {
                                                id: $("#updateId").val(),
                                                name: $('#updateName').val(),
                                                number: $('#updateNumber').val(),
                                                address: $('#updateAddress').val(),
                                                country: $('#updateCountry').val(),
                                                state: $('#updateState').val(),
                                                projectId: $("#updateProject option:selected").val()

                                            };

                                            $.post('../UpdateClient', data, function (response) {
                                                console.log(response);
                                                $('#updateId').val("");
                                                $('#updateName').val("");
                                                $('#updateNumber').val("");
                                                $('#updateAddress').val("");
                                                $('#updateCountry').val("");
                                                $('#updateState').val("");
                                            });
                                            window.location.reload();
                                        }

                                        function deleteData(id) {
                                            var id = id;

                                            $("#deleteId").val(id);
                                        }

                                        function deleteClient() {
                                            $.post('../DeleteClient', {id: $('#deleteId')}, function (response) {
                                                console.log(response);
                                                $("#deletId").val("");
                                            });
                                        }
                                    </script>