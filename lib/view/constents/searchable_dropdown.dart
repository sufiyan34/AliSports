import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchableDropdownMenuButton extends StatefulWidget {
  const SearchableDropdownMenuButton(
      {super.key,
      this.dropdownIcon = Icons.keyboard_arrow_down,
      this.dropdownIconColor = const Color.fromRGBO(255, 255, 255, 0.7),
      this.dropdownTextColor = Colors.white});
  final IconData dropdownIcon;
  final Color dropdownTextColor;
  final Color dropdownIconColor;

  @override
  State<SearchableDropdownMenuButton> createState() =>
      _SearchableDropdownMenuButtonState();
}

class _SearchableDropdownMenuButtonState
    extends State<SearchableDropdownMenuButton> {
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  List<String> countriesWithCurrency = [
    "Afghanistan | AFN ؋",
    "Albania | ALL Lekë",
    "Algeria | DZD د.ج",
    "Andorra | EUR €",
    "Angola | AOA Kz",
    "Antigua and Barbuda | XCD \$",
    "Argentina | ARS \$",
    "Armenia | AMD ֏",
    "Australia | AUD \$",
    "Austria | EUR €",
    "Azerbaijan | AZN ₼",
    "Bahamas | BSD \$",
    "Bahrain | BHD BD",
    "Bangladesh | BDT ৳",
    "Barbados | BBD \$",
    "Belarus | BYN Br",
    "Belgium | EUR €",
    "Belize | BZD ",
    "Benin∣XOFCFA",
    "Bhutan∣BTNNu.",
    "Bolivia∣BOBBs.",
    "BosniaandHerzegovina∣BAMKM",
    "Botswana∣BWPPula",
    "Brazil∣BRLR",
    "Brunei | BND \$",
    "Bulgaria | BGN лв",
    "Burkina Faso | XOF CFA",
    "Burundi | BIF Fr",
    "Cabo Verde | CVE \$",
    "Cambodia | KHR ៛",
    "Cameroon | XAF CFA",
    "Canada | CAD \$",
    "Central African Republic | XAF CFA",
    "Chad | XAF CFA",
    "Chile | CLP \$",
    "China | CNY ¥",
    "Colombia | COP \$",
    "Comoros | KMF KMF",
    "Congo | XAF CFA",
    "Costa Rica | CRC ₡",
    "Cote d'Ivoire | XOF CFA",
    "Croatia | HRK kn",
    "Cuba | CUP \$MN",
    "Cyprus | EUR €",
    "Czech Republic | CZK Kč",
    "Democratic Republic of the Congo | XAF CFA",
    "Denmark | DKK kr",
    "Djibouti | DJF Fr",
    "Dominica | XCD ",
    "DominicanRepublic∣DOPRD",
    "Ecuador | USD \$",
    "Egypt | EGP ج.م",
    "El Salvador | USD\$",
    "Equatorial Guinea | XAF CFA",
    "Eritrea | ERN ናቕፋ",
    "Estonia | EUR €",
    "Eswatini | SZL E",
    "Ethiopia | ETB Br",
    "Fiji | FJD \$",
    "Finland | EUR €",
    "France | EUR €",
    "Gabon | XAF CFA",
    "Gambia | GMD D",
    "Georgia | GEL ₾",
    "Germany | EUR €",
    "Ghana | GHS GH¢",
    "Greece | EUR €",
    "Grenada | XCD \$",
    "Guatemala | GTQ Q",
    "Guinea | GNF FG",
    "Guinea-Bissau | XOF CFA",
    "Guyana | GYD ",
    "Haiti∣HTGGourdes",
    "Honduras∣HNLL",
    "Hungary∣HUFFt",
    "Iceland∣ISKkr",
    "India∣INR₹",
    "Indonesia∣IDRRp",
    "Iran∣IRRریال",
    "Iraq∣IQDع.د",
    "Ireland∣EUR€",
    "Israel∣ILS₪",
    "Italy∣EUR€",
    "Jamaica∣JMDJ",
    "Japan | JPY ¥",
    "Jordan | JOD JD",
    "Kazakhstan | KZT ₸",
    "Kenya | KES KSh",
    "Kiribati | AUD \$",
    "Kuwait | KWD KD",
    "Kyrgyzstan | KGS  сом",
    "Laos | LAK ₭",
    "Latvia | EUR €",
    "Lebanon | LBP £L",
    "Lesotho | LSL L",
    "Liberia | LRD \$",
    "Libya | LYD LD",
    "Liechtenstein | CHF Fr",
    "Lithuania | EUR €",
    "Luxembourg | EUR €",
    "Madagascar | MGA Ariary",
    "Malawi | MWK MK",
    "Malaysia | MYR RM",
    "Maldives | MVR .ރ",
    "Mali | XOF CFA",
    "Malta | EUR €",
    "Marshall Islands | USD \$",
    "Mauritania | MRU UM",
    "Mauritius | MUR Rs",
    "Mexico | MXN \$",
    "Micronesia | USD ",
    "Moldova∣MDLLei",
    "Monaco∣EUR€",
    "Mongolia∣MNT₮",
    "Montenegro∣EUR€",
    "Morocco∣MADدرهم",
    "Mozambique∣MZNMT",
    "Myanmar∣MMKKs",
    "Namibia∣NADN",
    "Nauru | AUD \$",
    "Nepal | NPR रु",
    "Netherlands | EUR €",
    "New Zealand | NZD ",
    "Nicaragua∣NIOC",
    "Niger | XOF CFA",
    "Nigeria | NGN ₦",
    "North Korea | KPW ₩",
    "North Macedonia | MKD ден",
    "Norway | NOK kr",
    "Oman | OMR ريال عماني",
    "Pakistan | PKR Rs.",
    "Palau | USD \$",
    "Panama | USD \$",
    "Papua New Guinea | PGK K",
    "Paraguay | PYG Gs.",
    "Peru | PEN S/.",
    "Philippines | PHP ₱",
    "Poland | PLN zł",
    "Portugal | EUR €",
    "Qatar | QAR ر.ق",
    "Romania | RON lei",
    "Russia | RUB ₽",
    "Rwanda | RWF Frw",
    "Saint Kitts and Nevis | XCD \$",
    "Saint Lucia | XCD \$",
    "Saint Vincent and the Grenadines | XCD \$",
    "Samoa | WST ៕",
    "San Marino | EUR €",
    "Sao Tome and Principe | STN Db",
    "Saudi Arabia | SAR ر.س",
    "Senegal | XOF CFA",
    "Serbia | RSD din.",
    "Seychelles | SCR SCR",
    "Sierra Leone | SLL Le",
    "Singapore | SGD \$",
    "Slovakia | EUR €",
    "Slovenia | EUR €",
    "Solomon Islands | SBD \$",
    "Somalia | SOS Sh. So.",
    "South Africa | ZAR R",
    "South Korea | KRW ₩",
    "South Sudan | SSP SSP",
    "Spain | EUR €",
    "Sri Lanka | LKR රු",
    "Sudan | SDG SDG",
    "Suriname | SRD \$",
    "Sweden | SEK kr",
    "Switzerland | CHF Fr",
    "Syria | SYP £S",
    "Tajikistan | TJS ₽",
    "Tanzania | TZS Tsh",
    "Thailand | THB ฿",
    "Timor-Leste | USD ",
    "Togo∣XOFCFA",
    "Tonga∣TOPT",
    "Trinidad and Tobago | TTD TT\$",
    "Tunisia | TND DT",
    "Turkey | TRY ₺",
    "Turkmenistan | TMT m",
    "Tuvalu | AUD \$",
    "Uganda | UGX UGX",
    "Ukraine | UAH ₴",
    "United Arab Emirates | AED AED",
    "United Kingdom | GBP £",
    "United States | USD \$",
    "Uruguay | UYU \$U",
    "Uzbekistan | UZS 🇺🇿",
    "Vanuatu | VUV VT",
    "Vatican City | EUR €",
    "Venezuela | VES Bs.",
    "Vietnam | VND ₫",
    "Yemen | YER ر.ي",
    "Zambia | ZMK ZMK",
    "Zimbabwe | ZWL \$",
  ];

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = countriesWithCurrency;
  }

  search(String query) {
    setState(() {
      filteredItems = countriesWithCurrency
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,

          hint: Text(
            'Select Region',
            style: TextStyle(
              color: widget.dropdownTextColor,
              fontSize: 14.sp,
            ),
          ),
          iconStyleData: IconStyleData(
              icon: Icon(
            widget.dropdownIcon,
            weight: 1,
            color: widget.dropdownIconColor,
          )),
          items: countriesWithCurrency
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        color: widget.dropdownTextColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,

          style: TextStyle(
            color: widget.dropdownTextColor,
            fontSize: 14.sp,
          ),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
          buttonStyleData: ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 50.w,
            width: 200.w,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 700.w,
          ),
          menuItemStyleData: MenuItemStyleData(
            height: 40.w,
          ),
          dropdownSearchData: DropdownSearchData(
            searchController: textEditingController,
            searchInnerWidgetHeight: 50.w,
            searchInnerWidget: Container(
              height: 50.w,
              padding: EdgeInsets.only(
                top: 8.w,
                bottom: 4.w,
                right: 8.w,
                left: 8.w,
              ),
              child: TextFormField(
                expands: true,
                maxLines: null,
                controller: textEditingController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.w,
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 14.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              return item.value.toString().contains(searchValue);
            },
          ),
          //This to clear the search value when you close the menu
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              textEditingController.clear();
            }
          },
        ),
      ),
    );
  }
}
