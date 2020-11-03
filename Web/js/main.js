var firebaseConfig = {
    apiKey: "AIzaSyC1mtwpbsBCtCapOmlx4YoA3WToiw8HZ6s",
    authDomain: "snappy-fingers.firebaseapp.com",
    databaseURL: "https://snappy-fingers.firebaseio.com",
    projectId: "snappy-fingers",
    storageBucket: "snappy-fingers.appspot.com",
    messagingSenderId: "984356357571",
    appId: "1:984356357571:web:d7ab52cfd7058cbf2c2976",
    measurementId: "G-T0KBHCEJ9P"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);
var firestore = firebase.firestore();
const db = firebase.firestore();
const auth = firebase.auth();


//VARIABLES TO TARGET ELEMENTS

var loginMail = document.getElementById('exampleEmail1');
var logPass = document.getElementById('examplePassword1');
var signName = document.getElementById('exampleName');
var signEmail = document.getElementById('exampleEmail2');
var signPass = document.getElementById('examplePassword2');
var signPhone = document.getElementById('examplePhone');

var a = document.getElementById("changepage");

//VARIABLES FOR FIRESTORE ELEMENTS

var uid; //To get current user emailID
var bioPoints, nonBioPoints, otherPoints;
var userName;
var userPhone;


// login signup show functions
function signUpShow() {
    document.querySelector('.loginform').classList.add('hide');
    document.querySelector('.signupform').classList.remove('hide');
    document.querySelector('.signupform').classList.add('animate__animated');
    document.querySelector('.signupform').classList.add('animate__fadeIn');
}

function loginShow() {

    document.querySelector('.loginform').classList.remove('hide');
    document.querySelector('.signupform').classList.add('hide');
    document.querySelector('.loginform').classList.add('animate__animated');
    document.querySelector('.loginform').classList.add('animate__fadeIn');
}


//REGISTER FUNCTION
async function register() {
    if (signName.value != "" && signEmail.value != "" && signPass.value != "" && signPhone.value != "") {
        if (signEmail.value.includes('.com') && signEmail.value.includes('@')) {
            if (signPass.value.length >= 8) {
                if (signPhone.value.length == 10) {


                    try {
                        if (await auth.createUserWithEmailAndPassword(signEmail.value, signPass.value)) {
                            db.collection(signEmail.value).doc("userInfo").set({
                                "name": signName.value,
                                "email": signEmail.value,
                                "phone": signPhone.value
                            })
                            db.collection(signEmail.value).doc("userPoints").set({
                                "bioWaste": 0,
                                "nonBioWaste": 0,
                                "other": 0
                            })
                            alert("Signed up successfully")
                            loginShow();
                        }
                    } catch (e) {
                        var temp = e;
                        alert(temp)
                    }
                } else {
                    alert("Enter a valid phone number")
                }
            } else {
                alert("Password must have at least 8 characters")
            }
        } else {
            alert("Enter a valid email address!")
        }
    } else {
        alert("Enter all fields!");
    }
}
async function signIn() {
    if (loginMail.value != "" && logPass != "") {
        try {
            if (await auth.signInWithEmailAndPassword(loginMail.value, logPass.value)) {
                var user = firebase.auth().currentUser;
                if (user != null) {
                    uid = user.email;
                    localStorage.setItem("currentUser", uid);
                    await db.collection(uid).doc("userInfo").get().then(function(doc) {
                        userName = doc.data().name,
                            userPhone = doc.data().phone
                    })
                    await db.collection(uid).doc("userPoints").get().then(function(doc) {
                        bioPoints = doc.data().bioWaste,
                            nonBioPoints = doc.data().nonBioWaste,
                            otherPoints = doc.data().other
                    })
                    alert("Signed In successfully")
                    location.replace("main.html")
                    console.log(userName, userPhone, bioPoints, nonBioPoints, otherPoints)
                }
            }
        } catch (e) {
            alert(e);
        }
    } else {
        alert("Cannot login without email or password")
    }
}
////types of waste points////
db.collection(localStorage.getItem("currentUser")).doc("userPoints").get().then(function(doc) {
    document.getElementById("wastepoints1").innerHTML = doc.data().bioWaste;
    document.getElementById("wastepoints2").innerHTML = doc.data().other;
    document.getElementById("wastepoints3").innerHTML = doc.data().nonBioWaste;
})




///profile/////
db.collection(localStorage.getItem("currentUser")).doc("userInfo").get().then(function(doc) {
    document.getElementById("name").innerHTML = doc.data().name;
    document.getElementById("email").innerHTML = doc.data().email;
    document.getElementById("phone").innerHTML = doc.data().phone;

})
db.collection(localStorage.getItem("currentUser")).doc("userPoints").get().then(function(doc) {
        document.getElementById("points").innerHTML = doc.data().bioWaste + doc.data().nonBioWaste + doc.data().other;
    })
    //3rd page functions
var i = 0;;

function showDetails() {
    console.log("gg")
    if (i == 0) {
        document.getElementById("hiddenDiv").classList.remove("hide");
        document.getElementById("hiddenDiv").classList.add("animate__animated");
        document.getElementById("hiddenDiv").classList.add("animate__fadeIn");
        document.getElementById("details").innerHTML = "Hide details";

        i = 1;
    } else {
        document.getElementById("details").innerHTML = "See details";
        document.getElementById("hiddenDiv").classList.add("hide");
        i = 0;
    }
}
//GET TRANSACTION DATA.......

db.collection("transactions").orderBy("time", "asc").onSnapshot(async function(querySnapshot) {
    await querySnapshot.docChanges().forEach(function(change) {
        if (change.type == "added") {
            document.querySelector("#offerDiv").innerHTML += "<div class='offers'><h6 class='data'>" + "Material: " + change.doc.data().describe +
                "</h6><h6 class='data'>" + "Quantity: " + change.doc.data().quantity + "</h6><div class='userDetails hide' id='hiddenDiv'><h6 class='data'>" +
                "Name: " + change.doc.data().name + "</h6><h6 class='data'>" + "Contact: " + change.doc.data().phone + "</h6><h6 class='data'>" +
                "email: " + change.doc.data().email + "</h6><h6 class='data'>" + "City: " + change.doc.data().city + `</h6></div><button type='button' onclick='showDetails()' id='details'>` +
                "See details" + "</button></div>"

        }
    })
})