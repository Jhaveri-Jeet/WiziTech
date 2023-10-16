<!-- Header Page - This page will contain the header of the PMS -->
<div class="iq-top-navbar">
    <div class="iq-navbar-custom">
        <nav class="navbar navbar-expand-lg navbar-light p-0">
            <div
                class="iq-navbar-logo d-flex align-items-center justify-content-between"
                >
                <i class="ri-menu-line wrapper-menu"></i>
                <a href="<%=request.getContextPath()%>/index.jsp" class="header-logo">
                    <h4 class="logo-title text-uppercase">WiziTech</h4>
                </a>
            </div>
            <div class="navbar-breadcrumb">
                <h5>Project Management System</h5>
            </div>
            <div class="d-flex align-items-center">
                <button
                    class="navbar-toggler"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-label="Toggle navigation"
                    >
                    <i class="ri-menu-3-line"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-list align-items-center">
                        <!-- Notifications -->
                        <li class="nav-item nav-icon nav-item-icon dropdown">
                            <c:if test="${userName != 'Owner'}">
                                <a
                                    href="#"
                                    class="search-toggle dropdown-toggle"
                                    id="dropdownMenuButton"
                                    data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    >    
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="20"
                                        height="20"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        onclick="NotificationDisplay()"
                                        class="feather feather-bell"
                                        >
                                        <path
                                            d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"
                                            ></path>
                                        <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                                    </svg>
                                    <span class="bg-primary"></span>
                                    <span class="badge rounded-pill position-absolute bg-primary" style="top: 10px !important; right:10px !important" id="notificationCount" onclick="NotificationDisplay()">0</span>
                                </a>
                            </c:if>
                            <div
                                class="iq-sub-dropdown dropdown-menu"
                                aria-labelledby="dropdownMenuButton"
                                >
                                <div class="card shadow-none m-0">
                                    <div class="card-body p-0">
                                        <div class="cust-title p-3">
                                            <div
                                                class="d-flex align-items-center justify-content-between"
                                                >
                                                <h5 class="mb-0">Notifications</h5>
                                                <a class="badge badge-primary badge-card" href="#"
                                                   ></a
                                                >
                                            </div>
                                        </div>
                                        <div class="px-3 pt-0 pb-0 sub-card" id="taskNotificationDetails">
                                        </div>
                                        <a
                                            class="right-ic btn btn-primary btn-block position-relative p-2"
                                            href="#"
                                            role="button"
                                            onclick="updateNotificationSeenStatus()"
                                            >
                                            Clear All
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item nav-icon dropdown caption-content">
                            <a
                                href="#"
                                class="search-toggle dropdown-toggle d-flex align-items-center"
                                id="dropdownMenuButton4"
                                data-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                                >
                                <img
                                    id="profileImage"
                                    src="<%=request.getContextPath()%>/assets/uploads/project-logo/owner.jpg"
                                    class="img-fluid rounded-circle"
                                    alt="user"
                                    style="object-fit: cover"
                                    />
                                <div class="caption ml-3">
                                    <h6 class="mb-0 line-height">
                                        <%= session.getAttribute("userName")%><i class="las la-angle-down ml-2"></i>
                                    </h6>
                                </div>
                            </a>
                            <ul
                                class="dropdown-menu dropdown-menu-right border-none"
                                aria-labelledby="dropdownMenuButton"
                                >
                                <c:if test="${userName != 'Owner'}">
                                    <li class="dropdown-item d-flex svg-icon">
                                        <svg
                                            class="svg-icon mr-0 text-primary"
                                            id="h-01-p"
                                            width="20"
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                            >
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zm6 2a9 9 0 11-18 0 9 9 0 0118 0z"
                                                />
                                        </svg>
                                        <a href="<%=request.getContextPath()%>/pages/user-profile.jsp">My Profile</a>
                                    </li>
                                    <li class="dropdown-item d-flex svg-icon">
                                        <svg
                                            class="svg-icon mr-0 text-primary"
                                            id="h-02-p"
                                            width="20"
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke="currentColor"
                                            >
                                            <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                stroke-width="2"
                                                d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"
                                                />
                                        </svg>
                                        <a href="<%=request.getContextPath()%>/pages/user-profile-edit.jsp"
                                           >Edit Profile</a
                                        >
                                    </li>
                                </c:if>
                                <li class="dropdown-item d-flex svg-icon border-top">
                                    <svg
                                        class="svg-icon mr-0 text-primary"
                                        id="h-05-p"
                                        width="20"
                                        xmlns="http://www.w3.org/2000/svg"
                                        fill="none"
                                        viewBox="0 0 24 24"
                                        stroke="currentColor"
                                        >
                                        <path
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            stroke-width="2"
                                            d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"
                                            />
                                    </svg>
                                    <a href="#" onclick="logout()">Logout</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script>

                                        $(init);

                                        function init() {
                                            <c:if test="${userName != 'Owner'}">
                                                NotificationCount();
                                                fetchProfilePhoto();
                                            </c:if>
                                            NotificationDisplay();
                                            autoLogOut();
                                        }

                                        function logout() {
                                            $.post('<%=request.getContextPath()%>/Logout', function (response) {
                                                window.location = "<%=request.getContextPath()%>/pages/username.jsp";
                                            });
                                        }

                                        function NotificationCount() {
                                            autoLogOut();
                                            setInterval(function () {
                                                $.post('<%=request.getContextPath()%>/NotificationCount', function (response) {
                                                    $('#notificationCount').text(response[0]['id']);
                                                });
                                            }, 1000);
                                        }

                                        function NotificationDisplay() {
                                            $.post('<%=request.getContextPath()%>/NotificationDisplay', function (response) {
                                                let notificationDetails = ``;
                                                for (let i = 0; i < response.length; i++) {
                                                    notificationDetails += `
                                                        <a href="#" class="iq-sub-card">
                                                            <div class="media align-items-center cust-card py-3 border-bottom">
                                                                <div class="">
                                                                    <img class="avatar-50 rounded-small" src="<%=request.getContextPath()%>/assets/uploads/project-logo/` + response[i].developerName + `" alt="01" />
                                                                </div>
                                                                <div class="media-body ml-3">
                                                                    <div class="d-flex align-items-center justify-content-between">
                                                                        <h6 class="mb-0">` + response[i].projectName + `</h6>
                                                                    </div>
                                                                    <small class="mb-0">` + response[i].task + `</small>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    `;
                                                }
                                                $('#taskNotificationDetails').html(notificationDetails);
                                            });

                                        }

                                        function updateNotificationSeenStatus() {
                                            $.post('<%=request.getContextPath()%>/UpdateNotificationSeenStatus', function (response) {
                                                console.log(response);
                                            });
                                            window.location.reload();
                                        }

                                        function fetchProfilePhoto() {
                                            let id = ${sessionScope.userId};
                                            $.post('<%=request.getContextPath()%>/FetchProfilePhoto', data = {id: id}, function (response) {
                                                let profileImage = response === '' ? "owner.jpg" : response;
                                                $("#profileImage").attr("src", "<%=request.getContextPath()%>/assets/uploads/developer-profile-photo/" + profileImage);
                                            });
                                        }
                                        function autoLogOut() {
                                            if (window.closed)
                                                logout();
                                        }
</script>