function checkPswd() {
        var confirmPassword = "0112112";
        var password = document.getElementById("199829238141").value;
        if (password == confirmPassword) {
             window.location="welcome.html";
        }
        else{
            alert("HAHA, do it again.");
        }
    }