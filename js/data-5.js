function checkPswd() {
        var confirmPassword = "011221";
        var password = document.getElementById("19982938141").value;
        if (password == confirmPassword) {
             window.location="index.html";
        }
        else{
            alert("HAHA, do it again.");
        }
    }