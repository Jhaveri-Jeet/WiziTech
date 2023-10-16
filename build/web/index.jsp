<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${empty sessionScope.userId}">
    <c:redirect url="pages/username.jsp" />
</c:if>

<c:if test="${userName ne 'Owner'}">
    <c:redirect url="/pages/page-project.jsp" />
</c:if>

<%@ include file = "includes/styles.jsp" %>
<%@ include file = "includes/navbar.jsp" %>
<%@ include file = "includes/header.jsp" %>

<!-- All total sales, projects-done, revenue and cost information should be displayed -->
<div class="content-page">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 col-lg-3">
                <div class="card card-block card-stretch card-height">
                    <div class="card-body">
                        <div
                            class="top-block d-flex align-items-center justify-content-between"
                            >
                            <h5>Sales</h5>
                            <span class="badge badge-primary">Monthly</span>
                        </div>
                        <h3>&#8377;<span class="counter" id="monthlySales"></span></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="card card-block card-stretch card-height">
                    <div class="card-body">
                        <div
                            class="top-block d-flex align-items-center justify-content-between"
                            >
                            <h5>Revenue</h5>
                            <span class="badge badge-warning">Monthly</span>
                        </div>
                        <h3>&#8377;<span class="counter" id="totalRevenue"></span></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="card card-block card-stretch card-height">
                    <div class="card-body">
                        <div
                            class="top-block d-flex align-items-center justify-content-between"
                            >
                            <h5>Cost</h5>
                            <span class="badge badge-success">Monthly</span>
                        </div>
                        <h3>&#8377;<span class="counter" id="totalExpense"></span></h3>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="card card-block card-stretch card-height">
                    <div class="card-body">
                        <div
                            class="top-block d-flex align-items-center justify-content-between"
                            >
                            <h5>Project Done</h5>
                            <span class="badge badge-info">Overall</span>
                        </div>
                        <h3>&#8377;<span class="counter" id="totalProjectCompletedAmount"></span></h3>
                    </div>
                </div>
            </div>

            <!-- This will show the Development on which we are doing the work most  [Websites, Software, Application] -->
            <div class="col-xl-8">
                <div class="card-transparent card-block card-stretch card-height">
                    <div class="card-body p-0">
                        <div class="card">
                            <div class="card-header d-flex justify-content-between">
                                <div class="header-title">
                                    <h4 class="card-title">Overview Progress</h4>
                                </div>
                            </div>
                            <div class="card-body">
                                <ul class="list-inline p-0 mb-0" id="projectAvgUsage">
                                </ul>
                            </div>
                        </div>

                        <!-- This will show the current tasks which been on working -->
                        <div class="row" id="dashboardTask">
                            <div class="col-lg-12" >
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row" >
                                            <div class="col-sm-8">
                                                <div class="row align-items-center">
                                                    <div class="col-md-9">
                                                        <div class="mt-3 mt-md-0">
                                                            <h5 class="mb-1">Cloud Service Theme</h5>
                                                            <p class="mb-0">
                                                                Exclusively for cloud-based/ Startup
                                                                theme.
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 text-sm-right mt-3 mt-sm-0">
                                                <div class="iq-media-group">
                                                    <a href="#" class="iq-media">
                                                        <img
                                                            class="img-fluid avatar-40 rounded-circle"
                                                            src="./assets/images/user/05.jpg"
                                                            alt=""
                                                            />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <div class="row align-items-center">
                                                    <div class="col-md-3">
                                                        <div
                                                            id="circle-progress-22"
                                                            class="circle-progress-01 circle-progress circle-progress-secondary"
                                                            data-min-value="0"
                                                            data-max-value="100"
                                                            data-value="30"
                                                            data-type="percent"
                                                            ></div>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <div class="mt-3 mt-md-0">
                                                            <h5 class="mb-1">Automotive WordPress</h5>
                                                            <p class="mb-0">
                                                                Dealership-based business WordPress theme.
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 text-sm-right mt-3 mt-sm-0">
                                                <div class="iq-media-group">
                                                    <a href="#" class="iq-media">
                                                        <img
                                                            class="img-fluid avatar-40 rounded-circle"
                                                            src="./assets/images/user/07.jpg"
                                                            alt=""
                                                            />
                                                    </a>
                                                    <a href="#" class="iq-media">
                                                        <img
                                                            class="img-fluid avatar-40 rounded-circle"
                                                            src="./assets/images/user/02.jpg"
                                                            alt=""
                                                            />
                                                    </a>
                                                    <a href="#" class="iq-media">
                                                        <img
                                                            class="img-fluid avatar-40 rounded-circle"
                                                            src="./assets/images/user/04.jpg"
                                                            alt=""
                                                            />
                                                    </a>
                                                    <a href="#" class="iq-media">
                                                        <img
                                                            class="img-fluid avatar-40 rounded-circle"
                                                            src="./assets/images/user/08.jpg"
                                                            alt=""
                                                            />
                                                    </a>
                                                </div>
                                                <a
                                                    class="btn btn-white text-secondary link-shadow mt-2"
                                                    >Medium</a
                                                >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <div class="row align-items-center">
                                                    <div class="col-md-3">
                                                        <div
                                                            id="circle-progress-23"
                                                            class="circle-progress-01 circle-progress circle-progress-warning"
                                                            data-min-value="0"
                                                            data-max-value="100"
                                                            data-value="15"
                                                            data-type="percent"
                                                            ></div>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <div class="mt-3 mt-md-0">
                                                            <h5 class="mb-1">Online Education</h5>
                                                            <p class="mb-0">
                                                                Remote students and teachers dashboard.
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 text-sm-right mt-3 mt-sm-0">
                                                <div class="iq-media-group">
                                                    <a href="#" class="iq-media">
                                                        <img
                                                            class="img-fluid avatar-40 rounded-circle"
                                                            src="./assets/images/user/01.jpg"
                                                            alt=""
                                                            />
                                                    </a>
                                                    <a href="#" class="iq-media">
                                                        <img
                                                            class="img-fluid avatar-40 rounded-circle"
                                                            src="./assets/images/user/02.jpg"
                                                            alt=""
                                                            />
                                                    </a>
                                                    <a href="#" class="iq-media">
                                                        <img
                                                            class="img-fluid avatar-40 rounded-circle"
                                                            src="./assets/images/user/03.jpg"
                                                            alt=""
                                                            />
                                                    </a>
                                                </div>
                                                <a
                                                    class="btn btn-white text-warning link-shadow mt-2"
                                                    >Low</a
                                                >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="card mb-0">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <div class="row align-items-center">
                                                    <div class="col-md-3">
                                                        <div
                                                            id="circle-progress-24"
                                                            class="circle-progress-01 circle-progress circle-progress-success"
                                                            data-min-value="0"
                                                            data-max-value="100"
                                                            data-value="40"
                                                            data-type="percent"
                                                            ></div>
                                                    </div>
                                                    <div class="col-md-9">
                                                        <div class="mt-3 mt-md-0">
                                                            <h5 class="mb-1">Blog/Magazine Theme</h5>
                                                            <p class="mb-0">
                                                                Launch visually appealing Blog theme.
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 text-sm-right mt-3 mt-sm-0">
                                                <div class="iq-media-group">
                                                    <a href="#" class="iq-media">
                                                        <img
                                                            class="img-fluid avatar-40 rounded-circle"
                                                            src="./assets/images/user/05.jpg"
                                                            alt=""
                                                            />
                                                    </a>
                                                    <a href="#" class="iq-media">
                                                        <img
                                                            class="img-fluid avatar-40 rounded-circle"
                                                            src="./assets/images/user/06.jpg"
                                                            alt=""
                                                            />
                                                    </a>
                                                    <a href="#" class="iq-media">
                                                        <img
                                                            class="img-fluid avatar-40 rounded-circle"
                                                            src="./assets/images/user/07.jpg"
                                                            alt=""
                                                            />
                                                    </a>
                                                </div>
                                                <a
                                                    class="btn btn-white text-success link-shadow mt-2"
                                                    >High</a
                                                >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Only Active Projects -->
            <div class="col-xl-4">
                <div class="card card-block card-stretch card-height">
                    <div class="card-body">
                        <div class="card border-bottom pb-2 shadow-none">
                            <div class="card-body text-center inln-date flet-datepickr">
                                <input
                                    type="text"
                                    id="inline-date"
                                    class="date-input basicFlatpickr d-none"
                                    readonly="readonly"
                                    />
                            </div>
                        </div>
                        <div class="card card-list">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <svg
                                        class="svg-icon text-secondary mr-3"
                                        width="24"
                                        height="24"
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        >
                                    <path
                                        d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"
                                        ></path>
                                    </svg>
                                    <div class="pl-3 border-left">
                                        <h5 class="mb-1">Direct Development</h5>
                                        <p class="mb-0">Unveling the design system</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-list">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <svg
                                        class="svg-icon text-primary mr-3"
                                        width="24"
                                        height="24"
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        >
                                    <polyline
                                        points="22 12 16 12 14 15 10 15 8 12 2 12"
                                        ></polyline>
                                    <path
                                        d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z"
                                        ></path>
                                    </svg>
                                    <div class="pl-3 border-left">
                                        <h5 class="mb-1">action point assigned</h5>
                                        <p class="mb-0">Unveling the design system</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-list">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <svg
                                        class="svg-icon text-warning mr-3"
                                        width="24"
                                        height="24"
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        >
                                    <path
                                        d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"
                                        ></path>
                                    <polyline points="22,6 12,13 2,6"></polyline>
                                    </svg>
                                    <div class="pl-3 border-left">
                                        <h5 class="mb-1">Private Notes</h5>
                                        <p class="mb-0">Unveling the design system</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card card-list mb-0">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <svg
                                        class="svg-icon text-success mr-3"
                                        width="24"
                                        height="24"
                                        xmlns="http://www.w3.org/2000/svg"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        >
                                    <path
                                        d="M15.05 5A5 5 0 0 1 19 8.95M15.05 1A9 9 0 0 1 23 8.94m-1 7.98v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"
                                        ></path>
                                    </svg>
                                    <div class="pl-3 border-left">
                                        <h5 class="mb-1">Support Request</h5>
                                        <p class="mb-0">Unveling the design system</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- This will show all the projects -->
            <div class="col-lg-12">
                <div class="card-transparent mb-0">
                    <div
                        class="card-header d-flex align-items-center justify-content-between p-0 pb-3"
                        >
                        <div class="header-title">
                            <h4 class="card-title">Projects</h4>
                        </div>
                        <div class="card-header-toolbar d-flex align-items-center">
                            <div
                                id="top-project-slick-arrow"
                                class="slick-aerrow-block"
                                ></div>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <ul class="list-unstyled row top-projects mb-0" id="allProject">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page end  -->
    </div>
</div>
</div>
<!-- Wrapper End-->

<%@ include file = "includes/footer.jsp" %>
<%@ include file = "includes/scripts.jsp" %>

<script>
    $(init);

    function init() {
        TotalSalesOfMonth();
        FetchTotalRevenue();
        FetchTotalExpense();
        FetchTotalProjectCompletedAmount();
        FetchProjectAvgUsage();
        FetchProjectDetails();
        FetchDashboardTask();
    }

    async function TotalSalesOfMonth() {
        var response = await $.post("./FetchCurrentMonthSales");
        $("#monthlySales").html(response);
    }

    async function FetchTotalRevenue() {
        var response = await $.post("./FetchTotalRevenue");
        $("#totalRevenue").html(response);
    }

    async function FetchTotalExpense() {
        var response = await $.post("./FetchTotalExpense");
        $("#totalExpense").html(response);
    }

    async function FetchTotalProjectCompletedAmount() {
        var response = await $.post("./FetchTotalProjectCompletedAmount");
        $("#totalProjectCompletedAmount").html(response);
    }

    async function FetchProjectAvgUsage() {
        var response = await $.post("./FetchProjectAvgUsage");
        $("#projectAvgUsage").html(response);
    }

    function FetchProjectDetails() {
        $.post("./FetchProjectDetails", function (response) {
            let data = '';
            for (let i = 0; i < response.length; i++) {
                data += `
                    <li class="col-lg-4">
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
                    </li>
                    `;
            }
            $("#allProject").html(data);
        });

    }

    function FetchDashboardTask() {
        $.post("./FetchDashboardTask", function (response) {
            let data = '';
            for (let i = 0; i < response.length; i++) {
                data += `
                    <div class="col-lg-12" >
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row" >
                                            <div class="col-sm-8">
                                                <div class="row align-items-center">
                                                    <div class="col-md-9">
                                                        <div class="mt-3 mt-md-0">
                                                            <h5 class="mb-1">` + response[i].task + `</h5>
                                                            <p class="mb-0">
                                                                ` + response[i].description + `
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 text-sm-right mt-3 mt-sm-0">
                                                <a
                                                    class="btn btn-white text-success link-shadow mt-2"
                                                    >` + response[i].status + `</a
                                                >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                `;
            }
            $("#dashboardTask").html(data);
        });
    }

</script>
