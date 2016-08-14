//
//  ViewController.swift
//  MPStarRatingDEMO
//
//  Created by Medin Piranej on 14/08/16.
//  Copyright © 2016 Medin Piranej. All rights reserved.
//

import UIKit

class ViewController: UIViewController,MPStarRatingDelegate {

    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var starRating: MPStarRating!
    override func viewDidLoad() {
        super.viewDidLoad()
        starRating.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func starRateEdited(rate:Double){
        text.text = "Thanks for rating us with \(rate) stars !";
    }

}

