class StoreData {
//  Acts as a db to store the food name and price

  StoreData._privateConstructor();

  static final StoreData _instance = StoreData._privateConstructor();

  factory StoreData() {
    return _instance;
  }

  Map<dynamic, dynamic> _pwaVariables = Map<dynamic, dynamic>();
  Map<dynamic, dynamic> _citizenDetailVeriable = Map<dynamic, dynamic>();
  Map<dynamic, dynamic> _tentativeExitTimeVariable = Map<dynamic, dynamic>();
  Map<String, dynamic> _emaileData = Map<String, dynamic>();
  Map<String, dynamic> _pwaSettings = Map<String, dynamic>();
  String _tokenId;
  bool _dynamicPricingSlabType;
  String sourceType;




  // *************************PwaVeriable*******************************
  void eventDetail(
      {Map<dynamic, dynamic> pwaVariable}) {
    _pwaVariables.addAll(pwaVariable);
    print(_pwaVariables);
  }

  Map<dynamic, dynamic> fetchEventDetail() {
    return _pwaVariables;
  }

  void removePwaVariable() {
    _pwaVariables.clear();
  }

  // ********************************************************








  // ***************************Source Type*****************************
  void storeSourcetype({String source}) {
    sourceType = source;
  }

  String retriveSourcetype() {
    return sourceType;
  }

  // *********************************************************************

  // ***************************PAW Settings*****************************
  void storePwaSettings(Map<String, dynamic> emailVariables) {
    _pwaSettings = emailVariables;
  }

  Map<String, dynamic> retrivePwaSettings() {
    return _pwaSettings;
  }

// **********************************************************************

  // ***************************EmailVariable*****************************
  void storeEmailVariable(Map<String, dynamic> emailVariables) {
    _emaileData = emailVariables;
  }

  Map<String, dynamic> retriveEmailVariable() {
    return _emaileData;
  }

// ********************************************************

  // ***************************dynamicPricingSlabType*****************************
  void storeTypeOfParkingCharges({bool variable}) {
    _dynamicPricingSlabType = variable;
  }

  bool retriveTypeOfParkingCharges() {
    return _dynamicPricingSlabType;
  }

// ********************************************************

  // ************************FirebasAuthtoken********************************
  void storeFirebasAuthtoken({String variable}) {
    _tokenId = variable;
  }

  String retriveFirebasAuthtoken() {
    return _tokenId;
  }

// ********************************************************



  // ***********************CitizenVeriable*********************************
  void storeCitizenVeriable({Map<dynamic, dynamic> citizenVariable}) {
    _citizenDetailVeriable.addAll(citizenVariable);

  }

  Map<String, dynamic> retrieveCitizenVariable() {

    return _citizenDetailVeriable;
  }

  void removeCitizenVariable() {
    _citizenDetailVeriable.clear();
  }

// ********************************************************

  // ********************ExitTimeValue************************************
  void storeExitTimeValue({Map<dynamic, dynamic> exitTimeVariable}) {
    _tentativeExitTimeVariable.addAll(exitTimeVariable);

  }

  Map<String, dynamic> retrieveExitTimeValue() {
    return _tentativeExitTimeVariable;
  }

  void removeExitTimeVariable(String variable) {
    _tentativeExitTimeVariable.remove(variable);
  }
// ********************************************************

}