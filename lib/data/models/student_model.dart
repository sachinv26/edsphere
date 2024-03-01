class PostAuthenticateUserResp {
  List<MenuDetail>? menuDetail;
  List<PaymentPlan>? paymentPlan;
  ClientProfile? clientProfile;
  StudentBasic? studentBasic;
  StudentFamily? studentFamily;
  StudentOther? studentOther;
  AppSetting? appSetting;
  List<NotificationCount>? notificationCount;
  Token? token;

  PostAuthenticateUserResp(
      {this.menuDetail,
        this.paymentPlan,
        this.clientProfile,
        this.studentBasic,
        this.studentFamily,
        this.studentOther,
        this.appSetting,
        this.notificationCount,
        this.token});

  PostAuthenticateUserResp.fromJson(Map<String, dynamic> json) {
    if (json['menuDetail'] != null) {
      menuDetail = <MenuDetail>[];
      json['menuDetail'].forEach((v) {
        menuDetail?.add(MenuDetail.fromJson(v));
      });
    }
    if (json['paymentPlan'] != null) {
      paymentPlan = <PaymentPlan>[];
      json['paymentPlan'].forEach((v) {
        paymentPlan?.add(PaymentPlan.fromJson(v));
      });
    }
    clientProfile = json['clientProfile'] != null
        ? ClientProfile.fromJson(json['clientProfile'])
        : null;
    studentBasic = json['studentBasic'] != null
        ? StudentBasic.fromJson(json['studentBasic'])
        : null;
    studentFamily = json['studentFamily'] != null
        ? StudentFamily.fromJson(json['studentFamily'])
        : null;
    studentOther = json['studentOther'] != null
        ? StudentOther.fromJson(json['studentOther'])
        : null;
    appSetting = json['appSetting'] != null
        ? AppSetting.fromJson(json['appSetting'])
        : null;
    if (json['notificationCount'] != null) {
      notificationCount = <NotificationCount>[];
      json['notificationCount'].forEach((v) {
        notificationCount?.add(NotificationCount.fromJson(v));
      });
    }
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (menuDetail != null) {
      data['menuDetail'] = menuDetail?.map((v) => v.toJson()).toList();
    }
    if (paymentPlan != null) {
      data['paymentPlan'] = paymentPlan?.map((v) => v.toJson()).toList();
    }
    if (clientProfile != null) {
      data['clientProfile'] = clientProfile?.toJson();
    }
    if (studentBasic != null) {
      data['studentBasic'] = studentBasic?.toJson();
    }
    if (studentFamily != null) {
      data['studentFamily'] = studentFamily?.toJson();
    }
    if (studentOther != null) {
      data['studentOther'] = studentOther?.toJson();
    }
    if (appSetting != null) {
      data['appSetting'] = appSetting?.toJson();
    }
    if (notificationCount != null) {
      data['notificationCount'] =
          notificationCount?.map((v) => v.toJson()).toList();
    }
    if (token != null) {
      data['token'] = token?.toJson();
    }
    return data;
  }
}

class MenuDetail {
  String? schoolCode;
  String? menuName;
  bool? isWebPage;
  bool? isDashboardMenu;
  String? webPageURL;
  String? paymentCategory;

  MenuDetail(
      {this.schoolCode,
        this.menuName,
        this.isWebPage,
        this.isDashboardMenu,
        this.webPageURL,
        this.paymentCategory});

  MenuDetail.fromJson(Map<String, dynamic> json) {
    schoolCode = json['schoolCode'];
    menuName = json['menuName'];
    isWebPage = json['isWebPage'];
    isDashboardMenu = json['isDashboardMenu'];
    webPageURL = json['webPageURL'];
    paymentCategory = json['paymentCategory'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (schoolCode != null) {
      data['schoolCode'] = schoolCode;
    }
    if (menuName != null) {
      data['menuName'] = menuName;
    }
    if (isWebPage != null) {
      data['isWebPage'] = isWebPage;
    }
    if (isDashboardMenu != null) {
      data['isDashboardMenu'] = isDashboardMenu;
    }
    if (webPageURL != null) {
      data['webPageURL'] = webPageURL;
    }
    if (paymentCategory != null) {
      data['paymentCategory'] = paymentCategory;
    }
    return data;
  }
}

class PaymentPlan {
  String? schoolCode;
  String? paymentCategory;
  int? paymentAmount;
  bool? paidByStudent;

  PaymentPlan(
      {this.schoolCode,
        this.paymentCategory,
        this.paymentAmount,
        this.paidByStudent});

  PaymentPlan.fromJson(Map<String, dynamic> json) {
    schoolCode = json['schoolCode'];
    paymentCategory = json['paymentCategory'];
    paymentAmount = json['paymentAmount'];
    paidByStudent = json['paidByStudent'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (schoolCode != null) {
      data['schoolCode'] = schoolCode;
    }
    if (paymentCategory != null) {
      data['paymentCategory'] = paymentCategory;
    }
    if (paymentAmount != null) {
      data['paymentAmount'] = paymentAmount;
    }
    if (paidByStudent != null) {
      data['paidByStudent'] = paidByStudent;
    }
    return data;
  }
}

class ClientProfile {
  String? title1;
  String? address1;
  String? contact1;
  String? contact2;
  dynamic website;
  dynamic email;
  String? logo1;
  String? logo2;

  ClientProfile(
      {this.title1,
        this.address1,
        this.contact1,
        this.contact2,
        this.website,
        this.email,
        this.logo1,
        this.logo2});

  ClientProfile.fromJson(Map<String, dynamic> json) {
    title1 = json['title1'];
    address1 = json['address1'];
    contact1 = json['contact1'];
    contact2 = json['contact2'];
    website = json['website'];
    email = json['email'];
    logo1 = json['logo1'];
    logo2 = json['logo2'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (title1 != null) {
      data['title1'] = title1;
    }
    if (address1 != null) {
      data['address1'] = address1;
    }
    if (contact1 != null) {
      data['contact1'] = contact1;
    }
    if (contact2 != null) {
      data['contact2'] = contact2;
    }
    if (website != null) {
      data['website'] = website;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (logo1 != null) {
      data['logo1'] = logo1;
    }
    if (logo2 != null) {
      data['logo2'] = logo2;
    }
    return data;
  }
}

class StudentBasic {
  String? admsnNo;
  String? schoolCode;
  String? studentNo;
  String? srNo;
  String? rollNo;
  String? kclass;
  String? section;
  String? firstName;
  String? lastName;
  String? gender;
  String? dob;
  String? category;
  String? religion;
  String? caste;
  String? mobile;
  String? whatsAppNum;
  String? email;
  String? admsnDate;
  String? photo;
  String? bloodGroup;
  String? house;
  String? height;
  String? weight;
  String? asOnDt;
  String? siblingRef;
  String? siblingRef2;
  String? discountCategory;
  String? discountNote;
  String? loginPwd;
  String? oldBalance;
  String? feeCategory;
  String? active;
  String? enquiryData;
  String? sendSMS;
  String? userId;
  String? entryDate;

  StudentBasic(
      {this.admsnNo,
        this.schoolCode,
        this.studentNo,
        this.srNo,
        this.rollNo,
        this.kclass,
        this.section,
        this.firstName,
        this.lastName,
        this.gender,
        this.dob,
        this.category,
        this.religion,
        this.caste,
        this.mobile,
        this.whatsAppNum,
        this.email,
        this.admsnDate,
        this.photo,
        this.bloodGroup,
        this.house,
        this.height,
        this.weight,
        this.asOnDt,
        this.siblingRef,
        this.siblingRef2,
        this.discountCategory,
        this.discountNote,
        this.loginPwd,
        this.oldBalance,
        this.feeCategory,
        this.active,
        this.enquiryData,
        this.sendSMS,
        this.userId,
        this.entryDate});

  StudentBasic.fromJson(Map<String, dynamic> json) {
    admsnNo = json['admsnNo'];
    schoolCode = json['schoolCode'];
    studentNo = json['studentNo'];
    srNo = json['srNo'];
    rollNo = json['rollNo'];
    kclass = json['class'];
    section = json['section'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    dob = json['dob'];
    category = json['category'];
    religion = json['religion'];
    caste = json['caste'];
    mobile = json['mobile'];
    whatsAppNum = json['whatsAppNum'];
    email = json['email'];
    admsnDate = json['admsnDate'];
    photo = json['photo'];
    bloodGroup = json['bloodGroup'];
    house = json['house'];
    height = json['height'];
    weight = json['weight'];
    asOnDt = json['asOnDt'];
    siblingRef = json['siblingRef'];
    siblingRef2 = json['siblingRef2'];
    discountCategory = json['discountCategory'];
    discountNote = json['discountNote'];
    loginPwd = json['loginPwd'];
    oldBalance = json['oldBalance'];
    feeCategory = json['feeCategory'];
    active = json['active'];
    enquiryData = json['enquiryData'];
    sendSMS = json['sendSMS'];
    userId = json['userId'];
    entryDate = json['entryDate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (admsnNo != null) {
      data['admsnNo'] = admsnNo;
    }
    if (schoolCode != null) {
      data['schoolCode'] = schoolCode;
    }
    if (studentNo != null) {
      data['studentNo'] = studentNo;
    }
    if (srNo != null) {
      data['srNo'] = srNo;
    }
    if (rollNo != null) {
      data['rollNo'] = rollNo;
    }
    if (kclass != null) {
      data['class'] = kclass;
    }
    if (section != null) {
      data['section'] = section;
    }
    if (firstName != null) {
      data['firstName'] = firstName;
    }
    if (lastName != null) {
      data['lastName'] = lastName;
    }
    if (gender != null) {
      data['gender'] = gender;
    }
    if (dob != null) {
      data['dob'] = dob;
    }
    if (category != null) {
      data['category'] = category;
    }
    if (religion != null) {
      data['religion'] = religion;
    }
    if (caste != null) {
      data['caste'] = caste;
    }
    if (mobile != null) {
      data['mobile'] = mobile;
    }
    if (whatsAppNum != null) {
      data['whatsAppNum'] = whatsAppNum;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (admsnDate != null) {
      data['admsnDate'] = admsnDate;
    }
    if (photo != null) {
      data['photo'] = photo;
    }
    if (bloodGroup != null) {
      data['bloodGroup'] = bloodGroup;
    }
    if (house != null) {
      data['house'] = house;
    }
    if (height != null) {
      data['height'] = height;
    }
    if (weight != null) {
      data['weight'] = weight;
    }
    if (asOnDt != null) {
      data['asOnDt'] = asOnDt;
    }
    if (siblingRef != null) {
      data['siblingRef'] = siblingRef;
    }
    if (siblingRef2 != null) {
      data['siblingRef2'] = siblingRef2;
    }
    if (discountCategory != null) {
      data['discountCategory'] = discountCategory;
    }
    if (discountNote != null) {
      data['discountNote'] = discountNote;
    }
    if (loginPwd != null) {
      data['loginPwd'] = loginPwd;
    }
    if (oldBalance != null) {
      data['oldBalance'] = oldBalance;
    }
    if (feeCategory != null) {
      data['feeCategory'] = feeCategory;
    }
    if (active != null) {
      data['active'] = active;
    }
    if (enquiryData != null) {
      data['enquiryData'] = enquiryData;
    }
    if (sendSMS != null) {
      data['sendSMS'] = sendSMS;
    }
    if (userId != null) {
      data['userId'] = userId;
    }
    if (entryDate != null) {
      data['entryDate'] = entryDate;
    }
    return data;
  }
}

class StudentFamily {
  String? admsnNo;
  String? schoolCode;
  String? fName;
  dynamic fPhone;
  dynamic fOccupation;
  dynamic fAadhar;
  String? fNote;
  String? fPhoto;
  String? mName;
  dynamic mPhone;
  dynamic mOccupation;
  dynamic mAadhar;
  dynamic mNote;
  String? mPhoto;
  dynamic gName;
  dynamic gRelation;
  dynamic gEmail;
  String? gPhoto;
  dynamic gPhone;
  dynamic gOccupation;
  dynamic gAddress;
  dynamic gRemark;
  dynamic stCurrentAddress;
  dynamic stPermanentAddress;
  String? route;
  dynamic hostelDetail;
  String? hostelNo;

  StudentFamily(
      {this.admsnNo,
        this.schoolCode,
        this.fName,
        this.fPhone,
        this.fOccupation,
        this.fAadhar,
        this.fNote,
        this.fPhoto,
        this.mName,
        this.mPhone,
        this.mOccupation,
        this.mAadhar,
        this.mNote,
        this.mPhoto,
        this.gName,
        this.gRelation,
        this.gEmail,
        this.gPhoto,
        this.gPhone,
        this.gOccupation,
        this.gAddress,
        this.gRemark,
        this.stCurrentAddress,
        this.stPermanentAddress,
        this.route,
        this.hostelDetail,
        this.hostelNo});

  StudentFamily.fromJson(Map<String, dynamic> json) {
    admsnNo = json['admsnNo'];
    schoolCode = json['schoolCode'];
    fName = json['fName'];
    fPhone = json['fPhone'];
    fOccupation = json['fOccupation'];
    fAadhar = json['fAadhar'];
    fNote = json['fNote'];
    fPhoto = json['fPhoto'];
    mName = json['mName'];
    mPhone = json['mPhone'];
    mOccupation = json['mOccupation'];
    mAadhar = json['mAadhar'];
    mNote = json['mNote'];
    mPhoto = json['mPhoto'];
    gName = json['gName'];
    gRelation = json['gRelation'];
    gEmail = json['gEmail'];
    gPhoto = json['gPhoto'];
    gPhone = json['gPhone'];
    gOccupation = json['gOccupation'];
    gAddress = json['gAddress'];
    gRemark = json['gRemark'];
    stCurrentAddress = json['stCurrentAddress'];
    stPermanentAddress = json['stPermanentAddress'];
    route = json['route'];
    hostelDetail = json['hostelDetail'];
    hostelNo = json['hostelNo'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (admsnNo != null) {
      data['admsnNo'] = admsnNo;
    }
    if (schoolCode != null) {
      data['schoolCode'] = schoolCode;
    }
    if (fName != null) {
      data['fName'] = fName;
    }
    if (fPhone != null) {
      data['fPhone'] = fPhone;
    }
    if (fOccupation != null) {
      data['fOccupation'] = fOccupation;
    }
    if (fAadhar != null) {
      data['fAadhar'] = fAadhar;
    }
    if (fNote != null) {
      data['fNote'] = fNote;
    }
    if (fPhoto != null) {
      data['fPhoto'] = fPhoto;
    }
    if (mName != null) {
      data['mName'] = mName;
    }
    if (mPhone != null) {
      data['mPhone'] = mPhone;
    }
    if (mOccupation != null) {
      data['mOccupation'] = mOccupation;
    }
    if (mAadhar != null) {
      data['mAadhar'] = mAadhar;
    }
    if (mNote != null) {
      data['mNote'] = mNote;
    }
    if (mPhoto != null) {
      data['mPhoto'] = mPhoto;
    }
    if (gName != null) {
      data['gName'] = gName;
    }
    if (gRelation != null) {
      data['gRelation'] = gRelation;
    }
    if (gEmail != null) {
      data['gEmail'] = gEmail;
    }
    if (gPhoto != null) {
      data['gPhoto'] = gPhoto;
    }
    if (gPhone != null) {
      data['gPhone'] = gPhone;
    }
    if (gOccupation != null) {
      data['gOccupation'] = gOccupation;
    }
    if (gAddress != null) {
      data['gAddress'] = gAddress;
    }
    if (gRemark != null) {
      data['gRemark'] = gRemark;
    }
    if (stCurrentAddress != null) {
      data['stCurrentAddress'] = stCurrentAddress;
    }
    if (stPermanentAddress != null) {
      data['stPermanentAddress'] = stPermanentAddress;
    }
    if (route != null) {
      data['route'] = route;
    }
    if (hostelDetail != null) {
      data['hostelDetail'] = hostelDetail;
    }
    if (hostelNo != null) {
      data['hostelNo'] = hostelNo;
    }
    return data;
  }
}

class StudentOther {
  String? admsnNo;
  String? schoolCode;
  dynamic bankAcNo;
  dynamic bankName;
  dynamic ifscCode;
  dynamic nadid;
  dynamic iDentityLocal;
  dynamic identityOther;
  dynamic previousSchoolDtl;
  dynamic note;
  String? uploadTitle1;
  String? upldPath1;
  String? uploadTitle2;
  String? upldPath2;
  String? uploadTitle3;
  String? upldPath3;
  String? uploadTitle4;
  String? upldPath4;
  String? uploadTitle5;
  String? upldPath5;
  String? uploadTitle6;
  String? upldPath6;

  StudentOther(
      {this.admsnNo,
        this.schoolCode,
        this.bankAcNo,
        this.bankName,
        this.ifscCode,
        this.nadid,
        this.iDentityLocal,
        this.identityOther,
        this.previousSchoolDtl,
        this.note,
        this.uploadTitle1,
        this.upldPath1,
        this.uploadTitle2,
        this.upldPath2,
        this.uploadTitle3,
        this.upldPath3,
        this.uploadTitle4,
        this.upldPath4,
        this.uploadTitle5,
        this.upldPath5,
        this.uploadTitle6,
        this.upldPath6});

  StudentOther.fromJson(Map<String, dynamic> json) {
    admsnNo = json['admsnNo'];
    schoolCode = json['schoolCode'];
    bankAcNo = json['bankAcNo'];
    bankName = json['bankName'];
    ifscCode = json['ifscCode'];
    nadid = json['nadid'];
    iDentityLocal = json['iDentityLocal'];
    identityOther = json['identityOther'];
    previousSchoolDtl = json['previousSchoolDtl'];
    note = json['note'];
    uploadTitle1 = json['uploadTitle1'];
    upldPath1 = json['upldPath1'];
    uploadTitle2 = json['uploadTitle2'];
    upldPath2 = json['upldPath2'];
    uploadTitle3 = json['uploadTitle3'];
    upldPath3 = json['upldPath3'];
    uploadTitle4 = json['uploadTitle4'];
    upldPath4 = json['upldPath4'];
    uploadTitle5 = json['uploadTitle5'];
    upldPath5 = json['upldPath5'];
    uploadTitle6 = json['uploadTitle6'];
    upldPath6 = json['upldPath6'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (admsnNo != null) {
      data['admsnNo'] = admsnNo;
    }
    if (schoolCode != null) {
      data['schoolCode'] = schoolCode;
    }
    if (bankAcNo != null) {
      data['bankAcNo'] = bankAcNo;
    }
    if (bankName != null) {
      data['bankName'] = bankName;
    }
    if (ifscCode != null) {
      data['ifscCode'] = ifscCode;
    }
    if (nadid != null) {
      data['nadid'] = nadid;
    }
    if (iDentityLocal != null) {
      data['iDentityLocal'] = iDentityLocal;
    }
    if (identityOther != null) {
      data['identityOther'] = identityOther;
    }
    if (previousSchoolDtl != null) {
      data['previousSchoolDtl'] = previousSchoolDtl;
    }
    if (note != null) {
      data['note'] = note;
    }
    if (uploadTitle1 != null) {
      data['uploadTitle1'] = uploadTitle1;
    }
    if (upldPath1 != null) {
      data['upldPath1'] = upldPath1;
    }
    if (uploadTitle2 != null) {
      data['uploadTitle2'] = uploadTitle2;
    }
    if (upldPath2 != null) {
      data['upldPath2'] = upldPath2;
    }
    if (uploadTitle3 != null) {
      data['uploadTitle3'] = uploadTitle3;
    }
    if (upldPath3 != null) {
      data['upldPath3'] = upldPath3;
    }
    if (uploadTitle4 != null) {
      data['uploadTitle4'] = uploadTitle4;
    }
    if (upldPath4 != null) {
      data['upldPath4'] = upldPath4;
    }
    if (uploadTitle5 != null) {
      data['uploadTitle5'] = uploadTitle5;
    }
    if (upldPath5 != null) {
      data['upldPath5'] = upldPath5;
    }
    if (uploadTitle6 != null) {
      data['uploadTitle6'] = uploadTitle6;
    }
    if (upldPath6 != null) {
      data['upldPath6'] = upldPath6;
    }
    return data;
  }
}

class AppSetting {
  String? schoolCode;
  String? key1;
  String? key2;
  String? key3;
  String? key4;
  String? key5;
  String? key6;
  String? key7;
  String? key8;
  String? key9;
  String? img1;
  String? img2;
  String? img3;

  AppSetting(
      {this.schoolCode,
        this.key1,
        this.key2,
        this.key3,
        this.key4,
        this.key5,
        this.key6,
        this.key7,
        this.key8,
        this.key9,
        this.img1,
        this.img2,
        this.img3});

  AppSetting.fromJson(Map<String, dynamic> json) {
    schoolCode = json['schoolCode'];
    key1 = json['key1'];
    key2 = json['key2'];
    key3 = json['key3'];
    key4 = json['key4'];
    key5 = json['key5'];
    key6 = json['key6'];
    key7 = json['key7'];
    key8 = json['key8'];
    key9 = json['key9'];
    img1 = json['img1'];
    img2 = json['img2'];
    img3 = json['img3'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (schoolCode != null) {
      data['schoolCode'] = schoolCode;
    }
    if (key1 != null) {
      data['key1'] = key1;
    }
    if (key2 != null) {
      data['key2'] = key2;
    }
    if (key3 != null) {
      data['key3'] = key3;
    }
    if (key4 != null) {
      data['key4'] = key4;
    }
    if (key5 != null) {
      data['key5'] = key5;
    }
    if (key6 != null) {
      data['key6'] = key6;
    }
    if (key7 != null) {
      data['key7'] = key7;
    }
    if (key8 != null) {
      data['key8'] = key8;
    }
    if (key9 != null) {
      data['key9'] = key9;
    }
    if (img1 != null) {
      data['img1'] = img1;
    }
    if (img2 != null) {
      data['img2'] = img2;
    }
    if (img3 != null) {
      data['img3'] = img3;
    }
    return data;
  }
}

class NotificationCount {
  String? notification;
  String? birthDay;

  NotificationCount({this.notification, this.birthDay});

  NotificationCount.fromJson(Map<String, dynamic> json) {
    notification = json['notification'];
    birthDay = json['birthDay'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (notification != null) {
      data['notification'] = notification;
    }
    if (birthDay != null) {
      data['birthDay'] = birthDay;
    }
    return data;
  }
}

class Token {
  String? token;
  dynamic refreshToken;

  Token({this.token, this.refreshToken});

  Token.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (token != null) {
      data['token'] = token;
    }
    if (refreshToken != null) {
      data['refreshToken'] = refreshToken;
    }
    return data;
  }
}
