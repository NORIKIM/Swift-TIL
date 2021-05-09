//
//  QRGeneratorViewController.swift
//  QRcode
//
//  Created by 김지나 on 2021/05/09.
//  Copyright © 2021 김지나. All rights reserved.
//

import UIKit

class QRGeneratorViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        imgView.image = generateQRCode(from: "Hacking with Swift is the best iOS coding tutorial I've ever read!")
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }

}
