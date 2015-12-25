//
//  ViewController.swift
//  CitiesOfTheWorld
//
//  Created by Tanveer Bashir on 12/24/15.
//  Copyright © 2015 Tanveer Bashir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var worldBackgroundImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var cityAndCountryName: UILabel!
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var staticLabel: UILabel!
    @IBOutlet weak var findButton:UIButton!
    var timer = NSTimer()
    var count = 0
    var images:[String] = []
    var screenSize:CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSize = UIScreen.mainScreen().bounds
        
        let textAtributes = [ NSStrokeColorAttributeName: UIColor.blackColor(), NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name:"HelveticaNeue-CondensedBlack", size: 24)!, NSStrokeWidthAttributeName: -3.0]
        
        let text = NSMutableAttributedString(string: "Famous Cities Of The World", attributes: textAtributes)
        
        staticLabel.attributedText = text

        for (city, _) in citiesAndCounteries {
            images.append(city)
        }
        
        backgroundImage.alpha = 0
        cityNameTextField.alpha = 0
        staticLabel.alpha = 0
        cityAndCountryName.alpha = 0
        findButton.alpha = 0
        
        timer = NSTimer.scheduledTimerWithTimeInterval(2.5, target: self, selector: Selector("animate"), userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func animate(){
        let num = Int(images.count)
        if count < num {
            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.backgroundImage.center = CGPointMake(self.backgroundImage.center.x - (self.screenSize?.width)!, self.backgroundImage.center.y)
                self.backgroundImage.image = UIImage(named: self.images[self.count])
                self.cityAndCountryName.text = "\(self.images[self.count]), \(citiesAndCounteries[self.images[self.count]]!)"
                self.backgroundImage.alpha = 1
                self.cityNameTextField.alpha = 1
                self.staticLabel.alpha = 1
                self.cityAndCountryName.alpha = 1
                self.findButton.alpha = 1
                }, completion:nil)
            ++count
        } else {
            timer.invalidate()
            count = 0
        }
    }

    @IBAction func findCityButtonPressed(sender: UIButton) {
        timer.invalidate()
    }
    
    

}

