//
//  Custome.swift
//  CitiesOfTheWorld
//
//  Created by Tanveer Bashir on 12/24/15.
//  Copyright © 2015 Tanveer Bashir. All rights reserved.
//

import Foundation
import UIKit


//constant
let SHADOW_COLOR: CGFloat = 100.0 / 255.0
let VIEW_BACKGROUND = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
let citiesAndCounteries = [ "Alhambra" : "Spain", "Amsterdam" : "Netherlands", "Angkor_Siem":"Cambodia", "Bangkok" : "Thailand","Barcelona":"Spain", "Burj_Khalifa":"Dubai", "Charles_Bridge":"Prague", "Chichen_Itza":"Mexico", "Eiffle_Tower":"France", "Great_Wall":"China", "Hong_Kong":"Hong_Kong", "Istanbul":"Turkey", "Kuala_Lampur":"Malasyia", "London":"UK", "Big_Ben":"London", "Machu_Picchu":"Peru", "Marina":"Dubai", "Milan_Cathedral":"Italy", "Milan":"Itlay", "New_York":"USA", "Notre_Dame":"France", "Opera_House":"Sidney","Shanghai":"China", "Singapore":"Singapore", "Seoul":"South Korea", "St_Petersburg":"Russia","Taj_Mahal":"India", "Tokyo":"Japan", "Vienna":"Italy"]

let IMAGES_OF_CITIES = ["Japan":["Tokyo", "Kyoto", "Kamakura", "Osaka", "Yokohama"], "USA":["New York", "Chicago","Los Angelos", "San Fransisco", "Boston", "Philadelphia"], "UK":["London", "Manchester", "Wales"]]

let SEGUE_IDENTIFER = "Detail"
let STORYBORD_IDENTIFIER = "DetailView"


//extension

extension UIView {
    func setShadow(view:UIView){
        view.backgroundColor = VIEW_BACKGROUND
        //view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 1.0).CGColor
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 3.0
        view.layer.shadowOffset = CGSizeMake(0.2, 0.9)
    }
}
