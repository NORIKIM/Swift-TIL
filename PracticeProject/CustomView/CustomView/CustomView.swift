//
//  CustomView.swift
//  CustomView
//
//  Created by jina on 2022/02/23.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    func initView() {
        let bundle = Bundle(for: self.classForCoder)
        let view = bundle.loadNibNamed("CustomView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    @IBAction func tap(_ sender: UIButton) {
        print("hello")
    }
    
}
