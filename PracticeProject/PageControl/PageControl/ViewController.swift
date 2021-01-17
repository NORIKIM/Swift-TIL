//
//  ViewController.swift
//  PageControl
//
//  Created by 김지나 on 2021/01/17.
//

// 참고 : https://www.ioscreator.com/tutorials/page-control-ios-tutorial

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var movies: [String] = ["bad-boys","joker","hollywood"]
    var frame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = movies.count
        setupScreen()
        scrollView.delegate = self
    }

    func setupScreen() {
        for idx in 0 ..< movies.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(idx)
            frame.size = scrollView.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: movies[idx])
            
            self.scrollView.addSubview(imgView)
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(movies.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }

}

