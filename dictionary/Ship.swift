//
//  Ship.swift
//  dictionary
//
//  Created by 関根康太 on 2017/12/05.
//  Copyright © 2017年 関根康太. All rights reserved.
//

import Foundation
import UIKit

class Ship {
    var image : UIImage!
    var shipName : String!
    var detailName : String!
    var content :  String!
    
    init(image : UIImage,shipName : String,detailName : String,content : String) {
        
        self.image = image
        self.shipName = shipName
        self.detailName = detailName
        self.content = content
    }
    
    
    
    
}
