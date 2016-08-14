//
//  extentions.swift
//  MPStarRatingDEMO
//
//  Created by Medin Piranej on 14/08/16.
//  Copyright © 2016 Medin Piranej. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    
    func removeAllSubViews(){
        for (var i = 0 ; i < subviews.count ; i++){
            subviews[i].removeFromSuperview()
        }
    }
    
    func loadViewFromNib(nibName:String) -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let v = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return v
    }
    
}