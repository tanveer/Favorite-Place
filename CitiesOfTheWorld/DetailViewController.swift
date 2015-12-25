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
    //@IBOutlet weak var backView: UIView!
    @IBOutlet weak var cityImage:UIImageView!
    @IBOutlet weak var cityName:UILabel!
    var city:String = ""
    var imageName:String = ""
    var counteryName:String = ""
    var cities:[String] = []
    var count:Int = 0
    var screenSize:CGRect?
    var timer = NSTimer()
    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frameView.setShadow(frameView)
        //backView.setShadow(backView)
        screenSize = UIScreen.mainScreen().bounds
        cities = IMAGES_OF_CITIES[counteryName]!
        num = cities.count
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        cityName.text = "\(citiesAndCounteries[cities[count]]!)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("animation"), userInfo: nil, repeats: true)
    }
    
    //Carousel animation
    func animation(){
        if count < num{
            UIView.animateWithDuration(1.5, delay: 0.5, usingSpringWithDamping:0.5, initialSpringVelocity: 3.0, options:
                UIViewAnimationOptions.CurveLinear, animations: {
                self.frameView.center = CGPointMake(self.frameView.center.x - (self.screenSize!.width), self.frameView.center.y)
                self.cityImage.image = UIImage(named: "\(self.cities[self.count]).jpg")
                }, completion:{ complete in
                    if complete {
                        UIView.animateWithDuration(1.0, animations: {
                            self.frameView.center = CGPointMake(self.frameView.center.x, self.frameView.center.y - 300)
                        })
                    }
            })
            ++count
        } else {
            count = 0
        }
    }
    
    
    func setupView(){
        if count < num{
            UIView.animateWithDuration(2.0, delay:0, options: .CurveLinear, animations: {
                self.frameView.center = CGPointMake(self.frameView.center.x - (self.screenSize!.width), self.frameView.center.y)
                self.cityImage.image = UIImage(named: "\(self.cities[self.count]).jpg")
                }, completion: nil)
            count++
        } else{
            count = 0
        }
    }
}
