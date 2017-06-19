//
//  kTextField.swift
//  DriverCity
//
//  Created by Kavin Soni on 25/05/17.
//  Copyright © 2017 Kavin Soni. All rights reserved.
//

import UIKit



enum TextFieldValidationType : Int
{
    case none
    case name
    case email
    case password
    case numbers
    case OTP
    case characters
    case characters_WithSpace
    case alphaNumeric
    case alphaNumeric_WithSpace
    case alphaNumeric_WithSpace_SpecialCharacter
    case amountValidation
    case currency
    case minMaxNumber
}





class kTextField: UITextField, UITextFieldDelegate {
    
    //MARK:- Public Vars
    var textFieldValueChangeNotification:((Any?)->())?
    var bottomBorderWidth:CGFloat = 0.0
    var borderActiveColor = UIColor .appThemeBlueColor()//(UIApplication.shared.delegate as? AppDelegate)?.window?.tintColor ?? UIColor.appThemeBlueColor()
    var borderInActiveColor = UIColor .appThemeBlueColor()//UIColor(red: 136/255.0, green: 136/255.0, blue: 136/255.0, alpha: 1.0)
    fileprivate var btnDone:UIButton?

    //MARK:- Private Vars
    
    // UI Helper
    private let imgBottomBorder = UIImageView()
    private let lblPlaceholder:UILabel = UILabel()
    private let placeholderColor = UIColor .appBlackColor()//UIColor(red: 158/255.0, green: 158/255.0, blue: 158/255.0, alpha: 1.0)
    private let textFieldFont = UIFont .appMediumFont(WithSize: 16)//UIFont .systemFont(ofSize: UIFont.systemFontSize)//.systemFont(WithSize: UIFont.systemFontSize)
    private let contentPadding:CGFloat = 5.0
    
    
    // MARK:- Data Containers
    var maxCharacter:NSInteger = 60
    
    var validationType:TextFieldValidationType = TextFieldValidationType.none{
        didSet{
            // Notification When Validation Type Change
            switch validationType
            {
            case TextFieldValidationType.none:
                break;
            case TextFieldValidationType.name:
                break;
            case TextFieldValidationType.email:
                self.keyboardType = UIKeyboardType.emailAddress
                self.autocorrectionType = UITextAutocorrectionType.no
                break;
            case TextFieldValidationType.password:
                break;
                
            case TextFieldValidationType.numbers:
                self.keyboardType = UIKeyboardType.phonePad
                self.addDoneButtonAsInputAccessoryView()
                break;
            case TextFieldValidationType.OTP:
                self.keyboardType = UIKeyboardType.phonePad
                break;

            case TextFieldValidationType.currency:
                self.keyboardType = UIKeyboardType.decimalPad
                self.addDoneButtonAsInputAccessoryView()
                self.inputAccessoryView = btnDone
                break;
                
            case TextFieldValidationType.minMaxNumber:
                self.keyboardType = UIKeyboardType.decimalPad
                self.addDoneButtonAsInputAccessoryView()
                break;
            case TextFieldValidationType.characters:
                break;
            case TextFieldValidationType.alphaNumeric:
                break;
            case TextFieldValidationType.alphaNumeric_WithSpace:
                break;
            case TextFieldValidationType.amountValidation:
                self.addDoneButtonAsInputAccessoryView()
                self.keyboardType = UIKeyboardType.numberPad
                break
                
            default:
                break;
            }
        }
    }

    
    
    func addDoneButtonAsInputAccessoryView() -> Void {
        if btnDone == nil {
            btnDone = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 40))
            btnDone!.setTitle("Done", for: UIControlState.normal)
            btnDone!.titleLabel?.font = UIFont.appMediumFont(WithSize:18.0)
            btnDone!.backgroundColor = UIColor .appThemeBlueColor()
            btnDone!.setTitleColor(UIColor.white, for: UIControlState.normal)
//            btnDone!.layer.borderColor = UIColor.appGreenColor().cgColor
//            btnDone!.layer.borderWidth = 1
            btnDone?.addTarget(self, action: #selector(btnDone_Clicked(_:)), for: UIControlEvents.touchUpInside)
        }
        self.inputAccessoryView = btnDone
    }
    
    
    
    func btnDone_Clicked(_ sender:UIButton) -> Void {
        self.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let gmtTextFieldRef = textField as? kTextField{
            if range.location == 0 && range.length == 0 && string.isEqual(" ") {
                return false
            }
            
            if maxCharacter <= range.location {
                return false
            }
            // Get Validation Type From TextField
            let validationTypeRef:TextFieldValidationType
           // var maxCharacterLimit:NSInteger = 0
            
            validationTypeRef = gmtTextFieldRef.validationType
            //
            //        if textField.isKind(of:GMTTextField)
            //        {
            //            let textFieldRef:GMTTextField = textField as! GMTTextField
            //
            //        }
            // validationTypeRef = GMTTextField.TextFieldValidationType
            
            switch validationTypeRef  {
            case TextFieldValidationType.none:
                break
            case TextFieldValidationType.name:
                let aSet = CharacterSet.letters.inverted
                let compSepByCharInSet = string.components(separatedBy: aSet).filter{!$0.isEmpty}
                let numberFiltered = compSepByCharInSet.joined(separator: "")
                return string == numberFiltered
                
                break
            case TextFieldValidationType.email:
                let charactersToBlock = CharacterSet(charactersIn:"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@._").inverted
                let compSepByCharInSet =  string.components(separatedBy: charactersToBlock).filter{!$0.isEmpty}
                let numberFiltered = compSepByCharInSet.joined(separator: "")
                //  let resultingString = textField.text! as NSString
                let resultingString = (textField.text! as NSString).replacingCharacters(in: range, with: string) as NSString
                
                if resultingString.length>0 {
                    let firstChar:unichar = resultingString .character(at: 0)
                    let letters = CharacterSet(charactersIn:"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@._")
                    if letters.contains(UnicodeScalar(firstChar)!){
                        // if letters .contains(firstChar){
                        // if letters .characterIsMember(firstChar) {
                        
                    }else{
                        return false;
                    }
                }
                
                if resultingString.length>1 {
                    let lastChar1:unichar = resultingString .character(at: resultingString.length - 1)
                    let lastChar2:unichar = resultingString .character(at: resultingString.length - 2)
                    
                    let letter1 = CharacterSet(charactersIn:"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
                    if !letter1.contains(UnicodeScalar(lastChar1)!) && !letter1.contains(UnicodeScalar(lastChar2)!){
                        //if !letter1 .characterIsMember(lastChar1) && !letter1 .characterIsMember(lastChar2) {
                        return false;
                    }
                }
                return string == numberFiltered
                
            case TextFieldValidationType.password:
                
                break
            case TextFieldValidationType.numbers:
                let resultingString = (textField.text! as NSString).replacingCharacters(in: range, with: string) as NSString
                if resultingString.length > 0 {
                    
//                    let firstChar = resultingString.character(at: 0)
                    
                    //allow only first latter as +
                    if let stringValue:String = resultingString as String {
                        if stringValue.characters.count > 1 {
                            
                            let steChar = stringValue.characters.last
                            if steChar == "+"{
                                return false
                            }
                        }
                    }
                    
                    resultingString.hasPrefix("0")
                    
                    //             //NOT ALLOW FIRST CHARACTER AS 0
                    //             let strChar = Character(UnicodeScalar(firstChar))
                    if resultingString.hasPrefix("0") == true {
                        return false
                    }
                }
                if resultingString.length > 1 {
                    let lastChar1: unichar = resultingString.character(at: resultingString.length - 1)
                    let lastChar2: unichar = resultingString.character(at: resultingString.length - 2)
                    let letter1: CharacterSet = CharacterSet(charactersIn: "0123456789")
                    
                    if !letter1.contains(UnicodeScalar(lastChar1)!) && !letter1.contains(UnicodeScalar(lastChar2)!) {
                        // The first character is a letter in some alphabet
                        return false
                    }
                    else {
                        
                    }
                }
                let aSet = CharacterSet(charactersIn:"0123456789+-").inverted
                let compSepByCharInSet =  string.components(separatedBy: aSet).filter{!$0.isEmpty}
                let numberFiltered = compSepByCharInSet.joined(separator: "")
                
                return string == numberFiltered
                
            case TextFieldValidationType.OTP:
                let resultingString = (textField.text! as NSString).replacingCharacters(in: range, with: string) as NSString
                if resultingString.length > 0 {
                    
                    //                    let firstChar = resultingString.character(at: 0)
                    
                    //allow only first latter as +
                    if let stringValue:String = resultingString as String {
                        if stringValue.characters.count > 1 {
                            
                            let steChar = stringValue.characters.last
                            if steChar == "+"{
                                return false
                            }
                        }
                    }
                    
                    resultingString.hasPrefix("0")
                    
                    //             //NOT ALLOW FIRST CHARACTER AS 0
                    //             let strChar = Character(UnicodeScalar(firstChar))
                    if resultingString.hasPrefix("0") == true {
                        return false
                    }
                }
                if resultingString.length > 1 {
                    let lastChar1: unichar = resultingString.character(at: resultingString.length - 1)
                    let lastChar2: unichar = resultingString.character(at: resultingString.length - 2)
                    let letter1: CharacterSet = CharacterSet(charactersIn: "0123456789")
                    
                    if !letter1.contains(UnicodeScalar(lastChar1)!) && !letter1.contains(UnicodeScalar(lastChar2)!) {
                        // The first character is a letter in some alphabet
                        return false
                    }
                    else {
                        
                    }
                }
                let aSet = CharacterSet(charactersIn:"0123456789+-").inverted
                let compSepByCharInSet =  string.components(separatedBy: aSet).filter{!$0.isEmpty}
                let numberFiltered = compSepByCharInSet.joined(separator: "")
                
                return string == numberFiltered
            case TextFieldValidationType.characters:
                let aSet = CharacterSet.letters.inverted
                let compSepByCharInSet = string.components(separatedBy: aSet).filter{!$0.isEmpty}
                let numberFiltered = compSepByCharInSet.joined(separator: "")
                return string == numberFiltered
            case TextFieldValidationType.alphaNumeric:
                let aSet = CharacterSet.alphanumerics.inverted
                let compSepByCharInSet = string.components(separatedBy: aSet).filter{!$0.isEmpty}
                let numberFiltered = compSepByCharInSet.joined(separator: "")
                return string == numberFiltered
            case TextFieldValidationType.alphaNumeric_WithSpace:
                let aSet = CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ").inverted
                let compSepByCharInSet =  string.components(separatedBy: aSet).filter{!$0.isEmpty}
                let numberFiltered = compSepByCharInSet.joined(separator: "")
                return string == numberFiltered
            case TextFieldValidationType.characters_WithSpace:
                let aSet = CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ").inverted
                let compSepByCharInSet = string.components(separatedBy: aSet).filter{!$0.isEmpty}
                let numberFiltered = compSepByCharInSet.joined(separator: "")
                return string == numberFiltered
                
            case TextFieldValidationType.alphaNumeric_WithSpace_SpecialCharacter:
                let aSet = CharacterSet(charactersIn:" abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789~!@#$%^&*()_+|{}:>?/.,;'[]=-`'\\\"").inverted
                let compSepByCharInSet =  string.components(separatedBy: aSet).filter{!$0.isEmpty}
                let numberFiltered = compSepByCharInSet.joined(separator: "")
                return string == numberFiltered
                
            case TextFieldValidationType.amountValidation:
                break;
                
            case TextFieldValidationType.currency:
                if (textField.text? .contains("0"))! && string == "0" {
                    return false
                }
                
                let aSet = CharacterSet(charactersIn:"1234567890.").inverted
                let compSepByCharInSet =  string.components(separatedBy: aSet).filter{!$0.isEmpty}
                let numberFiltered = compSepByCharInSet.joined(separator: "")
                return string == numberFiltered
            case TextFieldValidationType.minMaxNumber:
                
                let aSet = CharacterSet(charactersIn:"1234567890").inverted
                let compSepByCharInSet =  string.components(separatedBy: aSet).filter{!$0.isEmpty}
                let numberFiltered = compSepByCharInSet.joined(separator: "")
                return string == numberFiltered
                
            }
            return true
        }else{
            return true
        }
    }
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        return textField.resignFirstResponder()
    }
    

    
    
    // Override Existing Vars
    override var placeholder: String?{
        didSet{
            if let newPlaceHolder = self.placeholder{
                if newPlaceHolder.characters.count > 0 {
                    self.placeholder = ""
                    self.lblPlaceholder.text = newPlaceHolder
                    self.lblPlaceholder.font = UIFont .appMediumFont(WithSize: 12)
                
                }
            }
        }
    }
    
    //MARK:- Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func addImageAtRightCorner(_ imgRightImage:UIImage?, ShouldShowWhenValidValue shouldShowWhenValidValue:Bool) -> Void {
        if imgRightImage == nil{
            self.rightView = nil
            self.rightViewMode = UITextFieldViewMode.never
        }else{
            let imgRightView = UIImageView(image: imgRightImage)
            imgRightView.frame = CGRect(x: 0, y: 0, width: 44.0, height: self.bounds.size.height)
            imgRightView.contentMode = UIViewContentMode.right
            self.rightView = imgRightView
            self.rightViewMode = UITextFieldViewMode.never
        }
    }
    
    //MARK:- Private Helper Methods
    fileprivate func commonInit()->(){
        
        // Delegate
        self.delegate = self
        
        // Set font
        self.font = textFieldFont
        
        // Tint Color
        self.tintColor = self.borderActiveColor
        
        // Text Color
        self.textColor = UIColor.black
        
        // Update Border Style to None
        self.borderStyle = UITextBorderStyle.none
        
        // Background Color
        self.backgroundColor = UIColor.white
        
        // Value Change Method
        self.addTarget(self, action: #selector(kTextField.textFieldValueChangeMethod(_:)) , for: UIControlEvents.editingChanged)
        
        // Add Bottom Border
       // imgBottomBorder.frame = CGRect.init(x: 0.0, y: self.bounds.size.height-bottomBorderWidth, width: self.bounds.size.width, height: bottomBorderWidth)
//        imgBottomBorder.backgroundColor = UIColor.clear
       // imgBottomBorder.layer.backgroundColor = borderInActiveColor.cgColor
//        imgBottomBorder.autoresizingMask = [.flexibleWidth,.flexibleBottomMargin,.flexibleLeftMargin,.flexibleRightMargin]
//        imgBottomBorder.translatesAutoresizingMaskIntoConstraints = true
//        self.addSubview(imgBottomBorder)
        
        //  Update Placeholde Style
        self.updatePlaceholderStyle()
        
//        if let strValue = sender.text{
//            if strValue.characters.count > 0{
//                self.rightViewMode = UITextFieldViewMode.always
//            }else{
//                self.rightViewMode = UITextFieldViewMode.never
//            }
//        }
        self.updatePlaceholderPosition(WithAnimation: false)
        
    }
    
    // Update Placeholder Style
     func updatePlaceholderStyle()->(){
        if (self.placeholder?.characters.count ?? 0) > 0{
            self.lblPlaceholder.text = self.placeholder
            self.placeholder = ""
        }
        self.lblPlaceholder.font = self.font ?? UIFont.systemFont(ofSize:UIFont.systemFontSize)
        self.lblPlaceholder.textColor = UIColor.green
        self.addSubview(self.lblPlaceholder)
        self.updatePlaceholderPosition(WithAnimation: false)
    }
    
     func updatePlaceholderPosition(WithAnimation withAnimation:Bool)->Void{
        if withAnimation == true{
            UIView.animate(withDuration: 0.25) {
                if (self.text?.characters.count ?? 0) > 0{
                    self.lblPlaceholder.frame = CGRect.init(x: 0, y: (self.contentPadding/2), width: self.bounds.size.width, height: (self.bounds.size.height/4))
                    self.lblPlaceholder.font = self.font?.withSize(UIFont.smallSystemFontSize) ?? UIFont.systemFont(ofSize:UIFont.smallSystemFontSize)
                    self.lblPlaceholder.textColor = UIColor .appGrayColor()//self.tintColor
                    
                }else{
                    self.lblPlaceholder.frame = CGRect.init(x: 0, y: (self.contentPadding/2), width: self.bounds.size.width, height: (self.bounds.size.height))
                    self.lblPlaceholder.font = self.font ?? UIFont.systemFont(ofSize:UIFont.systemFontSize)
                    self.lblPlaceholder.textColor = UIColor.appGrayColor()
                }
            }
        }else{
            if (self.text?.characters.count ?? 0) > 0{
                self.lblPlaceholder.frame = CGRect.init(x: 0, y: self.contentPadding, width: self.bounds.size.width, height: (self.bounds.size.height/4))
                self.lblPlaceholder.font = self.font?.withSize(UIFont.smallSystemFontSize) ?? UIFont.systemFont(ofSize:UIFont.smallSystemFontSize)
                self.lblPlaceholder.textColor = self.tintColor
                
            }else{
                self.lblPlaceholder.frame = CGRect.init(x: 0, y:  self.contentPadding, width: self.bounds.size.width, height: (self.bounds.size.height))
                self.lblPlaceholder.font = self.font ?? UIFont.systemFont(ofSize:UIFont.systemFontSize)
                self.lblPlaceholder.textColor = UIColor.appGrayColor()
            }
        }
    }
    

    
    // When Text Change This Method will be called
    func textFieldValueChangeMethod(_ sender:UITextField) -> Void {
        self.sendValueChangeNotification(sender.text)
        
        if let strValue = sender.text{
            if strValue.characters.count > 0{
                self.rightViewMode = UITextFieldViewMode.always
            }else{
                self.rightViewMode = UITextFieldViewMode.never
            }
        }
        self.updatePlaceholderPosition(WithAnimation: true)
    }
    
    // Send Notification From Anywhere Using this Method
    fileprivate func sendValueChangeNotification(_ value:Any?) -> (){
        if let valueChangeNotificationValue = textFieldValueChangeNotification{
            valueChangeNotificationValue(value)
        }
    }
    
    //MARK:- Content Position
    override func textRect(forBounds bounds:CGRect) -> CGRect {
        return CGRect(x:bounds.origin.x, y: contentPadding,width: bounds.size.width, height: bounds.size.height).insetBy(dx: 0, dy: 0);
    }
    override func editingRect(forBounds bounds:CGRect) -> CGRect {
        return bounds.insetBy(dx: 0, dy: contentPadding);
    }
    
    //MARK:- Delegate Methods
   
    func textFieldDidBeginEditing(_ textField: UITextField)  {
        UIView.animate(withDuration: 0.25, animations:{
            self.imgBottomBorder.layer.backgroundColor = self.borderActiveColor.cgColor
            self.imgBottomBorder.frame = CGRect.init(x: 0.0, y: self.bounds.size.height-(self.bottomBorderWidth+1.0), width: self.bounds.size.width, height: self.bottomBorderWidth+1.0)
        })
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.15, animations:{
            self.imgBottomBorder.layer.backgroundColor = self.borderInActiveColor.cgColor
            self.imgBottomBorder.frame = CGRect.init(x: 0.0, y: self.bounds.size.height-self.bottomBorderWidth, width: self.bounds.size.width, height: self.bottomBorderWidth)
        })
    }
    
    //   let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
    
    //    override func textRect(forBounds bounds: CGRect) -> CGRect {
    //        return UIEdgeInsetsInsetRect(bounds, padding)
    //    }
    //
    //    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    //        return UIEdgeInsetsInsetRect(bounds, padding)
    //    }
    //
    //    override func editingRect(forBounds bounds: CGRect) -> CGRect {
    //        return UIEdgeInsetsInsetRect(bounds, padding)
    //    }
    
    
    
}
