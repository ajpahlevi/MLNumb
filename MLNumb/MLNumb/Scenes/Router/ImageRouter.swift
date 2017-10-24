//
//  File.swift
//  MLNumb
//
//  Created by Achmad Jeihan Pahlevi on 10/24/17.
//  Copyright © 2017 Achmad Jeihan Pahlevi. All rights reserved.
//

import UIKit

protocol ImageRouterProtocol {
    func navigateToImage(withImage image: UIImage, fromNavigation origin: UINavigationController)
}

extension ImageRouterProtocol {
    private func getImageVC() -> imageViewController {
        let storyBoard = UIStoryboard(name: "image", bundle: nil)
        let vc = storyBoard.instantiateInitialViewController() as! imageViewController
        return vc
    }
    
    func navigateToImage(withImage image: UIImage, fromNavigation origin: UINavigationController) {
        let destination = getImageVC()
        destination.image = image
        origin.pushViewController(destination, animated: true)
    }
}
