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
  const auth  = firebase.auth();


//VARIABLES TO TARGET ELEMENTS

var loginMail = document.getElementById('exampleEmail1');
var logPass  = document.getElementById('examplePassword1');
var signName = document.getElementById('exampleName');
var signEmail = document.getElementById('exampleEmail2');
var signPass = document.getElementById('examplePassword2');
var signPhone = document.getElementById('examplePhone');

var a = document.getElementById("changepage");

//VARIABLES FOR FIRESTORE ELEMENTS

var uid; //To get current user emailID
var bioPoints,nonBioPoints,otherPoints;
var userName;
var userPhone;


  // login signup show functions
  function signUpShow()
{
    document.querySelector('.loginform').classList.add('hide');
    document.querySelector('.signupform').classList.remove('hide');
    document.querySelector('.signupform').classList.add('animate__animated');
    document.querySelector('.signupform').classList.add('animate__fadeIn');
}
function loginShow()
{
   
    document.querySelector('.loginform').classList.remove('hide');
    document.querySelector('.signupform').classList.add('hide');
    document.querySelector('.loginform').classList.add('animate__animated');
    document.querySelector('.loginform').classList.add('animate__fadeIn');
}


//REGISTER FUNCTION
async function register()
{
    if(signName.value!=""&&signEmail.value!=""&&signPass.value!=""&&signPhone.value!="")
    {
        if(signEmail.value.includes('.com')&&signEmail.value.includes('@'))
        {
            if(signPass.value.length >= 8)
            {
              if(signPhone.value.length == 10)
              {

              
                try{
                    if(await auth.createUserWithEmailAndPassword(signEmail.value,signPass.value)){
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
        }
        catch(e)
        {
            var temp = e;
            alert(temp)
        }
    }
    else{
      alert("Enter a valid phone number")
    }
  }
                 
            else{
                alert("Password must have at least 8 characters")
            }
        }
        else{
            alert("Enter a valid email address!")
        }
    }
    else
    {
        alert("Enter all fields!");
    }
}
async function signIn()
{
    if(loginMail.value!=""&&logPass!="")
    {
        try{
            if( await auth.signInWithEmailAndPassword(loginMail.value,logPass.value)){
              var user = firebase.auth().currentUser;
              if(user !=null)
              {
                  uid = user.email;
                 await db.collection(uid).doc("userInfo").get().then(function(doc){
                    userName=doc.data().name,
                    userPhone=doc.data().phone
                  })
                 await db.collection(uid).doc("userPoints").get().then(function(doc){
                   bioPoints=doc.data().bioWaste,
                   nonBioPoints=doc.data().nonBioWaste,
                   otherPoints=doc.data().other
                 })
              alert("Signed In successfully")
                location.replace("main.html")
              console.log(userName,userPhone,bioPoints,nonBioPoints,otherPoints)
            }
        }
    }
        catch(e){
            alert(e);
        }
    }
    else{
        alert("Cannot login without email or password")
    }
}
