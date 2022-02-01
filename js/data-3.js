function checkPswd() {
        var confirmPassword = "01221112";
        var password = document.getElementById("199829381413").value;
        if (password == confirmPassword) {
             window.location="welcome.html";
        }
        else{
            alert("HAHA, do it again.");
        }
    }