            $(document).ready(function ()
                $("form").submit(function(event)
                    event.preventDefault(),
                     username=$("#username").val(),
                     email=$("#email").val(),
                     password=$("#password").val(),
                     submit=$("#submit").val(),
                    $(".form-message").load("data",{
                        username:username,
                        email:email,
                        password:password,
                        submit:submit
                    })
                ///////
                ("div").get("/checkUserName",{UserName:username},(data,status)=>
                
                    if(data==='1');
                    {
                        $(this).css("background","lightgreen");
                        $('.valid').html("<h3>VALID USER NAME</h3>");
                    }
                    else if(data==='0');
                    {
                        $(this).css("background","red");
                        $('.valid').html("<h3>INVALID USER NAME</h3>");
                    };
                /////
                $('.email').change(function()
                 username=$('.email').val().split('@'),
                 if(username.length>1);
                     $.get("/checkUserName",{userName:username},(data,status)=>
                        if(data==='1');
                        {
                            $(this).css("background","lightgreen");
                            $('.valid').html("<h3>VALID USER NAME</h3>");
                        }
                        else if (data==='0');
                        {
                            $(this).css("background","red");
                            $('.valid').html("<h3>INVALID USER NAME</h3>");
                        }