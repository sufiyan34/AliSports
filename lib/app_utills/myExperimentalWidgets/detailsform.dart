import 'package:alisportspk/app_utills/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:info_popup/info_popup.dart';

class Detailsform extends StatefulWidget {
  final Color? fillColor;
  final bool? filled;
  const Detailsform({super.key, this.fillColor, this.filled});

  @override
  State<Detailsform> createState() => _DetailsformState();
}

class _DetailsformState extends State<Detailsform> {
  final _formKey = GlobalKey<FormState>();
  final List<String> countries = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo',
    'Costa Rica',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Korea (North)',
    'Korea (South)',
    'Kosovo',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Myanmar (Burma)',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North Macedonia',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Palestine',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Vincent and the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Syria',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Timor-Leste',
    'Togo',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Vatican City',
    'Venezuela',
    'Vietnam',
    'Yemen',
    'Zambia',
    'Zimbabwe',
  ];

  List<String> getDropdownCountries() {
    // Ensure selected country is at the top
    List<String> reorderedList = List<String>.from(countries);
    reorderedList.remove(country);
    reorderedList.insert(0, country);
    return reorderedList;
  }

  String country = 'Pakistan';
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController apartmentSuite = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber2 = TextEditingController();
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            DropdownButtonFormField(
              decoration: InputDecoration(
                filled: widget.filled,
                fillColor: widget.fillColor,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5, color: Colors.grey)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.teal)),
                labelText: 'Country/Region',
              ),
              value: country,
              items: [
                DropdownMenuItem(
                  enabled: false,
                  value: null,
                  child: Column(
                    children: [
                      Text(
                        country,
                        style: TextStyle(fontSize: 18.sp, color: Colors.black),
                      ),
                      Text(
                        "---",
                        style: TextStyle(fontSize: 18.sp, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                ...getDropdownCountries().map((country) => DropdownMenuItem(
                      value: country,
                      child: Text(country),
                    )),
              ],
              onChanged: (value) {
                setState(() {
                  country = value!;
                });
              },
            ),
            SizedBox(height: 15.h),
            CustomFormTextField(
              filled: widget.filled,
              fillColor: widget.fillColor,
              keyboardType: TextInputType.number,
              labelText: 'Contact Number',
              fieldController: phoneNumber,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              customizedValidation: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a number';
                }
                if (value.length != 11) {
                  return 'Please enter exactly 11 digits';
                }
                return null;
              },
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: CustomFormTextField(
                    filled: widget.filled,
                    fillColor: widget.fillColor,
                    labelText: 'First Name',
                    fieldController: firstName,
                    customizedValidation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your First Name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: CustomFormTextField(
                    filled: widget.filled,
                    fillColor: widget.fillColor,
                    labelText: 'Last Name',
                    fieldController: lastName,
                    customizedValidation: (value) {
                      if (value != null && value.isNotEmpty) {
                        return value;
                      }
                      return null;
                      // Valid if empty
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            CustomFormTextField(
              filled: widget.filled,
              fillColor: widget.fillColor,
              labelText: 'Address',
              fieldController: address,
            ),
            SizedBox(height: 15.h),
            CustomFormTextField(
              filled: widget.filled,
              fillColor: widget.fillColor,
              fieldController: apartmentSuite,
              labelText: 'Apartment,suite, etc(optional)',
              customizedValidation: (value) {
                if (value != null && value.isNotEmpty) {
                  return 'your appartment is :$value';
                }
                return null;
              },
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: CustomFormTextField(
                    filled: widget.filled,
                    fillColor: widget.fillColor,
                    fieldController: city,
                    labelText: 'City',
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: CustomFormTextField(
                    filled: widget.filled,
                    fillColor: widget.fillColor,
                    labelText: 'Postalcode(optional)',
                    fieldController: postalCode,
                    customizedValidation: (value) {
                      if (value != null && value.isNotEmpty) {
                        return 'your Postalcode is :$value';
                      }
                      // Valid if empty
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            CustomFormTextField(
              filled: widget.filled,
              fillColor: widget.fillColor,
              hintText: 'Phone number for orders, delivery & offer uppdates',
              labelText: "Phone number",
              fieldController: phoneNumber2,
              suffixIcon: InfoPopupWidget(
                contentTitle: 'In case we need to contact you about your order',
                arrowTheme: InfoPopupArrowTheme(
                  color: Colors.black.withOpacity(0.6),
                  arrowDirection: ArrowDirection.down,
                ),
                contentTheme: InfoPopupContentTheme(
                  infoContainerBackgroundColor: Colors.black.withOpacity(0.6),
                  infoTextStyle:
                      TextStyle(color: Colors.white, fontSize: 16.sp),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                  contentBorderRadius: BorderRadius.all(Radius.circular(10.r)),
                  infoTextAlign: TextAlign.center,
                ),
                child: Icon(
                  Icons.help_outline,
                  size: 20.h,
                ),
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              customizedValidation: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a number';
                }
                if (value.length != 11) {
                  return 'Please enter exactly 11 digits';
                }
                return null;
              },
            ),
          ],
        ));
  }
}
