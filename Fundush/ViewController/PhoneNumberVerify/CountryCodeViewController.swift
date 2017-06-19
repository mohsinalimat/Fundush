//
//  CountryCodeViewController.swift
//  DriverCity
//
//  Created by Kavin Soni on 28/05/17.
//  Copyright © 2017 Kavin Soni. All rights reserved.
//

import UIKit

class CountryCodeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate
{
    var arrCountryList:NSArray = NSArray()
    var searchActive:Bool = false
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblView: UITableView!
//    var filtered:NSArray = NSArray()
    var arrCountryString:[String] = []
    var filtered:[String] = []

    typealias sendCountryCode = (String , String) -> Void
    var callCountryCode:sendCountryCode?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        addBackButtonInNavigationBar()
        self.title = "Select Country"
        readJson()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if(searchActive) {
            return filtered.count
        }
        return arrCountryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let countryCell:CountryCell = tableView.dequeueReusableCell(withIdentifier: "CountryCell") as! CountryCell
        

        if(searchActive){
            let contryName = filtered[indexPath.row]
            countryCell.lblCountryName.text = contryName
            for i in 0..<arrCountryList.count {
                if let name = (arrCountryList[i] as AnyObject).value(forKey: "name") {
                    if name as! String == contryName {
                        countryCell.btnCode.text = (arrCountryList[i] as AnyObject).value(forKey: "dial_code") as? String
                    }
                }
            }
       
        } else {
            let dict = arrCountryList[indexPath.row] as? NSDictionary
           
            countryCell.lblCountryName.text = dict?.value(forKey: "name") as! String?
            countryCell.btnCode.text = dict?.value(forKey: "dial_code") as! String?
        }
        
      

//        countryCell.objModel = self.objNotificationViewController.getNotificationObject(atIndex: indexPath.row
        return countryCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell:CountryCell = tableView.cellForRow(at: indexPath) as! CountryCell
        callCountryCode!(cell.lblCountryName.text! , cell.btnCode.text!)
        self.view.endEditing(true)

        self.navigationController?.popViewController(animated: true)
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtered = arrCountryString.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)//CaseInsensitiveSearch
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tblView.reloadData()
    }
    
    
    
    
    private func readJson() {
        do {
            if let file = Bundle.main.url(forResource: "countries", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    print(object)
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                    arrCountryList = object as NSArray
                    for i in 0..<arrCountryList.count {
                       let countryName = (arrCountryList[i] as AnyObject).value(forKey: "name") as! String
                        arrCountryString .append(countryName)
                    }
                    tblView .reloadData()
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    //MARK: - Back Button
    
    func addBackButtonInNavigationBar() -> Void {
        let btnDrawer = UIButton.init(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        btnDrawer.setImage(#imageLiteral(resourceName: "back"), for: UIControlState.normal)
        btnDrawer.setImage(#imageLiteral(resourceName: "back"), for: UIControlState.selected)
        let leftButtonForNavigation = UIBarButtonItem.init(customView: btnDrawer)
        
        btnDrawer.addTarget(self, action: #selector(RegisterViewController.openLeftDrawer(_:)) , for: UIControlEvents.touchUpInside)
        
        self.navigationItem.leftBarButtonItem = leftButtonForNavigation
    }
    
    func openLeftDrawer(_ sender: AnyObject) {
       
        self.navigationController?.popViewController(animated: true)
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
