import 'package:alisportspk/datamodels/productInfo.dart';
import 'package:alisportspk/datamodels/user_reviews_ClassModel.dart';
import 'package:alisportspk/getx/appcontrollers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class WriteYourReview extends StatefulWidget {
  final Productinfo productinfo;
  const WriteYourReview({super.key, required this.productinfo});

  @override
  State<WriteYourReview> createState() => _WriteYourReviewState();
}

class _WriteYourReviewState extends State<WriteYourReview> {
  bool writeReview = false;
  double itemRating = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AppControllers appControllers = Get.put(AppControllers());
  Uint8List? selectedImage;
  final textController = TextEditingController();
  final commentTextController = TextEditingController();
  final userNameController = TextEditingController();
  final youtubeURLController = TextEditingController();
  final emailController = TextEditingController();
  final Uri terms = Uri.parse('https://judge.me/terms');
  final Uri privacy = Uri.parse('https://judge.me/privacy');
  final Uri content = Uri.parse('https://judge.me/content-policy');
  // For handling web file data.
  void submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the form data here
      debugPrint('Form submitted successfully!');
      debugPrint('Title: ${textController.text}');
      debugPrint('Comments: ${commentTextController.text}');
      debugPrint('Name: ${userNameController.text}');
      debugPrint('Email: ${emailController.text}');
      debugPrint('Rating: $itemRating');

      // Optional fields
      if (youtubeURLController.text.isNotEmpty) {
        debugPrint('YouTube URL: ${youtubeURLController.text}');
      } else {
        debugPrint('No YouTube URL provided.');
      }

      if (selectedImage != null) {
        debugPrint('Image selected.');
      } else {
        debugPrint('No image selected.');
      }
      final newReview = UserReviews(
        image: selectedImage.toString(), // Default image
        name: userNameController.text,
        item: textController.text,
        review: commentTextController.text,
        rating: itemRating,
      );
      appControllers.userReviews.add(newReview);
      // Reset form
      _formKey.currentState!.reset();
      setState(() {
        selectedImage = null;
        itemRating = 0;
      });
    } else {
      debugPrint('Form validation failed.');
    }
  }

  Future<void> pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image, // Restrict to image files
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          selectedImage = result.files.first.bytes; // Save image as Uint8List
        });
        debugPrint('Image selected: ${result.files.single.name}');
      } else {
        debugPrint('No file selected.');
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.h),
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Customer Reviews",
              style: GoogleFonts.roboto(fontSize: 22.sp),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.h, right: 20.w),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star_border_rounded,
                            color: Colors.teal,
                            size: 30.h,
                          ),
                          Icon(
                            Icons.star_border_rounded,
                            color: Colors.teal,
                            size: 30.h,
                          ),
                          Icon(
                            Icons.star_border_rounded,
                            color: Colors.teal,
                            size: 30.h,
                          ),
                          Icon(
                            Icons.star_border_rounded,
                            color: Colors.teal,
                            size: 30.h,
                          ),
                          Icon(
                            Icons.star_border_rounded,
                            color: Colors.teal,
                            size: 30.h,
                          ),
                        ],
                      ),
                      Text(
                        "Be the first to Write the Review",
                        style: GoogleFonts.roboto(
                            fontSize: 22.sp, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    writeReview = !writeReview;
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20.h),
                    color: Colors.teal,
                    height: 40.h,
                    width: 300.w,
                    child: Center(
                      child: Text(
                        writeReview ? "Cancel review" : "Write a review",
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            writeReview
                ? AnimatedContainer(
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 0.3, color: Colors.teal))),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 200.w),
                    duration: const Duration(microseconds: 1500),
                    curve: Curves.decelerate,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Write a review",
                          style: GoogleFonts.roboto(
                              color: Colors.black87,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Rating",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        RatingBar.builder(
                          initialRating: 0,
                          // unratedColor: Colors.transparent,
                          maxRating: 5,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            size: 30.h,
                            weight: 2,
                            color: Colors.teal,
                          ),
                          onRatingUpdate: (rating) {
                            debugPrint(
                                "Rating of item ${widget.productinfo.title} is:${rating.toString()}");
                            itemRating = rating;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Review Title (${100 - textController.text.length})",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w300),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Give your review a title',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.4)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.teal)),
                            ),
                            controller: textController,
                            maxLength: 100,
                            onChanged: (value) {
                              setState(() {});
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please provide a title';
                              }
                              return null;
                            },
                          ),
                        ),
                        Text(
                          "Review",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w300),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          height: 300.h,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Write your comments here',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.4)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.teal)),
                            ),
                            controller: commentTextController,
                            onChanged: (value) {
                              setState(() {});
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please provide a comment';
                              }
                              return null;
                            },
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            pickImage();
                          },
                          child: Container(
                            height: 200.h,
                            width: 200.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 0.6,
                              color: Colors.grey,
                            )),
                            child: selectedImage != null
                                ? Image.memory(
                                    selectedImage!, // Display image from Uint8List
                                    fit: BoxFit.cover,
                                  )
                                : Icon(
                                    Icons.file_upload_outlined,
                                    size: 50.h,
                                    weight: 10.w,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'YouTube URL',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.4)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.teal)),
                            ),
                            controller: youtubeURLController,
                            onChanged: (value) {
                              setState(() {});
                            },
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                final urlRegex = RegExp(
                                    r'^(https?\:\/\/)?(www\.youtube\.com|youtu\.?be)\/.+$');
                                if (!urlRegex.hasMatch(value)) {
                                  return 'Please provide a valid YouTube URL';
                                }
                              }
                              return null; // Valid if empty
                            },
                          ),
                        ),
                        Text(
                          "Name",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w300),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your name (public)',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.4)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.teal)),
                            ),
                            controller: userNameController,
                            onChanged: (value) {
                              setState(() {});
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please provide your name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Text(
                          "Email",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w300),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your email (private)',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.4)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.green)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0.5, color: Colors.teal)),
                            ),
                            controller: emailController,
                            onChanged: (value) {
                              setState(() {});
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please provide your email';
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return 'Please provide a valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15.h),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  writeReview = false;
                                  setState(() {});
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(top: 20.h, left: 30.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    width: 2,
                                    color: Colors.teal,
                                  )),
                                  height: 50.h,
                                  width: 250.w,
                                  child: Center(
                                    child: Text(
                                      "Cancel review",
                                      style: GoogleFonts.roboto(
                                          color: Colors.teal,
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  submitForm();
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 20.h),
                                  color: Colors.teal,
                                  height: 50.h,
                                  width: 250.w,
                                  child: Center(
                                    child: Text(
                                      "Submit review",
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text:
                                'How we use your data: We\'ll only contact you about the review you left, and only if necessary. By submitting your review, you agree to Judge.me\'s ',
                            style: GoogleFonts.roboto(fontSize: 20.sp),
                            children: [
                              TextSpan(
                                text: 'terms',
                                style: GoogleFonts.roboto(
                                  color: Colors.blue,
                                  fontSize: 20.sp,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    try {
                                      await launchUrl(
                                          terms); // Replace with your desired WhatsApp number
                                      debugPrint(
                                          ' terms Url launched successfully');
                                    } catch (e) {
                                      debugPrint(
                                          'Error  launching terms Url: $e');
                                    }
                                  },
                              ),
                              TextSpan(
                                  text: ', ',
                                  style: GoogleFonts.roboto(fontSize: 20.sp)),
                              TextSpan(
                                text: 'privacy',
                                style: GoogleFonts.roboto(
                                  color: Colors.blue,
                                  fontSize: 20.sp,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    try {
                                      await launchUrl(
                                          privacy); // Replace with your desired WhatsApp number
                                      debugPrint(
                                          ' privacy Url launched successfully');
                                    } catch (e) {
                                      debugPrint(
                                          'Error  launching privacy Url: $e');
                                    }
                                  },
                              ),
                              TextSpan(
                                  text: ' and ',
                                  style: GoogleFonts.roboto(fontSize: 20.sp)),
                              TextSpan(
                                text: 'content',
                                style: GoogleFonts.roboto(
                                  color: Colors.blue,
                                  fontSize: 20.sp,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    try {
                                      await launchUrl(
                                          content); // Replace with your desired WhatsApp number
                                      debugPrint(
                                          ' content Url launched successfully');
                                    } catch (e) {
                                      debugPrint(
                                          'Error  launching content Url: $e');
                                    }
                                  },
                              ),
                              TextSpan(
                                  text: ' policies.',
                                  style: GoogleFonts.roboto(fontSize: 20.sp)),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
