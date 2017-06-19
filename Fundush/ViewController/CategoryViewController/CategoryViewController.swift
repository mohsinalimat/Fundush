//
//  CategoryViewController.swift
//  Fundush
//
//  Created by Kavin Soni on 08/06/17.
//  Copyright © 2017 Kavin Soni. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var arrData:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDictionary()
        self.navigationController?.isNavigationBarHidden = false

        addBackButtonInNavigationBar()
        self.title = "Category"
        // Do any additional setup after loading the view.
        self.collectionView.backgroundColor = UIColor .clear
        self.view.backgroundColor = UIColor .white//.appThemeLightBlueColor()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryViewCell",for: indexPath) as! CategoryViewCell
        
        cell.backgroundColor = UIColor .clear
        
        let dict:NSMutableDictionary = arrData.object(at: indexPath.row) as! NSMutableDictionary
        let imageName = dict .value(forKey: "image") as! String
        cell.imgThumb.image = UIImage (named: imageName)
        cell.lblTitle.text =  dict .value(forKey: "title") as? String
        cell.lblTitle.textColor = UIColor .white

//        self.view .setNeedsLayout()
//        self.view .layoutIfNeeded()
        // cell.imgTitle.frame = CGRect (x: 0, y: 0, width: cell.frame.size.width, height: cell.imgTitle.frame.size.height/1.8)
        
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        
        print(self.collectionView.frame.size.width)
        
        return CGSize(width: ((self.collectionView.frame.size.width/2) - 12.5), height:(self.collectionView.frame.size.width/2) - 12.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let eventList = self.storyboard?.instantiateViewController(withIdentifier: "EventListViewController")
       self.view.endEditing(true)
        self.navigationController?.pushViewController(eventList!, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    func createDictionary() -> Void {
        
        var dict:NSMutableDictionary = NSMutableDictionary()
        dict .setValue("Outdoors & Adventures", forKey: "title")
        dict .setValue("1", forKey: "image")
        arrData .add(dict)
        
        dict = NSMutableDictionary()
        dict .setValue("Fitness", forKey: "title")
        dict .setValue("2", forKey: "image")
        arrData .add(dict)
        
        dict = NSMutableDictionary()
        dict .setValue("Sports", forKey: "title")
        dict .setValue("3", forKey: "image")
        arrData .add(dict)

        
        dict = NSMutableDictionary()
        dict .setValue("Yoga", forKey: "title")
        dict .setValue("4", forKey: "image")
        arrData .add(dict)
        
        dict = NSMutableDictionary()
        dict .setValue("Kids", forKey: "title")
        dict .setValue("5", forKey: "image")
        arrData .add(dict)
        
        dict = NSMutableDictionary()
        dict .setValue("Outdoors & Adventures", forKey: "title")
        dict .setValue("1", forKey: "image")
        arrData .add(dict)
        
        dict = NSMutableDictionary()
        dict .setValue("Fitness", forKey: "title")
        dict .setValue("2", forKey: "image")
        arrData .add(dict)
        
        dict = NSMutableDictionary()
        dict .setValue("Sports", forKey: "title")
        dict .setValue("3", forKey: "image")
        arrData .add(dict)
        
        
        dict = NSMutableDictionary()
        dict .setValue("Yoga", forKey: "title")
        dict .setValue("4", forKey: "image")
        arrData .add(dict)
        
        dict = NSMutableDictionary()
        dict .setValue("Kids", forKey: "title")
        dict .setValue("5", forKey: "image")
        arrData .add(dict)
        
        //LabelCell
        collectionView .reloadData()
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
