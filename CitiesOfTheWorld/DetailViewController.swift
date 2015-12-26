//
//  DetailViewController.swift
//  CitiesOfTheWorld
//
//  Created by Tanveer Bashir on 12/24/15.
//  Copyright © 2015 Tanveer Bashir. All rights reserved.
//

import UIKit
import EasyAnimation

class DetailViewController: UIViewController {
    @IBOutlet weak var frameView: UIView!
   // @IBOutlet weak var backView: UIView!
    @IBOutlet weak var cityImage:UIImageView!
    @IBOutlet weak var cityName:UILabel!
    var city:String = ""
    var imageName:String = ""
    var counteryName:String = ""
    var cities:[String] = []
    var count:Int = 0
    var screenSize:CGRect?
    var timer = NSTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
       frameView.setShadow(frameView)
        //backView.setShadow(backView)
        screenSize = UIScreen.mainScreen().bounds
        cities = IMAGES_OF_CITIES[counteryName]!
        cityImage.image = UIImage(named: imageName)
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: Selector("animation"), userInfo: nil, repeats: true)
    }
    
    //Carousel animation
    func animation(){
        let num = cities.count
        if count < num {
            UIView.animateWithDuration(0.9, delay: 0.5, usingSpringWithDamping:0.9, initialSpringVelocity: 0.0, options:.CurveLinear, animations: {
                    self.frameView.center = CGPointMake(self.frameView.center.x - (self.screenSize!.width), self.frameView.center.y)
                    self.cityImage.image = UIImage(named: "\(self.cities[self.count]).jpg")
                let textAtributes = [ NSStrokeColorAttributeName: UIColor.blackColor(), NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name:"HelveticaNeue-CondensedBlack", size: 24)!, NSStrokeWidthAttributeName: -3.0]
                let text = NSMutableAttributedString(string:"\(self.cities[self.count])", attributes: textAtributes)
                self.cityName.attributedText = text

                }, completion:{finish in
                    if finish {
                    UIView.animateWithDuration(2.0, delay: 0.0
                        , options:.CurveEaseOut, animations: {
                        self.frameView.center = CGPointMake(self.frameView.center.x - (self.screenSize!.width + self.screenSize!.width ), self.frameView.center.y)
                        }, completion: nil)
                    }
            })
            ++count
        } else {
            cityImage.image = UIImage(named: "\(imageName)")
            count = 0
        }
    }
}
