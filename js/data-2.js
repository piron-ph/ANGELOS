function checkPswd() {
        var confirmPassword = "1020101";
        var password = document.getElementById("199829381411").value;
        if (password == confirmPassword) {
             window.location="welcome.html";
        }
        else{
            alert("HAHA, do it again.");
        }
    }