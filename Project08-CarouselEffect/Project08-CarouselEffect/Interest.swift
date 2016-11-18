//
//  Interest.swift
//  Project08-CarouselEffect
//
//  Created by 王迁 on 2016/11/17.
//  Copyright © 2016年 王迁. All rights reserved.
//

import UIKit

class Interest {
    var image: UIImage
    var title: String
    
    init(title: String, imageName: String) {
        self.image = UIImage(named: imageName)!
        self.title = title
        
        
    }
    
    static func createInterests() -> [Interest] {
        return [
            Interest(title: "Hello there, i miss u.", imageName: "pic0"),
            Interest(title: "🐳🐳🐳🐳🐳", imageName: "pic3"),
            Interest(title: "Training like this, #bodyline", imageName: "pic1"),
            Interest(title: "I'm hungry, indeed.", imageName: "pic4"),
            Interest(title: "Dark Varder, #emoji", imageName: "pic2"),
            Interest(title: "I have no idea, bitch", imageName: "pic5"),
        ]
    }
}
