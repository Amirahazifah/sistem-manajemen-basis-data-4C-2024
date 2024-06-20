document.getElementById("password").onfocus = function () {
  document.getElementById("togglePassword").style.display = "block";
};

document.getElementById("password").onblur = function () {
  if (document.getElementById("password").value === "") {
    document.getElementById("togglePassword").style.display = "none";
  } else {
    document.getElementById("togglePassword").style.display = "block";
  }
};

const togglePassword = document.querySelector("#togglePassword");
const password = document.querySelector("#password");

togglePassword.addEventListener("click", function (e) {
  // toggle the type attribute
  const type =
    password.getAttribute("type") === "password" ? "text" : "password";
  password.setAttribute("type", type);
  // toggle the eye slash icon
  this.classList.toggle("fa-eye-slash");
});

document.getElementById("cpassword").onfocus = function () {
  document.getElementById("toggleCPassword").style.display = "block";
};

document.getElementById("cpassword").onblur = function () {
  if (document.getElementById("cpassword").value === "") {
    document.getElementById("toggleCPassword").style.display = "none";
  } else {
    document.getElementById("toggleCPassword").style.display = "block";
  }
};

const toggleCPassword = document.querySelector("#toggleCPassword");
const Cpassword = document.querySelector("#cpassword");

toggleCPassword.addEventListener("click", function (e) {
  // toggle the type attribute
  const type =
    Cpassword.getAttribute("type") === "password" ? "text" : "password";
  Cpassword.setAttribute("type", type);
  // toggle the eye slash icon
  this.classList.toggle("fa-eye-slash");
});
