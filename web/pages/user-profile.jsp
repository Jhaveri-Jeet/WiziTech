<%@ include file = "../includes/styles.jsp" %>
<%@ include file = "../includes/navbar.jsp" %>
<%@ include file = "../includes/header.jsp" %>

<div class="content-page">
    <div class="container-fluid">
        <div class="row m-sm-0 p-5">            
            <div class="col-lg-4 card-profile" style="margin-top: 5%">
                <div class="card card-block card-stretch card-height">
                    <div class="card-body">
                        <div class="d-flex align-items-center mb-3">
                            <div class="profile-img position-relative">
                                <img id="profilePhoto" class="img-fluid rounded avatar-110" alt="profile-image" style="object-fit: cover !important;box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;">
                            </div>
                            <div class="ml-3">
                                <h4 class="mb-1" id="developerName"></h4>
                                <p class="mb-2 text-success" id="status"></p>
                                <a href="" class="btn btn-primary font-size-14" id="contact">Contact</a>
                            </div>
                        </div>
                        <p id="caption"></p>
                        <ul class="list-inline p-0 m-0">
                            <li class="mb-2">
                                <div class="d-flex align-items-center">
                                    <svg class="svg-icon mr-3" height="16" width="16" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                                    </svg>
                                    <p class="mb-0" id="address"></p>   
                                </div>
                            </li>
                            <li class="mb-2">
                                <div class="d-flex align-items-center">
                                    <svg class="svg-icon mr-3" height="16" width="16" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 15.546c-.523 0-1.046.151-1.5.454a2.704 2.704 0 01-3 0 2.704 2.704 0 00-3 0 2.704 2.704 0 01-3 0 2.704 2.704 0 00-3 0 2.704 2.704 0 01-3 0 2.701 2.701 0 00-1.5-.454M9 6v2m3-2v2m3-2v2M9 3h.01M12 3h.01M15 3h.01M21 21v-7a2 2 0 00-2-2H5a2 2 0 00-2 2v7h18zm-3-9v-2a2 2 0 00-2-2H8a2 2 0 00-2 2v2h12z" />
                                    </svg>
                                    <p class="mb-0" id="birthDate"></p>   
                                </div>
                            </li>
                            <li class="mb-2">
                                <div class="d-flex align-items-center">
                                    <svg class="svg-icon mr-3" height="16" width="16" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                                    </svg>
                                    <p class="mb-0" id="number"></p>   
                                </div>
                            </li>
                            <li>
                                <div class="d-flex align-items-center">
                                    <svg class="svg-icon mr-3" height="16" width="16" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                                    </svg>
                                    <p class="mb-0" id="mail"></p>   
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
                                <a class="nav-link active show" data-toggle="pill" href="#profile1" role="tab" aria-selected="false">Personal Information</a>
                            </li>
                        </ul>
                        <div class="profile-content tab-content">

                            <div id="profile1" class="tab-pane fade active show">
                                <p id="about"></p>
                                <div class="row">
                                    <div class="col-xl-6 col-lg-12">
                                        <div class="mb-0">
                                            <div class="card-header px-3">
                                                <div class="header-title">
                                                    <h4 class="card-title">Social</h4>
                                                </div>
                                            </div>
                                            <div class="card-body p-3">
                                                <ul class="list-inline p-0 m-0">
                                                    <li class="mb-2 d-flex">
                                                        <span><i class="lab la-facebook-f icon-text-primary font-size-20 mr-3"></i></span>
                                                        <a class="mb-0 line-height" id="facebook" style="color: black" target="_blank">@<%= session.getAttribute("userName")%></a>
                                                    </li>
                                                    <li class="mb-2 d-flex">
                                                        <span><i class="lab la-twitter icon-text-info font-size-20 mr-3"></i></span>
                                                        <a class="mb-0 line-height" id="twitter" style="color: black" target="_blank">@<%= session.getAttribute("userName")%></a>
                                                    </li>
                                                    <li class="mb-2 d-flex">
                                                        <span><i class="lab la-instagram  icon-text-danger font-size-20 mr-3"></i></span>
                                                        <a class="mb-0 line-height" id="instagram" style="color: black" target="_blank">@<%= session.getAttribute("userName")%></a>
                                                    </li>
                                                    <li class="d-flex">
                                                        <span><i class="lab la-github  icon-text-danger font-size-20 mr-3"></i></span>
                                                        <a class="mb-0 line-height" id="github" style="color: black" target="_blank">@<%= session.getAttribute("userName")%></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-12">
                                        <div class="mb-0">
                                            <div class="card-header px-3">
                                                <div class="header-title">
                                                    <h4 class="card-title">Other Details</h4>
                                                </div>
                                            </div>
                                            <div class="card-body p-3">
                                                <ul class="list-inline p-0 m-0">
                                                    <li class="mb-3 d-flex">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="7" r="5"/><path stroke-linecap="round" stroke-linejoin="round" d="M17 14h.352a3 3 0 0 1 2.976 2.628l.391 3.124A2 2 0 0 1 18.734 22H5.266a2 2 0 0 1-1.985-2.248l.39-3.124A3 3 0 0 1 6.649 14H7"/></g></svg>
                                                        <p class="mb-0 ml-3 line-height" id="role"></p>
                                                    </li>
                                                    <li class="mb-3 d-flex">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"><path fill="currentColor" d="M22 2.25h-3.25V.75a.75.75 0 0 0-1.5-.001V2.25h-4.5V.75a.75.75 0 0 0-1.5-.001V2.25h-4.5V.75a.75.75 0 0 0-1.5-.001V2.25H2a2 2 0 0 0-2 1.999v17.75a2 2 0 0 0 2 2h20a2 2 0 0 0 2-2V4.249a2 2 0 0 0-2-1.999zM22.5 22a.5.5 0 0 1-.499.5H2a.5.5 0 0 1-.5-.5V4.25a.5.5 0 0 1 .5-.499h3.25v1.5a.75.75 0 0 0 1.5.001V3.751h4.5v1.5a.75.75 0 0 0 1.5.001V3.751h4.5v1.5a.75.75 0 0 0 1.5.001V3.751H22a.5.5 0 0 1 .499.499z"/><path fill="currentColor" d="M5.25 9h3v2.25h-3zm0 3.75h3V15h-3zm0 3.75h3v2.25h-3zm5.25 0h3v2.25h-3zm0-3.75h3V15h-3zm0-3.75h3v2.25h-3zm5.25 7.5h3v2.25h-3zm0-3.75h3V15h-3zm0-3.75h3v2.25h-3z"/></svg>
                                                        <p class="mb-0 ml-3 line-height" id="joinedDate"></p>
                                                    </li>
                                                </ul>
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
                $("#profilePhoto").attr("src", "<%=request.getContextPath()%>/assets/uploads/developer-profile-photo/" + response[i].profilePhoto);
                $('#caption').text(response[i].caption);
                $('#developerName').text(response[i].developerName);
                $('#number').text(response[i].number);
                $("#contact").attr("href", response[i].contact);
                $('#status').text(response[i].status);
                $('#address').text(response[i].state + ',' + response[i].country);
                $('#birthDate').text(response[i].birthDate);
                $('#mail').text(response[i].developerEmail);
                $('#about').text(response[i].about);
                $("#facebook").attr("href", response[i].facebook);
                $("#twitter").attr("href", response[i].twitter);
                $("#instagram").attr("href", response[i].instagram);
                $("#github").attr("href", response[i].github);
                $('#role').text(response[i].roleName);
                $('#joinedDate').text(response[i].dateOfJoining);

                let status = response[i].status;

                if (status === 'Offline') {
                    $('#status').removeClass('text-success');
                    $('#status').addClass('text-secondary');
                } else if (status === 'Working') {
                    $('#status').removeClass('text-success');
                    $('#status').addClass('text-warning');
                } else {
                    $('#status').addClass('text-success');
                }
            }
        });
    }
</script>

