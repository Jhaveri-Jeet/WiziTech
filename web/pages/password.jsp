<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${empty sessionScope.userId}">
    <c:redirect url="pages/username.jsp" />
</c:if>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <title>WiziTech | P M S</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico" />
        <link rel="stylesheet" href="../assets/css/backend-plugin.min.css" />
        <link rel="stylesheet" href="../assets/css/backend.css?v=1.0.0" />
        <link
            rel="stylesheet"
            href="../assets/vendor/line-awesome/dist/line-awesome/css/line-awesome.min.css"
            />
        <link
            rel="stylesheet"
            href="../assets/vendor/remixicon/fonts/remixicon.css"
            />

        <link
            rel="stylesheet"
            href="../assets/vendor/tui-calendar/tui-calendar/dist/tui-calendar.css"
            />
        <link
            rel="stylesheet"
            href="../assets/vendor/tui-calendar/tui-date-picker/dist/tui-date-picker.css"
            />
        <link
            rel="stylesheet"
            href="../assets/vendor/tui-calendar/tui-time-picker/dist/tui-time-picker.css"
            />
    </head>
    <body class=" ">
        <!-- loader Start -->
        <div id="loading">
            <div id="loading-center"></div>
        </div>
        <!-- loader END -->

        <div class="wrapper">
            <section class="login-content">
                <div class="container">
                    <div
                        class="row align-items-center justify-content-center height-self-center"
                        >
                        <div class="col-lg-8">
                            <div class="card auth-card">
                                <div class="card-body p-0">
                                    <div class="d-flex align-items-center auth-content">
                                        <div class="col-lg-6 bg-primary content-left">
                                            <div class="p-3">
                                                <img
                                                    src="../assets/images/user/1.png"
                                                    class="rounded avatar-80 mb-3"
                                                    alt=""
                                                    />
                                                <h2 class="mb-2 text-white">Hi ! <%= session.getAttribute("userName")%></h2>
                                                <p>Enter your password to access the PMS.</p>
                                                <form>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="floating-label form-group">
                                                                <input
                                                                    class="floating-input form-control"
                                                                    type="password"
                                                                    placeholder=" "
                                                                    id="password"
                                                                    />
                                                                <label>Password</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input type="button" class="btn btn-white" onclick="CheckPassword()" value="Login">
                                                </form>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 content-right">
                                            <img
                                                src="../assets/images/login/01.png"
                                                class="img-fluid image-right"
                                                alt=""
                                                />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <!-- Backend Bundle JavaScript -->
        <script src="../assets/js/backend-bundle.min.js"></script>

        <!-- Table Treeview JavaScript -->
        <script src="../assets/js/table-treeview.js"></script>

        <!-- Chart Custom JavaScript -->
        <script src="../assets/js/customizer.js"></script>

        <!-- Chart Custom JavaScript -->
        <script async src="../assets/js/chart-custom.js"></script>
        <!-- Chart Custom JavaScript -->
        <script async src="../assets/js/slider.js"></script>

        <!-- app JavaScript -->
        <script src="../assets/js/app.js"></script>

        <script src="../assets/vendor/moment.min.js"></script>

        <script>
            function CheckPassword() {
                let password = $('#password').val().trim();

                $.post('../CheckPassword', {password: password}, function (response) {
                    if(response !== 'false' )
                        window.location = "../index.jsp";
                    else
                        window.location = "./password.jsp";
                });
            }
        </script>
    </body>
</html>
