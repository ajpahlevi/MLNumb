//
//  imageInteractor.swift
//  MLNumb
//
//  Created by Achmad Jeihan Pahlevi on 10/24/17.
//  Copyright (c) 2017 Achmad Jeihan Pahlevi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol imageBusinessLogic {
    func predict(_ image: UIImage)
}

class imageInteractor: imageBusinessLogic {
    var presenter: imagePresentationLogic?
    
    let model = SqueezeNet()
    
    func predict(_ image: UIImage) {
        if let pixelBuffer = image.resize(to: CGSize(width: 227, height: 227)).pixelBuffer() {
            if let result = try? model.prediction(image: pixelBuffer) {
                presenter?.present(image, withPrediction: result.classLabel)
            }
        }
    }
}
