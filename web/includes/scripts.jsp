
<!-- Scripts Page - Which contain all the scrpts of the project -->
<!-- Backend Bundle JavaScript -->
<script src="<%=request.getContextPath()%>/assets/js/backend-bundle.min.js"></script>

<!-- Table Treeview JavaScript -->
<script src="<%=request.getContextPath()%>/assets/js/table-treeview.js"></script>

<!-- Chart Custom JavaScript -->
<script src="<%=request.getContextPath()%>/assets/js/customizer.js"></script>

<!-- Chart Custom JavaScript -->
<script async src="<%=request.getContextPath()%>/assets/js/chart-custom.js"></script>
<!-- Chart Custom JavaScript -->
<script async src="<%=request.getContextPath()%>/assets/js/slider.js"></script>

<!-- app JavaScript -->
<script src="<%=request.getContextPath()%>/assets/js/app.js"></script>

<script src="<%=request.getContextPath()%>/assets/vendor/moment.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

<script>
    $(document).ready(function () {
        // Get the current URL
        var currentURL = window.location.href;

        // Get all the navbar links
        var navLinks = document.querySelectorAll('.iq-sidebar-menu a');

        $('#dashboardlink').addClass('active');

        // Loop through each navbar link
        for (var i = 0; i < navLinks.length; i++) {
            var link = navLinks[i];
            // Check if the link's href matches the current URL
            if (link.href === currentURL) {
                $('#dashboardlink').removeClass('active');
                // Add the "active" class to the link's parent li element
                link.parentNode.classList.add('active');
            }
        }

        if (window.closed === true) {
            $.ajax({
                type: "POST",
                url: '<%=request.getContextPath()%>/Logout',
                async: false,
                success: function (response) {
                    console.log(response);
                }
            });
        }
    });
</script>
</body>
</html>