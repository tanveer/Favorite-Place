//
//  DetailViewController.swift
//  CitiesOfTheWorld
//
//  Created by Tanveer Bashir on 12/24/15.
//  Copyright © 2015 Tanveer Bashir. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var frameView: UIView!
    @IBOutlet weak var backView: UIView!
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
        //backView.setShadow(backView)
        screenSize = UIScreen.mainScreen().bounds
        frameView.setShadow(frameView)
        cities = IMAGES_OF_CITIES[counteryName]!
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: Selector("animation"), userInfo: nil, repeats: true)
    }

    //Carousel animation

    func animation(){
        let num = cities.count
        if count < num {
            UIView.animateWithDuration(0.5, delay: 1.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options:
                UIViewAnimationOptions.CurveEaseIn, animations: {
                    self.cityName.text = "\(self.cities[self.count])"
                    self.cityImage.image = UIImage(named: "\(self.cities[self.count]).jpg" )
//                    self.frameView.center = CGPointMake(self.frameView.center.x - (self.screenSize!.width), self.frameView.center.y)
                }, completion:{ complete in
//                    if complete {
//                        UIView.animateWithDuration(0, delay: 1.0, options: .CurveLinear, animations: {
//                        self.frameView.center = CGPointMake(self.frameView.center.x + (self.screenSize!.width), self.frameView.center.y)
//                        }, completion:nil)
//                    }
            })
            ++count
        } else {
            count = 0
        }
    }
    
    //testing
    
//    func animation(){
//        let num = Int(cities.count)
//        if count < num {
//            UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
//                self.cityImage.center = CGPointMake(self.cityImage.center.x - (self.screenSize?.width)!, self.cityImage.center.y)
//                self.cityImage.image = UIImage(named: self.cities[self.count])
//                self.cityImage.alpha = 1
//                }, completion:nil)
//            ++count
//        } else {
//            timer.invalidate()
//            count = 0
//        }
//    }

    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        cityImage.image = UIImage(named: "\(imageName)")
        cityName.text = city
        cityImage.center = CGPointMake(cityImage.center.x - backView.frame.width, cityImage.center.y)
    }
}
