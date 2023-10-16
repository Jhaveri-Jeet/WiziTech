<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${empty sessionScope.userId}">
    <c:redirect url="./username.jsp" />
</c:if>

<%@ include file = "../includes/styles.jsp" %>
<%@ include file = "../includes/navbar.jsp" %>
<%@ include file = "../includes/header.jsp" %>

<c:forEach items="${projectDetails}" var="project">
    <c:forEach items="${clientDetails}" var="client">
        <div class="content-page">
            <div class="container-fluid">
                <div class="row m-sm-0 px-5" >            
                    <div class="col-lg-4 card-profile" style="margin-top: 5%">
                        <div class="card card-block card-stretch card-height">
                            <div class="card-body">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="profile-img position-relative">
                                        <img src="<%=request.getContextPath()%>/assets/uploads/project-logo/${project.logo}" class="img-fluid rounded avatar-110" alt="profile-image">
                                    </div>
                                    <div class="ml-3">
                                        <h4 class="mb-1">${client.clientName}</h4>
                                        <p class="mb-2 text-${project.status == "Pending" ? 'secondary' : (project.status == "Working" ? 'warning' : 'success')}">${project.status}</p>
                                        <a href="#" class="btn btn-primary font-size-14">Contact</a>
                                    </div>
                                </div>
                                <p>
                                    ${project.projectTitle}
                                </p>
                                <ul class="list-inline p-0 m-0">
                                    <li class="mb-2">
                                        <div class="d-flex align-items-center">
                                            <svg class="svg-icon mr-3" height="16" width="16" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                                            </svg>
                                            <p class="mb-0">${client.clientState}, ${client.clientCountry}</p>   
                                        </div>
                                    </li>
                                    <li class="mb-2">
                                        <div class="d-flex align-items-center">
                                            <svg class="svg-icon mr-3" height="16" width="16" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                                            </svg>
                                            <p class="mb-0">${project.developmentName}</p>   
                                        </div>
                                    </li>
                                    <li class="mb-2">
                                        <div class="d-flex align-items-center">
                                            <svg class="svg-icon mr-3" height="16" width="16" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 15.546c-.523 0-1.046.151-1.5.454a2.704 2.704 0 01-3 0 2.704 2.704 0 00-3 0 2.704 2.704 0 01-3 0 2.704 2.704 0 00-3 0 2.704 2.704 0 01-3 0 2.701 2.701 0 00-1.5-.454M9 6v2m3-2v2m3-2v2M9 3h.01M12 3h.01M15 3h.01M21 21v-7a2 2 0 00-2-2H5a2 2 0 00-2 2v7h18zm-3-9v-2a2 2 0 00-2-2H8a2 2 0 00-2 2v2h12z" />
                                            </svg>
                                            <p class="mb-0">${project.dateOfTaken}</p>   
                                        </div>
                                    </li>
                                    <li class="mb-2">
                                        <div class="d-flex align-items-center">
                                            <svg class="svg-icon mr-3" height="16" width="16" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                                            </svg>
                                            <p class="mb-0">${client.clientNumber}</p>   
                                        </div>
                                    </li>
                                    <li>
                                        <div class="d-flex align-items-center">
                                            <svg class="svg-icon mr-3" height="16" width="16" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                                            </svg>
                                            <p class="mb-0"><a target="_blank" href="${project.url}">${project.projectTitle}</a></p>   
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 card-profile" style="margin-top: 5%">
                        <div class="card card-block card-stretch card-height">
                            <div class="card-body">
                                <ul class="d-flex nav nav-pills mb-3 text-center profile-tab" id="profile-pills-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active show" data-toggle="pill" href="#profile1" role="tab" aria-selected="false">Details</a>
                                    </li>
                                    <li class="nav-item">
                                        <a id="view-btn" class="nav-link" data-toggle="pill" href="#profile5" role="tab" aria-selected="true">Requirements</a>
                                    </li>
                                </ul>
                                <div class="profile-content tab-content">

                                    <div id="profile1" class="tab-pane fade active show">
                                        <p>${project.projectDescription}</p>
                                        <div class="row">
                                            <div class="col-xl-6 col-lg-12">
                                                <div class="mb-0">
                                                    <div class="card-header px-3">
                                                        <div class="header-title">
                                                            <h4 class="card-title">Information</h4>
                                                        </div>
                                                    </div>
                                                    <div class="card-body p-3">
                                                        <ul class="list-inline p-0 m-0">
                                                            <li class="mb-2 d-flex">
                                                                <span><i class="las la-calendar-plus font-size-20 mr-3"></i></span>
                                                                <p class="mb-0 line-height">${project.dateOfStarted}</p>
                                                            </li>
                                                            <li class="mb-2 d-flex">
                                                                <span><i class="las la-calendar-check font-size-20 mr-3"></i></span>
                                                                <p class="mb-0 line-height">${project.status}</p>
                                                            </li>
                                                            <li class="mb-2 d-flex">
                                                                <span><i class="las la-wallet icon-text-danger font-size-20 mr-3"></i></span>
                                                                <p class="mb-0 line-height">${project.amount}</p>
                                                            </li>
                                                            <li class="mb-2 d-flex">
                                                                <span><i class="las la-file-invoice-dollar icon-text-danger font-size-20 mr-3"></i></span>
                                                                <p class="mb-0 line-height">${project.amountStatus}</p>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-6 col-lg-12">
                                                <div class="mb-0">
                                                    <div class="card-header px-3">
                                                        <div class="header-title">
                                                            <h4 class="card-title">Technologies Used</h4>
                                                        </div>
                                                    </div>
                                                    <div class="card-body p-3">
                                                        <ul class="list-inline p-0 m-0">
                                                            <li class="mb-2 d-flex">
                                                                <span><i class="las la-desktop font-size-20 mr-3"></i></span>
                                                                <p class="mb-0 line-height">${project.frontendTechnology}</p>
                                                            </li>
                                                            <li class="mb-2 d-flex">
                                                                <span><i class="las la-laptop-code font-size-20 mr-3"></i></span>
                                                                <p class="mb-0 line-height">${project.backendTechnology}</p>
                                                            </li>
                                                            <li class="mb-2 d-flex">
                                                                <span><i class="las la-database font-size-20 mr-3"></i></span>
                                                                <p class="mb-0 line-height">${project.databaseName}</p>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="profile5" class="tab-pane fade">
                                        <p>${project.projectRequirements}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</c:forEach>
<!-- Wrapper End-->

<%@ include file = "../includes/footer.jsp" %>
<%@ include file = "../includes/scripts.jsp" %>