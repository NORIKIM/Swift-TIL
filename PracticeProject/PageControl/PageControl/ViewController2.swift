//
//  ViewController2.swift
//  PageControl
//
//  Created by 김지나 on 2021/01/20.
//

// 참고 : https://calmone.tistory.com/entry/iOS-UIKit-in-Swift-4-UIPageControl-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0

import UIKit

class ViewController2: UIViewController, UIScrollViewDelegate {

    let page = 3
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: self.view.frame.maxY - 100, width: self.view.frame.maxX, height:50))
        pageControl.backgroundColor = UIColor.orange
        pageControl.numberOfPages = page
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: self.view.frame)
        scrollView.showsHorizontalScrollIndicator = false // Hide the vertical and horizontal indicators.
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: CGFloat(page) * self.view.frame.maxX, height: 0)
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green
        let width = self.view.frame.maxX, height = self.view.frame.maxY
        
        for i in 0 ..< page {
            let label = UILabel(frame: CGRect(x: CGFloat(i) * width + width/2 - 40, y: height/2 - 40, width: 80, height: 80))
            label.backgroundColor = .red
            label.textColor = .white
            label.textAlignment = .center
//            label.layer.masksToBounds = true
            label.text = "Page\(i)"
            label.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
//            label.layer.cornerRadius = 40.0
            scrollView.addSubview(label)
        }

        self.view.addSubview(self.scrollView)
        self.view.addSubview(self.pageControl)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // When the number of scrolls is one page worth.
        if fmod(scrollView.contentOffset.x, scrollView.frame.maxX) == 0 {
            // Switch the location of the page.
            pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
        }
    }
}
