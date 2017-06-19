//
//  EventListViewController.swift
//  Fundush
//
//  Created by Kavin Soni on 10/06/17.
//  Copyright © 2017 Kavin Soni. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate  {
    @IBOutlet weak var lblSorting: UILabel!
    var searchController : UISearchController!
    @IBOutlet weak var btnSuggested: UIButton!
    @IBOutlet weak var tblEventList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tblEventList.backgroundColor = UIColor .clear
        self.view.backgroundColor = UIColor .white
        self.tblEventList.separatorStyle = .none
        lblSorting.font = UIFont .appMediumFont(WithSize: 14)
        lblSorting.textColor = UIColor .appThemeBlueColor()
        btnSuggested.titleLabel?.font = UIFont .appMediumFont(WithSize: 14)
        btnSuggested .setTitleColor( UIColor .appThemeBlueColor(), for: UIControlState.normal)
        createSearchBar()
        addBackButtonInNavigationBar()
//        addSearchButtonInNavigationBar()
        addLocationButtonInNavigationBar()
        self.title = "Event List"
        // Do any additional setup after loading the view.
    }

    
    func createSearchBar() -> Void {
        
        self.searchController = UISearchController(searchResultsController:  nil)
        searchController.searchBar.setImage(UIImage .init(named: "cancel"), for: UISearchBarIcon.clear, state: UIControlState.normal)//setValue(UIImage .init(named: "cancel"), forKey:"_cancelButtonText")
        self.searchController.searchBar.backgroundColor = UIColor .white
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.searchController.searchBar.tintColor = UIColor .appThemeBlueColor()
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        
        self.navigationItem.titleView = searchController.searchBar
        self.navigationItem.titleView?.backgroundColor = UIColor .white
        self.searchController.searchBar.barTintColor = UIColor .white
        self.definesPresentationContext = true
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let eventCell:EventTableCell = tableView.dequeueReusableCell(withIdentifier: "EventTableCell") as! EventTableCell
        eventCell.addGreayDropShadow()
        eventCell.selectionStyle = UITableViewCellSelectionStyle.none
        eventCell.backgroundColor = UIColor.clear
    
        
        if indexPath.row == 1 {
            eventCell.imgEvent.image = UIImage (named: "2")
        } else if indexPath.row == 2 {
            eventCell.imgEvent.image = UIImage (named: "3")
        }else if indexPath.row == 3 {
            eventCell.imgEvent.image = UIImage (named: "4")
        }else if indexPath.row == 4 {
            eventCell.imgEvent.image = UIImage (named: "5")
        }
        return eventCell
    }
    
    
    
    
    //MARK: - Back Button
    
    func addBackButtonInNavigationBar() -> Void {
        let btnDrawer = UIButton.init(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        btnDrawer.setImage(#imageLiteral(resourceName: "back"), for: UIControlState.normal)
        btnDrawer.setImage(#imageLiteral(resourceName: "back"), for: UIControlState.selected)
        let leftButtonForNavigation = UIBarButtonItem.init(customView: btnDrawer)
        
        btnDrawer.addTarget(self, action: #selector(CategoryViewController.openLeftDrawer(_:)) , for: UIControlEvents.touchUpInside)
        
        self.navigationItem.leftBarButtonItem = leftButtonForNavigation
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventDetail = self.storyboard?.instantiateViewController(withIdentifier: "EventDetailViewController")
        self.view.endEditing(true)
        self.navigationController?.pushViewController(eventDetail!, animated: true)
    }
    
    func addLocationButtonInNavigationBar() -> Void {
        let btnDrawer = UIButton.init(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        btnDrawer.setImage(#imageLiteral(resourceName: "location"), for: UIControlState.normal)
        btnDrawer.setImage(#imageLiteral(resourceName: "location"), for: UIControlState.selected)
        let leftButtonForNavigation = UIBarButtonItem.init(customView: btnDrawer)
        
       // btnDrawer.addTarget(self, action: #selector(CategoryViewController.openLeftDrawer(_:)) , for: UIControlEvents.touchUpInside)
        
        self.navigationItem.rightBarButtonItem = leftButtonForNavigation
    }
    
    func addSearchButtonInNavigationBar() -> Void {
        let btnDrawer = UIButton.init(frame: CGRect(x: 0, y: 0, width: 30, height: 44))
        btnDrawer.setImage(#imageLiteral(resourceName: "ic_search"), for: UIControlState.normal)
        btnDrawer.setImage(#imageLiteral(resourceName: "ic_search"), for: UIControlState.selected)
        let leftButtonForNavigation = UIBarButtonItem.init(customView: btnDrawer)
        
       // btnDrawer.addTarget(self, action: #selector(CategoryViewController.openLeftDrawer(_:)) , for: UIControlEvents.touchUpInside)
        
        self.navigationItem.rightBarButtonItem = leftButtonForNavigation
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
