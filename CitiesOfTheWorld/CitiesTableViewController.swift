//
//  CitiesTableViewController.swift
//  CitiesOfTheWorld
//
//  Created by Tanveer Bashir on 12/24/15.
//  Copyright © 2015 Tanveer Bashir. All rights reserved.
//

import UIKit

class CitiesTableViewController: UITableViewController {

    var cities:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (city, _) in citiesAndCounteries{
            cities.append(city)
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomeTableViewCell

        // Configure the cell...
        tableView.separatorStyle = .SingleLineEtched
        
        //countery image
        cell.mainImage.image = UIImage(named: cities[indexPath.row])
        
        //attributed string
        let textAtributes = [ NSStrokeColorAttributeName: UIColor.blackColor(), NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name:"HelveticaNeue-CondensedBlack", size: 20)!, NSStrokeWidthAttributeName: -3.0]
        let city = NSMutableAttributedString(string:"\(cities[indexPath.row])", attributes: textAtributes)
        let countery = NSMutableAttributedString(string:"\(citiesAndCounteries[cities[indexPath.row]]!)", attributes: textAtributes)
        cell.counteryLabel.attributedText = countery
        cell.countery.attributedText = city
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let object = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = object.instantiateViewControllerWithIdentifier(STORYBORD_IDENTIFIER) as! DetailViewController
        detailVC.city = cities[indexPath.row]
        detailVC.imageName = cities[indexPath.row]
        detailVC.counteryName = citiesAndCounteries[cities[indexPath.row]]!
        navigationController?.presentViewController(detailVC, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
