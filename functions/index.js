const functions = require("firebase-functions");
const admin = require("firebase-admin");
const nodemailer = require("nodemailer");
const randomize = require("randomatic");

admin.initializeApp();

exports.sendOtpEmail = functions.https.onCall(async (data, context) => {
  const email = data.email;
  const otpCode = randomize("0", 4); // Generate a 4-digit OTP code

  // Store the OTP code securely in Firestore
  const db = admin.firestore();
  const otpRef = db.collection("otpCodes").doc(email);

  try {
    await otpRef.set({
      code: otpCode,
      timestamp: admin.firestore.FieldValue.serverTimestamp(),
    });
  } catch (error) {
    console.error("Error storing OTP in Firestore:", error);
    throw new functions.https.HttpsError(
        "internal",
        "Error storing OTP in Firestore",
    );
  }

  // Set up nodemailer with your email service credentials
  const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: "marshalldennis27@gmail.com",
      pass: "!@3@crayz<3f70v3",
    },
  });

  const mailOptions = {
    from: "marshalldennis27@gmail.com",
    to: email,
    subject: "Your OTP Code",
    text: `Your OTP code is: ${otpCode}`,
  };

  // Send the email
  await transporter.sendMail(mailOptions);

  return {success: true};
});

