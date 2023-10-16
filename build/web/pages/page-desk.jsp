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
                        <div
                            class="d-flex flex-wrap align-items-center justify-content-between breadcrumb-content"
                            >
                            <h5>Desk</h5>
                            <div
                                class="d-flex flex-wrap align-items-center justify-content-between"
                                >
                                <div
                                    class="list-grid-toggle d-flex align-items-center mr-3"
                                    >
                                    <div
                                        data-toggle-extra="tab"
                                        data-target-extra="#grid"
                                        class="active"
                                        >
                                        <div class="grid-icon mr-3">
                                            <svg
                                                width="20"
                                                height="20"
                                                xmlns="http://www.w3.org/2000/svg"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                stroke="currentColor"
                                                stroke-width="2"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                >
                                                <rect x="3" y="3" width="7" height="7"></rect>
                                                <rect x="14" y="3" width="7" height="7"></rect>
                                                <rect x="14" y="14" width="7" height="7"></rect>
                                                <rect x="3" y="14" width="7" height="7"></rect>
                                            </svg>
                                        </div>
                                    </div>
                                    <div data-toggle-extra="tab" data-target-extra="#list">
                                        <div class="grid-icon">
                                            <svg
                                                width="20"
                                                height="20"
                                                xmlns="http://www.w3.org/2000/svg"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                stroke="currentColor"
                                                stroke-width="2"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                >
                                                <line x1="21" y1="10" x2="3" y2="10"></line>
                                                <line x1="21" y1="6" x2="3" y2="6"></line>
                                                <line x1="21" y1="14" x2="3" y2="14"></line>
                                                <line x1="21" y1="18" x2="3" y2="18"></line>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div
            id="grid"
            class="item-content animate__animated animate__fadeIn active"
            data-toggle-extra="tab-content"
            >
            <div class="row">
                <div class="col-lg-4">
                    <div class="card-transparent mb-0 desk-info">
                        <div class="card-body p-0">
                            <div class="row">
                                <!--Open Projects / Pending Projects-->
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div
                                                class="d-flex align-items-center justify-content-between"
                                                >
                                                <h5 id="pendingProjects"></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12" id="pendingProjectData">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--In Progress / Working Projects-->
                <div class="col-lg-4">
                    <div class="card-transparent mb-0 desk-info">
                        <div class="card-body p-0">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div
                                                class="d-flex align-items-center justify-content-between"
                                                >
                                                <h5 id="workingProjects"></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12" id="workingProjectData">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Completed Projects-->
                <div class="col-lg-4">
                    <div class="card-transparent mb-0 desk-info">
                        <div class="card-body p-0">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div
                                                class="d-flex align-items-center justify-content-between"
                                                >
                                                <h5 id="completedProjects"></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12" id="completedProjectData">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--List view started-->
        <div
            id="list"
            class="item-content animate__animated animate__fadeIn"
            data-toggle-extra="tab-content"
            >
            <div class="table-responsive rounded bg-white mb-4">
                <table
                    class="table mb-0 table-borderless tbl-server-info tble-min-width"
                    >
                    <tbody id="listHtml">
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Page end  -->
    </div>
</div>
</div>
<!-- Wrapper End-->
<%@ include file = "../includes/footer.jsp" %>
<%@ include file = "../includes/scripts.jsp" %>

<script>
    $(init);

    function init() {
        fetchProjectCount();
        fetchProjectDetails();
        fetchProjectDetailsForListView();
    }

    function fetchProjectCount() {
        $.post("../FetchProjectCount", function (response) {
            let pendinghtml = 'Open Projects ( ' + response[0].pendingProjectCount + ' )';
            $('#pendingProjects').html(pendinghtml);
            let workinghtml = 'In Progress ( ' + response[0].workingProjectCount + ' )';
            $('#workingProjects').html(workinghtml);
            let completedhtml = 'Completed ( ' + response[0].completedProjectCount + ' )';
            $('#completedProjects').html(completedhtml);
        });
    }

    function fetchProjectDetails() {
        $.post("../FetchProjectDetails", function (response) {
            let pendingData = '';
            let workingData = '';
            let completedData = '';
            for (let i = 0; i < response.length; i++) {
                if (response[i].status === 'Pending') {
                    var pendinghtml = `
                        <div class="card">
                            <div class="card-body">
                                <h5 class="mb-3">` + response[i].projectTitle + `</h5>
                                    <p class="mb-3">
                                        <i class="las la-calendar-check mr-2"></i>` + response[i].dateOfStarted + `
                                    </p>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="iq-media-group">
                                            <a href="#" class="iq-media">
                                                <img src="<%=request.getContextPath()%>/assets/uploads/project-logo/` + response[i].logo + `" class="img-fluid avatar-40 rounded-circle" alt="" />
                                            </a>
                                        </div>
                                        <div>
                                            <a href="#" class="btn ` + (response[i].developmentName === 'Website' ? 'bg-success-light' : (response[i].developmentName === 'Software' ? 'bg-primary-light' : 'bg-warning-light')) + `">` + response[i].developmentName + `</a>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    `;
                    pendingData += pendinghtml;
                } else if (response[i].status === 'Working') {
                    var workinghtml = `
                        <div class="card">
                            <div class="card-body">
                                <h5 class="mb-3">` + response[i].projectTitle + `</h5>
                                    <p class="mb-3">
                                        <i class="las la-calendar-check mr-2"></i>` + response[i].dateOfStarted + `
                                    </p>
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="iq-media-group">
                                            <a href="#" class="iq-media">
                                                <img src="<%=request.getContextPath()%>/assets/uploads/project-logo/` + response[i].logo + `" class="img-fluid avatar-40 rounded-circle" alt="" />
                                            </a>
                                        </div>
                                    <div>
                                        <a href="#" class="btn ` + (response[i].developmentName === 'Website' ? 'bg-success-light' : (response[i].developmentName === 'Software' ? 'bg-primary-light' : 'bg-warning-light')) + `">` + response[i].developmentName + `</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `;
                    workingData += workinghtml;
                } else {
                    var completedhtml = `
                        <div class="card">
                            <div class="card-body">
                                <h5 class="mb-3">` + response[i].projectTitle + `</h5>
                                    <p class="mb-3">
                                        <i class="las la-calendar-check mr-2"></i>` + response[i].dateOfStarted + `
                                    </p>
                                    <div class="d-flex align-items-center justify-content-between" >
                                        <div class="iq-media-group">
                                            <a href="#" class="iq-media">
                                                <img src="<%=request.getContextPath()%>/assets/uploads/project-logo/` + response[i].logo + `" class="img-fluid avatar-40 rounded-circle" alt="" />
                                            </a>
                                        </div>
                                    <div>
                                        <a href="#" class="btn ` + (response[i].developmentName === 'Website' ? 'bg-success-light' : (response[i].developmentName === 'Software' ? 'bg-primary-light' : 'bg-warning-light')) + `">` + response[i].developmentName + `</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `;
                    completedData += completedhtml;
                }
            }
            $("#pendingProjectData").html(pendingData);
            $("#workingProjectData").html(workingData);
            $("#completedProjectData").html(completedData);

        });

    }

    function fetchProjectDetailsForListView() {
        $.post("../FetchProjectDetails", function (response) {
            let listHtml = '';
            for (let i = 0; i < response.length; i++) {
                listHtml += `
                    <tr>
                            <td>` + response[i].projectTitle + `</td>
                            <td class="w-25">
                                <div class="iq-progress-bar bg-secondary-light">
                                    <span
                                        class="bg-secondary iq-progress progress-2"
                                        data-percent="65"
                                        ></span>
                                </div>
                            </td>
                            <td>
                                <p class="mb-0">
                                    <i class="las la-calendar-check mr-2"></i>` + response[i].dateOfStarted + `
                                </p>
                            </td>
                            <td>
                                <div class="iq-media-group">
                                    <a href="#" class="iq-media">
                                        <img
                                            class="img-fluid avatar-40 rounded-circle"
                                            src="<%=request.getContextPath()%>/assets/uploads/project-logo/` + response[i].logo + `"
                                            alt=""
                                            />
                                    </a>
                                </div>
                            </td>
                            <td>
                                <a href="#" class="btn bg-secondary-light">` + response[i].developmentName + `</a>
                            </td>
                        </tr>
                `;
            }
            $('#listHtml').html(listHtml);
        });

    };
</script>

