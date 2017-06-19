//
//  AppExtension.swift
//
//  Created by Kavin Soni on 13/12/16.
//  Copyright © 2016 CodeAndCore Pvt.Ltd. All rights reserved.
//

import Foundation
import UIKit
import Photos

extension CALayer {
     
    
    func addGradientBackground(WithColors color:[UIColor]) -> Void {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect.init(origin: CGPoint.zero, size: self.bounds.size)
        gradientLayer.colors = color.map({$0.cgColor})
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        self.addSublayer(gradientLayer)
    }
    func addRoundGradientBackground(WithColors color:[UIColor]) -> Void {
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = self.bounds.size.width/2
        gradientLayer.frame = CGRect.init(origin: CGPoint.zero, size: self.bounds.size)
        gradientLayer.colors = color.map({$0.cgColor})
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)

        let roundRect = CALayer()
        roundRect.frame = self.bounds
        roundRect.cornerRadius = self.bounds.size.height/2.0
        roundRect.masksToBounds = true
        roundRect.addSublayer(gradientLayer)
        gradientLayer.mask = roundRect
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.bounds.size.height).cgPath
        shapeLayer.fillColor = nil
        shapeLayer.cornerRadius = self.bounds.size.width/2.0
        shapeLayer.strokeColor = UIColor.clear.cgColor
        
        self.addSublayer(shapeLayer)
    }
    
    func addGradientBorder(WithColors color:[UIColor],Width width:CGFloat = 1) -> Void {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect.init(origin: CGPoint.zero, size: CGSize(width: self.bounds.size.width, height: self.bounds.size.height))
        gradientLayer.startPoint = CGPoint(x:0.0, y:0.5)
        gradientLayer.endPoint = CGPoint(x:1.0, y:0.5)
        gradientLayer.colors = color.map({$0.cgColor})
                
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = width
        shapeLayer.path = UIBezierPath(rect: self.bounds).cgPath
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.black.cgColor
        gradientLayer.mask = shapeLayer

        self.addSublayer(gradientLayer) 
    }
    
//    
//    func addShadow(Color color:UIColor, View view:UIView) -> Void {
//        //  let shapeLayer = CAShapeLayer()
//        view.layer.shadowColor = color.cgColor
//         view.layer.shadowOpacity = 0.3
//        
//        //self.addSublayer(shapeLayer)
//    }
//
    
    func addBorderShadow(Height height:CGFloat, Width width:CGFloat) -> Void {

        
        let shapeLayer = CAShapeLayer()
      
        shapeLayer.path = UIBezierPath(roundedRect:CGRect (x: 0, y: 0, width: width, height: height), cornerRadius: height/2).cgPath
        shapeLayer.fillColor = UIColor.appThemeBlueColor().cgColor
        
        shapeLayer.shadowColor = UIColor .appThemeBlueColor().cgColor
        
        shapeLayer.shadowPath = shapeLayer.path
        shapeLayer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        shapeLayer.shadowOpacity = 0.5
        shapeLayer.shadowRadius = 2
        
       // layer.insertSublayer(shadowLayer, at: 0)
         self.addSublayer(shapeLayer)
        }
    }


extension Collection where Indices.Iterator.Element == Index {
    
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Generator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
//extension PHAsset
//{
//    func getAssetImageDetails() -> [String:Any] {
//        var imageInfoDictionary:[String:Any] = [:]
//        let manager = PHImageManager.default()
//        let option = PHImageRequestOptions()
//        var thumbnail = UIImage()
//        option.isSynchronous = true
////        manager.requestImageData(for: self, options: option) { (data, strTest, orientation, info) in
////            print(data)
////            print(info)
////            print(strTest)
////            print(orientation)
////        }
//        manager.requestImage(for: self, targetSize: CGSize(width: self.pixelWidth, height: self.pixelHeight), contentMode: .aspectFit, options: option, resultHandler:
//            {
//            (result, info)->Void in
//            thumbnail = result!
//                imageInfoDictionary[Constant.ImageDetails.Image] = thumbnail
//                
//                var strFileName:String = ""
//                let strImageUrl:String = (info?["PHImageFileURLKey"] as! URL).path
//                if strImageUrl.characters.count > 0
//                {
//                    strFileName = strImageUrl.components(separatedBy: "/").last!
//                }
//                else
//                {
//                    strFileName = ""
//                }
//                imageInfoDictionary[Constant.ImageDetails.ImageNameKey] = strFileName
//                var strFileMineType:String = ""
//                let strUTIKey:String = info?["PHImageFileUTIKey"] as! String
//                if strUTIKey.characters.count > 0
//                {
//                    strFileMineType = "image/"
//                    strFileMineType = strFileMineType.appending((strUTIKey.components(separatedBy: ".").last)!)
//                }
//                else
//                {
//                    strFileMineType = "image/jpeg"
//                }
//                imageInfoDictionary[Constant.ImageDetails.ImageMineTypeKey] = strFileMineType
//                
//        })
//        return imageInfoDictionary
//    }
//    func getAssetThumbnail() -> UIImage {
//        let manager = PHImageManager.default()
//        let option = PHImageRequestOptions()
//        var thumbnail = UIImage()
//        option.isSynchronous = true
//        manager.requestImage(for: self, targetSize: CGSize(width:100.0, height: 100.0), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
//            thumbnail = result!
//        })
//        return thumbnail
//    }
//    
//    
//}

extension UIColor{
    class func appRedColor() -> UIColor {
        return UIColor.init(red: 226/255.0, green: 71/255.0, blue: 76/255.0, alpha: 1.0)
    }
    class func appThemeBlueColor() -> UIColor {
        return UIColor.init(red:  51/255.0, green: 204/255.0, blue: 219/255.0, alpha: 1.0)
    }
    
    class func appThemeLightBlueColor() -> UIColor {
        return UIColor.init(red:  220/255.0, green: 240/255.0, blue: 244/255.0, alpha: 1.0)
    }
    class func appGrayColor() -> UIColor {
        return UIColor.init(red: 181/255.0, green: 181/255.0, blue: 181/255.0, alpha: 1.0)
    }
    class func appLightGrayColor() -> UIColor {
        return UIColor.init(red: 179/255.0, green: 179/255.0, blue: 199/255.0, alpha: 1.0)
    }
    class func appLightColor() -> UIColor {
        return UIColor.init(red: 225/255.0, green: 225/255.0, blue: 225/255.0, alpha: 1.0)
    }
    class func appDarkGrayColor() -> UIColor {
        return UIColor.init(red: 30/255.0, green: 30/255.0, blue: 30/255.0, alpha: 1.0)
    }
    class func appBorderGrayColor() -> UIColor {
        //return UIColor.init(red: 190/255.0, green: 194/255.0, blue: 205/255.0, alpha: 1.0)
        return UIColor.init(red: 218/255.0, green: 220/255.0, blue: 226/255.0, alpha: 1.0)
    }
    class func appLightBlueColor() -> UIColor {
        return UIColor.init(red: 238/255.0, green: 240/255.0, blue: 248/255.0, alpha: 1.0)
    }
    class func appNotificationSuccess() -> UIColor {
        return UIColor.init(red: 204/255.0, green: 250/255.0, blue: 228/255.0, alpha: 1.0)
    }
    class func appNotificationFail() -> UIColor {
        return UIColor.init(red: 225/255.0, green: 216/255.0, blue: 241/255.0, alpha: 1.0)
    }
    
    class func appPurpleColor() -> UIColor {
        return UIColor.init(red: 103/255.0, green: 57/255.0, blue: 183/255.0, alpha: 1.0)
    }
    class func appGoldenColor() -> UIColor {
        return UIColor.init(red: 247/255.0, green: 188/255.0, blue: 59/255.0, alpha: 1.0)
    }
    class func appPerrotColor() -> UIColor {
        return UIColor.init(red: 0/255.0, green: 148/255.0, blue: 134/255.0, alpha: 1.0)
    }
    class func appGreenColor() -> UIColor {
        return UIColor.init(red: 141/255.0, green: 197/255.0, blue: 62/255.0, alpha: 1.0)
    }
    
    class func appBlackColor() -> UIColor {
        return UIColor.init(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
    }
    class func randomColor() -> UIColor {
        
        let hue = CGFloat(arc4random() % 100) / 100
        let saturation = CGFloat(arc4random() % 100) / 100
        let brightness = CGFloat(arc4random() % 100) / 100
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
   
}


extension Int {
    /// returns number of digits in Int number
    public var digitCount: Int {
        get {
            return numberOfDigits(in: self)
        }
    }
    // private recursive method for counting digits
    private func numberOfDigits(in number: Int) -> Int {
        if abs(number) < 10 {
            return 1
        } else {
            return 1 + numberOfDigits(in: number/10)
        }
    }
}

extension UIFont{
    
   
    class func appRegularFont(WithSize size:CGFloat) -> UIFont
    {
        return UIFont.init(name: "Roboto-Thin", size: size.proportionalFontSize())!
    }
    class func appMediumFont(WithSize size:CGFloat) -> UIFont {
        return UIFont.init(name: "Roboto-Medium", size: size.proportionalFontSize())!

        //return UIFont.init(name: "Roboto-Medium", size: size.proportionalFontSize())!
    }
    class func appSemiboldFont(WithSize size:CGFloat) -> UIFont {
        return UIFont.init(name: "Roboto-Regular", size: size.proportionalFontSize())!
    }
    
    class func appCondensedItalicFont(WithSize size:CGFloat) -> UIFont {
        return UIFont.init(name: "Roboto-CondensedItalic", size: size.proportionalFontSize())!
    }
    class func appBoldCondensedFont(WithSize size:CGFloat) -> UIFont {
        return UIFont.init(name: "Roboto-BoldCondensed", size: size.proportionalFontSize())!
    }
 //Roboto-BoldCondensed.ttf
}


extension CGFloat{
    func proportionalFontSize() -> CGFloat
    {
        let sizeToCheckAgainst = self        
        let screenHeight = UIScreen.main.bounds.size.height
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            if screenHeight==480{
                return (sizeToCheckAgainst - 2.5)
            }else if screenHeight == 568{
                return (sizeToCheckAgainst -  1.5)
            }else if screenHeight == 667{
                return (sizeToCheckAgainst +  0)
            }else if screenHeight == 736{
                return (sizeToCheckAgainst + 1)
            }
            break
        case .pad:
            return (sizeToCheckAgainst + 12)
        default:
            return self
        }
        return self
    }
}

extension Date{
    
    func isGreaterThanDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    func isGreaterThanOrEqualToDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedDescending || self.compare(dateToCompare) == ComparisonResult.orderedSame {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    
    func isLessThanDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedAscending {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    func isLessThanOrEqualToDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedAscending || self.compare(dateToCompare) == ComparisonResult.orderedSame {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    func equalToDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedSame {
            isEqualTo = true
        }
        
        //Return Result
        return isEqualTo
    }
    
    func endOfMonth() -> Date? {
        
        let calendar = NSCalendar.current
        if let plusOneMonthDate = calendar.date(byAdding: .month, value: 1, to: self) {
            
            let plusOneMonthDateComponents = calendar.dateComponents([.month,.year], from: plusOneMonthDate)
            
            let endOfMonth = (calendar.date(from: plusOneMonthDateComponents))?.addingTimeInterval(-1)
            return endOfMonth
        }
        
        return nil
    }
    
    func getDateWith(Seconds second:Int) -> Date {
        var dateComponent = Calendar.current.dateComponents([Calendar.Component.day,Calendar.Component.month,Calendar.Component.year,Calendar.Component.hour,Calendar.Component.minute,Calendar.Component.second], from: self)
        dateComponent.second = 0
        return Calendar.current.date(from: dateComponent)!
    }
    
    func dateWithTimeFromDate(_ secondDate:Date) -> Date{
        
        let secondDateComponent:DateComponents = NSCalendar.current.dateComponents([.hour,.minute], from: secondDate)
        var selfDateComponent:DateComponents = NSCalendar.current.dateComponents([.day,.month,.year,.hour,.minute], from: self)
        
        selfDateComponent.hour = secondDateComponent.hour
        selfDateComponent.minute  = secondDateComponent.minute
        
        return NSCalendar.current.date(from: selfDateComponent)!
    }
    
    func dateWith(Hour hour:Int ,AndMinutes minutes:Int) -> Date{ 
        var selfDateComponent:DateComponents = NSCalendar.current.dateComponents([.day,.month,.year], from: self)
        selfDateComponent.hour = hour
        selfDateComponent.minute  = minutes
        return NSCalendar.current.date(from: selfDateComponent)!
    }
    
    func isToday() -> Bool {
        let dateComponents = Calendar.current.dateComponents([.day,.month,.year,.hour,.minute], from: self)
        let currentDateComponents = self.getCurrentDateComponents()
        
        if dateComponents.day == currentDateComponents.day && dateComponents.month == currentDateComponents.month && currentDateComponents.year == dateComponents.year{
            return true
        }else{
            return false
        }
    }
    func getDateInString(withFormat format:String) -> String
    {
        var strConvertedDate:String = ""
        
        let dateFormat:DateFormatter = DateFormatter()
        dateFormat.dateFormat = format
        strConvertedDate = dateFormat.string(from: self)
        
        return strConvertedDate
    }
    func convertDateInString(withDateFormat format:String, withConvertedDateFormat convertDate:String) -> String
    {
        var strConvertedDate:String = ""
        
        let dateFormat:DateFormatter = DateFormatter()
        dateFormat.dateFormat = format
        strConvertedDate = dateFormat.string(from: self)
        let convertedDate:Date = dateFormat.date(from: strConvertedDate)!;
        dateFormat.dateFormat = convertDate
        strConvertedDate = dateFormat.string(from: convertedDate);
        return strConvertedDate
    }
    func isTimeGretherThanCurrentTime() -> Bool {
        let dateComponents = Calendar.current.dateComponents([.day,.month,.year,.hour,.minute], from: self)
        let currentDateComponents = self.getCurrentDateComponents()
        
        if currentDateComponents.hour! > dateComponents.hour!{
            return true
        }else if currentDateComponents.hour == dateComponents.hour{
            if currentDateComponents.minute! >= dateComponents.minute!{
                return true
            }else{
                return false
            }
        }else{
            return false
        }
    }
    
    func getCurrentDateComponents() -> DateComponents {
        return Calendar.current.dateComponents([.day,.month,.year,.hour,.minute], from: Date())
    }
    
    func findNext(DayDate day: String) -> Date {
        
        var calendar = NSCalendar.current
        calendar.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        calendar.locale = Locale.current
        
        guard let indexOfDay = calendar.weekdaySymbols.index(of: day) else {
            assertionFailure("Failed to identify day")
            return self
        }
        
        let weekDay = indexOfDay + 1
        
        let components = calendar.component(.weekday, from: self)
        
        if components == weekDay {
            return self
        }
        
        var matchingComponents = DateComponents()
        matchingComponents.weekday = weekDay // Monday
        
        let comingMonday = calendar.nextDate(after: self, matching: matchingComponents, matchingPolicy: Calendar.MatchingPolicy.nextTime)  //calendar.nextDate(After
        
        if let nextDate = comingMonday{
            return nextDate.dateWithTimeFromDate(self)
        }else{
            assertionFailure("Failed to find next day")
            return self
        }
    }
}

extension UIView{
    func addCornerRadiusAndBorder()-> Void{
        self.layer.borderColor = UIColor .appBorderGrayColor().cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
    }
    func addDropShadow() -> Void {
        self.layer.masksToBounds = false;
        self.layer.shadowOffset = CGSize.init(width: 0, height: 0);
        self.layer.shadowRadius = 5;
        self.layer.shadowColor = UIColor .appThemeBlueColor().cgColor
        self.layer.shadowOpacity = 0.3;
    }
    
    func addGreayDropShadow() -> Void {
        self.layer.masksToBounds = false;
        self.layer.shadowOffset = CGSize.init(width: 0, height: 0);
        self.layer.shadowRadius = 5;
        self.layer.shadowColor = UIColor .appGrayColor().cgColor
        self.layer.shadowOpacity = 0.3;
    }
    
    func addRoundShadow() -> Void {
        self.layer.masksToBounds = false;
        self.layer.shadowOffset = CGSize.init(width: 0, height: 0);
        self.layer.shadowRadius = 7.5;
        self.layer.shadowColor = UIColor .appThemeBlueColor().cgColor
        self.layer.shadowOpacity = 0.5;
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}

extension UILabel{
    func animateToFont(_ font: UIFont, withDuration duration: TimeInterval) {
        let oldFont = self.font
        self.font = font
        // let oldOrigin = frame.origin
        let labelScale = oldFont!.pointSize / font.pointSize
        let oldTransform = transform
        transform = transform.scaledBy(x: labelScale, y: labelScale)
        // let newOrigin = frame.origin
        // frame.origin = oldOrigin
        setNeedsUpdateConstraints()
        UIView.animate(withDuration: duration) {
            //    self.frame.origin = newOrigin
            self.transform = oldTransform
            self.layoutIfNeeded()
        }
    }
    
    func lineSpacingInLabel(Space space:CGFloat, StringText text:String) -> NSAttributedString {
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = space
        let attributes = [NSParagraphStyleAttributeName : style]
        let attributeText:NSAttributedString =  NSAttributedString(string: text, attributes:attributes)
        // attributedText =
        return attributeText
    }

    
}

/*
extension String{
    func getDate(withDateFormate format:String) -> Date?
    {
        let dateFormat:DateFormatter = DateFormatter()
        dateFormat.dateFormat = format
        if let date = dateFormat.date(from: self)
        {
            return date
        }
        return nil
    }
    
    func attributedString(WithStringAttributes textAttribute:AITextAttribute, SubStringData arySubString:[AITextAttribute]) -> Void {
        
        // Whole Length
        let rangeOfString:NSRange = NSRange.init(location: 0, length: textAttribute.text.characters.count)
        
        // ParagraphStyle
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = textAttribute.textAlignment
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        // Main Attributed String
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttributes([
            NSParagraphStyleAttributeName:paragraphStyle,
            NSForegroundColorAttributeName:textAttribute.textColor,
            NSFontAttributeName:textAttribute.textFont
            ], range: rangeOfString)
        if textAttribute.shouldAddUnderline == true {
            attributedString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: rangeOfString)
        }
        
        var searchRange: NSRange = rangeOfString
        
        for index in 0..<arySubString.count{
            let subStringAttributes = arySubString[index]
            
            var foundRange: NSRange = NSRange.init(location: 0, length: 0)
            
            searchRange.length = rangeOfString.length - searchRange.location
            if let subStringValue = textAttribute.text as? NSString{
                foundRange = subStringValue.range(of: subStringAttributes.text, options: .forcedOrdering, range: searchRange, locale: nil)
            }
//            foundRange = rangeOfString.rangeOfString(subStringAttributes.text, options:NSString.CompareOptions.ForcedOrderingSearch, range: searchRange)
        }
    }
    
  
    
    static func heightForLabel(text:String, font:UIFont, width:CGFloat) -> CGFloat
    {
        let label:UILabel = UILabel(frame: CGRect.init(x: 0.0, y: 0.0, width: width, height: CGFloat.greatestFiniteMagnitude ) )

        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.autoresizingMask = []
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    static func heightForLabel(text:String, font:UIFont, width:CGFloat, numberOfLine:Int) -> CGFloat
    {
        let label:UILabel = UILabel(frame: CGRect.init(x: 0.0, y: 0.0, width: width, height: CGFloat.greatestFiniteMagnitude) )
        //CGRectMake(0, 0, width, CGFloat.greatestFiniteMagnitude)
        label.numberOfLines = numberOfLine
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.autoresizingMask = []
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
}
extension NSAttributedString {
   
   
}
extension NSString{
    
    class func getDictionaryForAttributedString(withString strString:String, FontForString font:UIFont, ColorForString color:UIColor, AllowUnderline underline:Bool) -> NSMutableDictionary {
        let dicAttribute = NSMutableDictionary()
        dicAttribute.setValue(strString, forKey:  Constant.AttributedString.LinkText)
        dicAttribute.setValue(color, forKey:  Constant.AttributedString.LinkColor)
        dicAttribute.setValue(font, forKey:  Constant.AttributedString.LinkFont)
        dicAttribute.setValue(NSNumber(value: underline as Bool), forKey:  Constant.AttributedString.LinkUnderline)
        return dicAttribute
    }
    
    
    class func getCustomAttributedStringForText(_ strWholeString:NSString, andSubStringData arySubString:NSArray, normatTextColor textColor:UIColor, defaultTextFont font:UIFont, textAlignment alignment:NSTextAlignment)->(NSMutableAttributedString){
        
        let rangeOfString:NSRange = NSMakeRange(0, strWholeString.length)
        
        // Satup Paragraph Style
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        paragraphStyle.alignment = alignment
        //        paragraphStyle.minimumLineHeight = 5.0
        
        // Create new attributed string
        let attributedString:NSMutableAttributedString = NSMutableAttributedString(string: strWholeString as String)
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: rangeOfString)
        attributedString.addAttribute(NSForegroundColorAttributeName, value: textColor, range: rangeOfString)
        attributedString.addAttribute(NSFontAttributeName, value: font, range: rangeOfString)
        var searchRange: NSRange = NSMakeRange(0, strWholeString.length)
        
        for dicAttributes in arySubString {
            
            let subString: NSString = (dicAttributes as! NSDictionary) .value(forKey: Constant.AttributedString.LinkText) as! NSString  //((dicAttributes as AnyObject) .value(forKey: Constant.AttributedString.LinkText) as! String)
            var foundRange: NSRange
            
            searchRange.length = strWholeString.length - searchRange.location
            foundRange = strWholeString.range(of: subString as String, options:NSString.CompareOptions.forcedOrdering, range: searchRange)
            
            
            if foundRange.location != NSNotFound {
                // found an occurrence of the substring! do stuff here
                searchRange.location = foundRange.location + foundRange.length
                
                let linkColor:UIColor? = (dicAttributes as AnyObject).value(forKey: Constant.AttributedString.LinkColor) as? UIColor
                attributedString.addAttribute(NSForegroundColorAttributeName, value: linkColor!, range: foundRange)
                
                // Link Font
                var linkFont:UIFont? = font
                if (dicAttributes as AnyObject).value(forKey: Constant.AttributedString.LinkFont) != nil {
                    linkFont = (dicAttributes as AnyObject).value(forKey: Constant.AttributedString.LinkFont) as? UIFont
                }
                attributedString.addAttribute(NSFontAttributeName, value: linkFont!, range: foundRange)
                
                // Link Underline
                let shouldAddUnderline:Bool = ((dicAttributes as AnyObject).value(forKey: Constant.AttributedString.LinkUnderline) as! NSNumber ) as Bool
                if shouldAddUnderline == true {
                    attributedString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: foundRange)
                }
            }else{
                
                let linkColor:UIColor? = (dicAttributes as AnyObject).value(forKey: Constant.AttributedString.LinkColor) as? UIColor
                attributedString.addAttribute(NSForegroundColorAttributeName, value: linkColor!, range: foundRange)
                
                // Link Font
                var linkFont:UIFont? = font
                if (dicAttributes as AnyObject).value(forKey: Constant.AttributedString.LinkFont) != nil {
                    linkFont = (dicAttributes as AnyObject).value(forKey: Constant.AttributedString.LinkFont) as? UIFont
                }
                attributedString.addAttribute(NSFontAttributeName, value: linkFont!, range: foundRange)
                
                // Link Underline
                let shouldAddUnderline:Bool = ((dicAttributes as AnyObject).value(forKey: Constant.AttributedString.LinkUnderline) as! NSNumber ) as Bool
                if shouldAddUnderline == true {
                    attributedString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: foundRange)
                }
            }
            
        }
        return attributedString
        
    }

    
    
    /*
    class func getCustomAttributedStringForText(strWholeString:NSString, andSubStringData arySubString:NSArray, normatTextColor textColor:UIColor, defaultTextFont font:UIFont, textAlignment alignment:NSTextAlignment)->(NSMutableAttributedString){
        
        let rangeOfString:NSRange = NSMakeRange(0, strWholeString.length)
        
        // Satup Paragraph Style
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        paragraphStyle.alignment = alignment
        //        paragraphStyle.minimumLineHeight = 5.0
        
        // Create new attributed string
        let attributedString:NSMutableAttributedString = NSMutableAttributedString(string: strWholeString as String)
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: rangeOfString)
        attributedString.addAttribute(NSForegroundColorAttributeName, value: textColor, range: rangeOfString)
        attributedString.addAttribute(NSFontAttributeName, value: font, range: rangeOfString)
        var searchRange: NSRange = NSMakeRange(0, strWholeString.length)
        
        for dicAttributes in arySubString {
            
            let subString: NSString = ((dicAttributes as AnyObject).valueForKey(Constant.AttributedString.LinkText) as! String)
            var foundRange: NSRange
            
            searchRange.length = strWholeString.length - searchRange.location
            foundRange = strWholeString.rangeOfString(subString as String, options:NSString.CompareOptions.ForcedOrderingSearch, range: searchRange)
            
            
            if foundRange.location != NSNotFound {
                // found an occurrence of the substring! do stuff here
                searchRange.location = foundRange.location + foundRange.length
                
                let linkColor:UIColor? = dicAttributes.valueForKey(Constant.AttributedString.LinkColor) as? UIColor
                attributedString.addAttribute(NSForegroundColorAttributeName, value: linkColor!, range: foundRange)
                
                // Link Font
                var linkFont:UIFont? = font
                if dicAttributes.valueForKey(Constant.AttributedString.LinkFont) != nil {
                    linkFont = dicAttributes.valueForKey(Constant.AttributedString.LinkFont) as? UIFont
                }
                attributedString.addAttribute(NSFontAttributeName, value: linkFont!, range: foundRange)
                
                // Link Underline
                let shouldAddUnderline:Bool = (dicAttributes.valueForKey(Constant.AttributedString.LinkUnderline) as! NSNumber ) as Bool
                if shouldAddUnderline == true {
                    attributedString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.rawValue, range: foundRange)
                }
            }else{
                
                let linkColor:UIColor? = dicAttributes.valueForKey(Constant.AttributedString.LinkColor) as? UIColor
                attributedString.addAttribute(NSForegroundColorAttributeName, value: linkColor!, range: foundRange)
                
                // Link Font
                var linkFont:UIFont? = font
                if dicAttributes.valueForKey(Constant.AttributedString.LinkFont) != nil {
                    linkFont = dicAttributes.valueForKey(Constant.AttributedString.LinkFont) as? UIFont
                }
                attributedString.addAttribute(NSFontAttributeName, value: linkFont!, range: foundRange)
                
                // Link Underline
                let shouldAddUnderline:Bool = (dicAttributes.valueForKey(Constant.AttributedString.LinkUnderline) as! NSNumber ) as Bool
                if shouldAddUnderline == true {
                    attributedString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.rawValue, range: foundRange)
                }
            }
            
        }
        return attributedString
        
    }
 */
 */

