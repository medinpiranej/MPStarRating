//
//  MPStarRating.swift

import Foundation
import UIKit
@IBDesignable class MPStarRating:UIView{
    
    @IBOutlet weak var view: UIView!;
    
    @IBOutlet weak var starContainer: UIStackView!
    
    var rating = 0;
    var stars = 5;
    
    var starsWidth = 40;
    var starsHeight = 40;
    
    var starFull = UIImage(named: "star_full")
    var starEmpty = UIImage(named: "star_empty")
    
    var canEdit = false;
    
    var delegate : MPStarRatingDelegate!;
    
    @IBInspectable var starRating: Int
        {
        get
        {
            return rating
        }
        set
        {
            rating = newValue;
            refreshStars()
        }
    }
    
    @IBInspectable var starNumber: Int
        {
        get
        {
            return stars;
        }
        set
        {
            stars = newValue;
            refreshStars()
        }
    }
    
    @IBInspectable var StarWidth: Int
        {
        get
        {
            return starsWidth;
        }
        set
        {
            starsWidth = newValue;
            refreshStars()
        }
    }
    
    @IBInspectable var StarHeight: Int
        {
        get
        {
            return starsHeight;
        }
        set
        {
            starsHeight = newValue;
            refreshStars()
        }
    }
    
    @IBInspectable var starFullImage: UIImage{
        get
        {
            return starFull!;
        }
        set
        {
            starFull = newValue;
            refreshStars()
        }
    }
    
    @IBInspectable var starEmptyImage: UIImage{
        get
        {
            return starEmpty!;
        }
        set
        {
            starEmpty = newValue;
            refreshStars()
        }
    }
    
    @IBInspectable var Editable: Bool{
        get
        {
            return canEdit;
        }
        set
        {
            canEdit = newValue;
        }
    }
    
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib("MPStarRating")
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
        
        refreshStars();
    }
    
    func refreshStars(){
        starContainer.removeAllSubViews()
        
        for (var i = 0 ; i < stars ; i++ ){
            let imageView = UIButton();
            
            if(rating > i){
                imageView.setBackgroundImage(starFull, forState: UIControlState.Normal)
            }
            else{
                imageView.setBackgroundImage(starEmpty, forState: UIControlState.Normal)
            }
            
            var width : CGFloat = 0;
            
            if(starsWidth <= 0){
                width = CGFloat(starContainer.bounds.size.width / CGFloat(stars));
            }
            else{
                width = CGFloat(starsWidth);
            }
            
            let x = ( i > 0 ? (width * CGFloat(i)) : 0 );
            let y : CGFloat = 0;
            let height = CGFloat(starsHeight);
            
            imageView.frame = CGRect(x: x, y: y, width: width, height: height)
            
            imageView.addTarget(self, action: "starClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            
            imageView.tag = (i + 1);
            
            starContainer.addSubview(imageView);
        }
    }
    
    func starClicked(sender:UIButton){
        if(self.canEdit){
            rating = sender.tag;
            if(self.delegate != nil){
                self.delegate.starRateEdited(Double(rating))
            }
            
            self.refreshStars()
        }
    }
}