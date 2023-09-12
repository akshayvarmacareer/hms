<!DOCTYPE html>
<html lang="en" dir="">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ESL</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="assets/styles/css/themes/lite-purple.min.css">
	<style>
	.divLogin {
	margin: auto;
	width: 50%;
	padding: 10px;
}
	</style>
</head>
<body class="text-left">
    <div class="auth-layout-wrap" style="background-image: url(./assets/images/ESL_all_types.jpg)">
        <div class="auth-content form-control-rounded">
           
                <div class="row">
                  
                    <div class="col-md-8 text-center divLogin" style="background-size: cover;background-image: url(./assets/images/ph3oto-long-3.jpg);align:center">
					<div class="card-hidden"></div>
						<div id="error">
						</div>
						<div id="deactive">
						</div>
						<div id="sessiontimeout">
						</div>
						<div id="logout">
						</div>
						 <div class="card">
                        <div class="p-5"><!--p!-->
                            <div class="p-3">
                            <div class="auth-logo text-center mb-4">
                                <img src="assets/images/74235.png" alt="">
                            </div>
                          
                            <h1 class="mb-3 text-18">Sign In</h1>
                            <form method="post" action="/TDG/hello-servlet">
                                <div class="form-group">
                                    <label for="email" style="font-size:15px;color:black">UserName</label>
                                    <input id="email" class="form-control form-control-rounded" name="user" maxlength="20" required>
                                </div>
                                <div class="form-group">
                                    <label for="password"  style="font-size:15px;color:black">Password</label>
                                    <input id="password" class="form-control form-control-rounded" type="password" name="password" maxlength="25" required>
                                </div>
								<div class="pr-1 auth-right">
                                <button data-action='submit' class="btn btn-rounded btn-primary btn-block mt-4">Sign In</button>
								</div>
                            </form>
							
                            <div class="mt-3 text-center">
                                <a href="ForgotPassword.jsp" class="text-muted"><u style="font-size:18px;color:black">Forgot Password?</u></a>
                            </div>
                        </div>
                        </div>
                        </div>
                    </div>
                </div>
             
        </div>
    </div>

    <script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
    <script src="assets/js/vendor/bootstrap.bundle.min.js"></script>
    <script src="assets/js/es5/script.min.js"></script>
	
    <script>
		$(document).ready(function() {
		
			setTimeout(function() {
				// after 1000 ms we add the class animated to the login/register card
				$('.card').removeClass('card-hidden');
				let searchParams = new URLSearchParams(window.location.search)
				if (searchParams.has('error')) {
					$("#error").html('<div class="alert alert-danger alert-dismissible fade show" role="alert"><strong>Wrong Credentials!</strong> Try Again.<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');

				}
				if (searchParams.has('deactive')) {
					$("#deactive").html('<div class="alert alert-danger alert-dismissible fade show" role="alert"><strong>Your account is inactive or locked !</strong> Please contact to admin.<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');

				}
				if (searchParams
						.has('sessiontimeout')) {
					$("#sessiontimeout").html('<div class="alert alert-info alert-dismissible fade show" role="alert"><strong>Session is Expired!</strong> Login Again.<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
				}
				if (searchParams
					.has('logout')) {
					$("#logout").html('<div class="alert alert-success alert-dismissible fade show" role="alert"><strong>Logout Successfull!</strong><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>');
				}
			}, 700);
		});
	</script>
</body>

</html>