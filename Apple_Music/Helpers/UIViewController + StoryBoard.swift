//
//  UIViewController + StoryBoard.swift
//  Apple_Music
//
//  Created by Антон on 13.02.2021.
//

import Foundation
import UIKit

extension UIViewController{
    
    class func loadFromStoryboard<T: UIViewController>() -> T{
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T{
            return viewController
        }else{
            fatalError("Error: No initial view controller in \(name) storyboard!")
           
        }
    }
}
