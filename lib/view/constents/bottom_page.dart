import 'package:alisportspk/view/constents/searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int? linkIndex;
  final Uri faceBook = Uri.parse('https://www.facebook.com/');
  final Uri instagram = Uri.parse('https://www.instagram.com/');
  final Uri tiktok = Uri.parse('https://www.tiktok.com/');
  final Uri youtube = Uri.parse('https://www.youtube.com/');
  final PageController _linkController = PageController();
  bool _onhovering = false;
  bool isEmailValid = false;
  bool textfieldContainerTpped = false;
  String? enteredEmail;
  final _formKey = GlobalKey<FormState>();
  List<String> quickLinks = [
    "Search",
    "About Us",
    "Contact",
    "Request a Return or Exchange",
    "Track Your Order",
    "Affiliate Program",
    "Privacy Policy",
    "Shipping Policy",
    "Terms of Service",
    "Exchange and Returns",
    "Refund policy"
  ];
  double _borderWidth = 0.8;

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 130.w),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Quick Links',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: 700.w,
                          width: 250.w,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: quickLinks.length,
                            controller: _linkController,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  linkIndex = index;
                                  setState(() {});
                                },
                                child: MouseRegion(
                                  onEnter: (event) {
                                    _onhovering = true;
                                    linkIndex = index;
                                  },
                                  onHover: (event) {
                                    _onhovering = true;
                                    linkIndex = index;
                                  },
                                  onExit: (event) {
                                    _onhovering = false;
                                    linkIndex = null;
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 6.w),
                                    child: Text(quickLinks[index],
                                        style: (_onhovering == true &&
                                                linkIndex == index)
                                            ? TextStyle(
                                                color: Colors.yellow[50],
                                                fontSize: 18.sp,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontWeight: FontWeight.w300)
                                            : TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.7),
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w300)),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('About Us',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          width: 350.w,
                          child: Wrap(
                            children: [
                              Text(
                                  "At Ali Sports, we pride ourselves on being a premium provider of top-notch sports and fitness equipment."
                                  "Our extensive experience in the industry, spanning over 30 years, has allowed us to form partnerships with some of the biggest names in the world of sports."
                                  "As both a manufacturer and retailer, we offer a one-stop-shop for all your high-performance sports gear needs, with a reputation for delivering outstanding customer satisfaction."
                                  "Whether you're a professional athlete or simply looking to enhance your home workout, we've got you covered.",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Let's talk",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w400)),
                        SizedBox(
                          width: 250.w,
                          child: Wrap(
                            children: [
                              Text(
                                  "Operating Hours: 10am to 9pm (Everyday)\n"
                                  "Phone: 0315-2273142 (WhatsApp)\n"
                                  "Email: alisportsbwn@gmail.com",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      child: Wrap(
                        children: [
                          SizedBox(
                            height: 35.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 25.w,
                                  width: 40.w,
                                  child: Image.network(
                                    'assets/images/cash-on-delivery.png',
                                    height: 25.w,
                                    width: 40.w,
                                  ),
                                ),
                                Text("CASH ON\nDELIVERY",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w300)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 35.w,
                            width: 40.w,
                            child: Image.network(
                              "assets/images/card.png",
                              height: 35.w,
                              width: 40.w,
                            ),
                          ),
                          SizedBox(
                            height: 35.w,
                            width: 40.w,
                            child: Image.network(
                              "assets/images/visa.png",
                              height: 35.w,
                              width: 40.w,
                            ),
                          ),
                          SizedBox(
                            height: 35.w,
                            width: 40.w,
                            child: Image.network(
                              "assets/images/mastercard.png",
                              height: 35.w,
                              width: 40.w,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 70.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("GET LATEST OFFERS FIRST",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w300)),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                textfieldContainerTpped =
                                    !textfieldContainerTpped;
                                _borderWidth == 0.8 ? 1.6 : 0.8;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 25.w),
                              padding: EdgeInsets.symmetric(
                                  vertical: 4.w, horizontal: 15.w),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: textfieldContainerTpped
                                    ? Colors.purple
                                    : Colors.white,
                                width: _borderWidth,
                              )),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 25.w,
                                    width: 550.w,
                                    child: TextFormField(
                                      controller: _controller,
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                        labelStyle:
                                            TextStyle(color: Colors.white60),
                                        border: InputBorder.none,
                                      ),
                                      onTapOutside: (event) =>
                                          FocusScope.of(context).unfocus(),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      onChanged: (value) {
                                        setState(() {
                                          isEmailValid = RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
                                              .hasMatch(value);
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter an email address';
                                        }
                                        if (!RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
                                            .hasMatch(value)) {
                                          return 'Please enter a valid email address';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  IconButton(
                                      iconSize: 20.w,
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // Email is valid
                                          enteredEmail = _controller.text;
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.arrow_right_alt,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () async {
                                try {
                                  await launchUrl(
                                      faceBook); // Replace with your desired WhatsApp number
                                  debugPrint('faceBook launched successfully');
                                } catch (e) {
                                  debugPrint('Error launching faceBook: $e');
                                }
                              },
                              icon: Icon(
                                Icons.facebook_rounded,
                                color: Colors.white,
                                size: 20.w,
                              )),
                          IconButton(
                              onPressed: () async {
                                try {
                                  await launchUrl(
                                      instagram); // Replace with your desired WhatsApp number
                                  debugPrint('instagram launched successfully');
                                } catch (e) {
                                  debugPrint('Error launching instagram: $e');
                                }
                              },
                              icon: Image.network(
                                'assets/images/instagram.png',
                                color: Colors.white,
                                height: 20.w,
                                width: 20.w,
                              )),
                          IconButton(
                              onPressed: () async {
                                try {
                                  await launchUrl(
                                      youtube); // Replace with your desired WhatsApp number
                                  debugPrint(' youtube launched successfully');
                                } catch (e) {
                                  debugPrint('Error launching  youtube: $e');
                                }
                              },
                              icon: Image.network(
                                'assets/images/youtube.png',
                                color: Colors.white,
                                height: 20.w,
                                width: 20.w,
                              )),
                          IconButton(
                              onPressed: () async {
                                try {
                                  await launchUrl(
                                      tiktok); // Replace with your desired WhatsApp number
                                  debugPrint('tiktok launched successfully');
                                } catch (e) {
                                  debugPrint('Error launching tiktok: $e');
                                }
                              },
                              icon: Icon(
                                Icons.tiktok,
                                color: Colors.white,
                                size: 20.w,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.white70,
            thickness: 1,
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 25.w),
              padding: EdgeInsets.symmetric(horizontal: 130.w),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Country/region',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300)),
                  Container(
                      width: 250.w,
                      margin: EdgeInsets.only(bottom: 25.w, top: 15.w),
                      padding:
                          EdgeInsets.symmetric(vertical: 4.w, horizontal: 15.w),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.white,
                        width: 1,
                      )),
                      child: const SearchableDropdownMenuButton()),
                  Text('2024, Ali Sports',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300)),
                  Center(
                    child: Container(
                        width: 550.w,
                        margin: EdgeInsets.only(bottom: 25.w, top: 15.w),
                        padding: EdgeInsets.symmetric(
                            vertical: 4.w, horizontal: 15.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: const SearchableDropdownMenuButton(
                            dropdownIcon: Icons.arrow_drop_down,
                            dropdownTextColor: Colors.black,
                            dropdownIconColor:
                                Color.fromARGB(221, 34, 34, 34))),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
