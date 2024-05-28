

class Strings {
  Strings._();

  static final Strings _instance = Strings._();

  factory Strings() => _instance;

  static Strings get instance => _instance;

  //string

  static const String apiKey = "AIzaSyBGglnTSFDbNjRt5QinAN1P_Nx9M_YdWGI";
  static const String providerPrivacyPolicy = "https://beautyspotapp.co.uk/privacy-policy/";
  static const String providerTerms ="https://beautyspotapp.co.uk/service-provider-terms-and-conditions/";

  static const String clientPrivacyPolicy = "https://beautyspotapp.co.uk/privacy-policy/";
  static const String clientTerms = "https://beautyspotapp.co.uk/client-terms-and-conditions/";

  //type
  static const clientTpe="Client";
  static const photographerType="Photographer";

  //sign up
  static const String register = "Register";
  static const String signUpToAccount = "Sign up to your account";
  static const String firstName = "First Name";
  static const String lastName = "Last Name";
  static const String enterPass = "Enter your password";
  static const String signUp = "Sign Up";
  static const String orSignUpWith = "Or Sign up with";
  static const String alreadyHaveAcc = "Already Have account? Let’s";
  static const String signIn = "Sign in";
  static const String emailAddress = "Email address";
  static const String enterYourPassword = "Enter your password";
  static const String phoneNumber = "Phone number";

  //sign in
  static const String welcome = "Welcome";
  static const String signInToYourAcc = "Sign in to your account";
  static const String forgotYourPass = "Forgot your password?";
  static const String orSignInWith = "Or Sign in with";
  static const String doNotHaveAcc = "Don’t have account? Let’s";

  //Verification
  static const String verifyOTP = "Verify OTP";
  static const String enterYourOtp = "Enter your OTP which has been sent to your \nphone and complete verify your account.";
  static const String aCodeHas = "A code has been sent to your phone";
  static const String resendIn = "Resend in";
  static const String enter4digit = "Enter 4 digit code sent to you";
  static const String verify = "Verify";
  static const String resendCode = "Resend code";
  static const String didNotRecieveVerification = "Didn’t recieve a verification code?";

  //Forgot Password
  static const String forgotPassword = "Forgot Password";
  static const String enterRegistered = "Please enter your registered email\nto reset your password.";
  static const String resetPassword = "Reset Password";

  //reset password
  static const String update = "Update";
  static const String enterNewPassAndConfirmPass= "Please enter your new password and confirm\nthe password.";
  static const String confirmPass= "Confirm Password";
  static const String newPass= "New Password";

  //intro screen
  static const String next= "Next";
  static const String skip= "Skip";
  static const String getStarted= "Get Started";
  static const String congYourAccount= "Congratulations your account";
  static const String hasBeenCreated= "has been created";


  //option screen
  static const String  photographer= "Photographer";
  static const String  client= "Client";

 //Create Business Profile
  static const String  createBusinessProfile= "Create Business Profile";
  static const String  chooseYourPicture= "Choose your profile picture";
  static const String  businessName= "Business Name";
  static const String  userName= "User Name";
  static const String  businessLocation= "Business Location";
  static const String  aboutYou= "About you";

  //change password
  static const String  changePassword= "Change Password";
  static const String  oldPassword= "Old Password";
  static const String  updatePassword= "Update password";

//category SCREEN
  static const categoryList=["Client’s phone",
    "My Phone",
    "Pro Camera",
    'Social media expert'
  ];
  static const selectYourCategory="Select your category";
  static const thisIsSo="This is so that we can match you with user\nwho have any specific preference";

  //edit profile screen
  static const save="Save";
  static const editProfile="Edit Profile";

  // report a problem
  static const reportProblem="Report a problem";
  static const sendUsMsg="Send us a message & we’ll get back to you as soon as possible!";
  static const subject="Subject";
  static const typeHere="Type here...";
  static const submit="Submit";

  //review screen
  static const reviews="Reviews";

  // edit business profile
  static const editBusiness="Edit Business";
  static const saveDetails="Save Details";

 // booking
  static const bookings="Bookings";
  static const availableForBooking="Available for booking";
  static const requests="Requests";
  static const active="Active";
  static const inProgress="In Progress";
  static const upcoming="Upcoming";
  static const accept="Accept";
  static const reject="Reject";
  static const booking="Booking";

  //access location
  static const notNow="Not Now";
  static const allow="Allow";
  static const allowAccessTo="Allow access to your location";
  static const appWillFindYour="App will find your location thorugh google map and prodle you near by photographer";

  //Preference
  static const preference="Preference";
  static const bookNow="Book Now";
  static const clientPhone="Client’s phone";
  static const myPhone="My Phone";
  static const proCamera="Pro Camera";
  static const cash="Cash";
  static const googlePay="Google Pay";
  static const online="Online";

  static List<String> timeList = ["1 hour", "2 hours", "3 hours"];


  static const String availForBooking = "Available for booking";
  static const String waitingDesc = "We are searching for photographer that best suits your requirement";
  static const String pAssignedDesc = "You can view photographer profile & track live from your Home Screen";


  ///old project
  // Your string constants here
  // static const String appName = "BeautySpot";
  // static const String stripeTestKey = "pk_test_51OoDYLCL4g20n38Jw11xhTu6ucdv6STDfwUT3hPVIOKkInHyPeca0TUIkupwgiFE2RjtOWAqBcG6UdrMpOohakXF00wX33OGLp";
  // static const String stripIdPublish="pk_live_51OoDYLCL4g20n38JhoXRtcK2GP3CVcLNgVXcwXl5YFFd4Bwsbs760fDTTFSwKfJK4oA7qVGx7Ry9fqiRD4rcgzF700evmGJbh8";

  // Font family
  static const String Font_Family_Poppins = "Poppins";
  static const String Font_Family_Compact = "Compact";
  static const String Font_Family_Montserrat= "Montserrat";


  static const String testDesc = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras quis condimentum lorem. In vitae accumsan dolor";
  static const String defaultImageLink = "https://static.displate.com/280x392/displate/2020-06-20/97526a531e9ff32c26f7752ebc926941_07a032cb55575a397e6ba8c98804ad43.jpgD";
  static const String myProfile = "My Profile";
  static const String pastBooking = "Past Booking";
  static const String manageBooking = "Manage Bookings";
  static const String account = "Account";
  static const String termCond = "Terms and Conditions";
  static const String privacyPolicy = "Privacy Policy";
  static const String deleteAccount = "Delete Account";
  static const String logout = "Logout";

  static const String paymentMethods = "Payment Methods";
  static const String paymentMethod = "Payment Method :";
  static const String seeAll = "See all";
  static const String track = "Track";
  static const String cancel = "Cancel";
  static const String bookingAt = "Booking at :";
  static const String bookingTime = "Booking Time :";
  static const String perHour = "Per Hrs :";
  static const String bookingCode = "Booking Code :";
  static const String location = "Location";
  static const String comments = "Comments";
  static const String deliverable = "Deliverable";
  static const String endAndPay = "End & Pay";
  static const String timer = "Timer";
  static const String pricing = "Pricing";
  static const String bookingEnded = "Booking Ended";
  static const String bookingEndedDesc = "Please conform that you received the below amount from the client";
  static const String yesIConfirm = "Yes, I conform";
  static const String helpNSupport = "Help & Support";
  static const String leaveReview = "Leave Review";
  static const String timeUp = "Time Up !!";
  static const String timeUpDesc = "You have originally booked “John Smith” for 30 mins, Do you want to extend the booking further ?";
  static const String noThanks = "No, Thanks";
  static const String yesExtend = "Yes, Extend Now";
  static const String startAppointment = "Start Appointment";
  static const String bookingFor = "Booking for";
  static const String verifyBookingCode = "Verify Booking Code";
  static const String verifyBookingCodeDesc = "Enter booking code shared with your client to begin the booking.";
  static const String codeSent = "A code has been shown on client’s booking screen";
  static const String myBookings = "My Bookings";
  static const String finished = "Finished";
  static const String pastBookings = "Past Bookings";

  static const String myWallet = "My Wallet";
  static const String addMoney = "Add Money";
  static const String walletBalance  = "Wallet Balance";
  static const String transactionHistory = "Transaction History";
  static const String withdrawal = "Withdrawal";
  static const String amountToWithdraw = "Amount to withdraw";

  static const String wentWrong = "Something went wrong...";

  static const String notifications = "Notifications";
}
