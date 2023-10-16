<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
     String userName = (String) session.getAttribute("userName");
     pageContext.setAttribute("userName", userName);
%>

<!-- Wrapper Start -->
<!-- Navbar Page - This page will contain the code of the navbar  -->
<div class="wrapper">
    <div class="iq-sidebar sidebar-default">
        <div class="iq-sidebar-logo d-flex align-items-center">
            <a href="<%=request.getContextPath()%>" class="header-logo">
                <img src="<%=request.getContextPath()%>/assets/images/logo.svg" alt="logo" />
                <h3 class="logo-title light-logo">WiziTech</h3>
            </a>
            <div class="iq-menu-bt-sidebar ml-0">
                <i class="las la-bars wrapper-menu"></i>
            </div>
        </div>
        <div class="data-scrollbar" data-scroll="1">
            <nav class="iq-sidebar-menu">
                <ul id="iq-sidebar-toggle" class="iq-menu">
                    <c:if test="${userName eq 'Owner'}">
                        <li class="" id="dashboardlink">
                            <a href="<%=request.getContextPath()%>" class="svg-icon">
                                <svg
                                    class="svg-icon"
                                    width="25"
                                    height="25"
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-width="2"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    >
                                    <path
                                        d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"
                                        ></path>
                                    <polyline points="9 22 9 12 15 12 15 22"></polyline>
                                </svg>
                                <span class="ml-4">Dashboards</span>
                            </a>
                        </li>
                    </c:if>
                    <li class="">
                        <a href="<%=request.getContextPath()%>/pages/page-project.jsp" class="svg-icon" >
                            <svg
                                class="svg-icon"
                                width="25"
                                height="25"
                                xmlns="http://www.w3.org/2000/svg"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                >
                                <polyline points="6 9 6 2 18 2 18 9"></polyline>
                                <path
                                    d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"
                                    ></path>
                                <rect x="6" y="14" width="12" height="8"></rect>
                            </svg>
                            <span class="ml-4">Projects</span>
                        </a>
                    </li>
                    <c:if test="${userName eq 'Owner'}">
                        <li class="">
                            <a href="<%=request.getContextPath()%>/pages/page-client.jsp" class="svg-icon">
                                <svg
                                    class="svg-icon"
                                    width="25"
                                    height="25"
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    stroke-width="2"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    >
                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="12" cy="7" r="4"></circle>
                                </svg>
                                <span class="ml-4">Clients</span>
                            </a>
                        </li>
                    </c:if>
                    <li class="">
                        <a href="<%=request.getContextPath()%>/pages/page-task.jsp" class="svg-icon">
                            <svg
                                class="svg-icon"
                                width="25"
                                height="25"
                                xmlns="http://www.w3.org/2000/svg"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                >
                                <path
                                    d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"
                                    ></path>
                                <rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect>
                            </svg>
                            <span class="ml-4">Task</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="<%=request.getContextPath()%>/pages/page-employee.jsp" class="svg-icon">
                            <svg
                                class="svg-icon"
                                width="25"
                                height="25"
                                xmlns="http://www.w3.org/2000/svg"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                >
                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                <circle cx="12" cy="7" r="4"></circle>
                            </svg>
                            <span class="ml-4">Developers</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="<%=request.getContextPath()%>/pages/page-desk.jsp" class="svg-icon">
                            <svg
                                class="svg-icon"
                                width="25"
                                height="25"
                                xmlns="http://www.w3.org/2000/svg"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                >
                                <path
                                    d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"
                                    ></path>
                                <polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
                                <line x1="12" y1="22.08" x2="12" y2="12"></line>
                            </svg>
                            <span class="ml-4">Desk</span>
                        </a>
                    </li>
                    <c:if test="${userName eq 'Owner'}">
                        <li class="">
                            <a href="<%=request.getContextPath()%>/pages/page-expense.jsp" class="svg-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 256 256"><path fill="currentColor" d="M128 166a38 38 0 1 0-38-38a38 38 0 0 0 38 38Zm0-64a26 26 0 1 1-26 26a26 26 0 0 1 26-26Zm112-44H16a6 6 0 0 0-6 6v128a6 6 0 0 0 6 6h224a6 6 0 0 0 6-6V64a6 6 0 0 0-6-6ZM22 108.82A54.73 54.73 0 0 0 60.82 70h134.36A54.73 54.73 0 0 0 234 108.82v38.36A54.73 54.73 0 0 0 195.18 186H60.82A54.73 54.73 0 0 0 22 147.18Zm212-12.53A42.8 42.8 0 0 1 207.71 70H234ZM48.29 70A42.8 42.8 0 0 1 22 96.29V70ZM22 159.71A42.8 42.8 0 0 1 48.29 186H22ZM207.71 186A42.8 42.8 0 0 1 234 159.71V186Z"/></svg>
                                <span class="ml-4">Expenses</span>
                            </a>
                        </li>
                        <li class="">
                            <a href="<%=request.getContextPath()%>/pages/page-development.jsp" class="svg-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bar-chart-line" viewBox="0 0 16 16"> <path d="M11 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v12h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1v-3a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3h1V7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7h1V2zm1 12h2V2h-2v12zm-3 0V7H7v7h2zm-5 0v-3H2v3h2z"/> </svg> 
                                <span class="ml-4">Development</span>
                            </a>
                        </li>
                        <li class="">
                            <a href="<%=request.getContextPath()%>/pages/page-role.jsp" class="svg-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16"><path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/></svg>
                                <span class="ml-4">Roles</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
            <div class="pt-5 pb-2"></div>
        </div>
    </div>
