<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>WiziTech | P M S</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico" />
        <link rel="stylesheet" href="../assets/css/backend-plugin.min.css">
        <link rel="stylesheet" href="../assets/css/backend.css?v=1.0.0">
        <link rel="stylesheet" href="../assets/vendor/line-awesome/dist/line-awesome/css/line-awesome.min.css">
        <link rel="stylesheet" href="../assets/vendor/remixicon/fonts/remixicon.css">

        <link rel="stylesheet" href="../assets/vendor/tui-calendar/tui-calendar/dist/tui-calendar.css">
        <link rel="stylesheet" href="../assets/vendor/tui-calendar/tui-date-picker/dist/tui-date-picker.css">
        <link rel="stylesheet" href="../assets/vendor/tui-calendar/tui-time-picker/dist/tui-time-picker.css">  </head>
    <body class=" ">
        <!-- loader Start -->
        <div id="loading">
            <div id="loading-center">
            </div>
        </div>
        <!-- loader END -->

        <div class="wrapper">
            <section class="login-content">
                <div class="container">
                    <div class="row align-items-center justify-content-center height-self-center">
                        <div class="col-lg-8">
                            <div class="card auth-card">
                                <div class="card-body p-0">
                                    <div class="d-flex align-items-center auth-content">
                                        <div class="col-lg-6 bg-primary content-left">
                                            <div class="p-3">
                                                <h2 class="mb-2 text-white">Sign In</h2>
                                                <p>Login to stay connected.</p>
                                                <form>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="form-group mb-3">
                                                                <lable class="pl-1">Select Type</lable>
                                                                <select name="type" class="selectpicker form-control" data-style="py-0" id="typeSelect" onchange="StoreDeveloper()">
                                                                    <option>Developer</option>
                                                                    <option value="Owner">Owner</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-12">
                                                            <div class="form-group mb-3">
                                                                <lable class="pl-1" id="userlable">Select Your Name</lable>
                                                                <select name="type" class="form-control" data-style="py-0" id="usernames">
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input type="button" class="btn btn-white mt-5" value="Next" onclick="sendUsername()">
                                                </form>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 content-right">
                                            <img src="../assets/images/login/01.png" class="img-fluid image-right" alt="">
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
        
        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

        <script>
            $(init);
            
            function init(){
                StoreDeveloper();
            }
            function StoreDeveloper(){
                let type = $('#typeSelect option:selected').val();
                if(type === 'Owner'){
                    $('#usernames').hide();
                    $('#userlable').hide();
                } else {
                    $('#userlable').show();
                    $('#usernames').show();
                }
                
                $.post('../FetchNonActiveUsers', function(response){
                    let options = '';
                    for(let i = 0; i < response.length; i ++){
                        options += `
                            <option value="`+response[i].id+`">`+response[i].developerName+`</option>
                        `;
                    }
                    $('#usernames').html(options);
                });
                
            }
            
            function sendUsername(){
                let userId = $('#usernames option:selected').val();
                let userName = $('#usernames option:selected').text();
                let type = $('#typeSelect option:selected').val();
                
                if(type === 'Owner'){
                    $.post('../StoreDeveloper', {userId: 1, userName: "Owner"}, function(response){
                        window.location = "./password.jsp";
                    });
                } else {
                    $.post('../StoreDeveloper', {userId: userId, userName: userName}, function(response){
                        window.location = "./password.jsp";
                    });
                }
            }
        </script>
    </body>
</html>