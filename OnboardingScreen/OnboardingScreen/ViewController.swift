//
//  ViewController.swift
//  OnboardingScreen
//
//  Created by Caner Uçar on 4.11.2019.
//  Copyright © 2019 Caner Uçar. All rights reserved.
//

import UIKit
import CHIPageControl

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: CHIPageControlFresno!
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
        }
    }
    var slides:[Slide] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        //self.pageControl.delegate = self
        pageControl.numberOfPages = slides.count
      //  pageControl.currentPage = 0
        //view.bringSubview(toFront: pageControl)
//        //self.pageControl.delegate = self
//        let pageControlx = LXPageControl()
//        self.view.addSubview(pageControlx)
        let pageControl = CHIPageControlFresno(frame: CGRect(x: 0, y:0, width: 100, height: 20))
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func createSlides() -> [Slide] {

        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(named: "stevejobs")
        slide1.titleLabel.text = "A real-life bear"
        slide1.descLabel.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "billgates")
        slide2.titleLabel.text = "A real-life bear"
        slide2.descLabel.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = UIImage(named: "bojack")
        slide3.titleLabel.text = "A real-life bear"
        slide3.descLabel.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        return [slide1, slide2, slide3]
    }
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        //pageControl.currentPage = Int(pageIndex)
        
        scrollView.contentOffset.y = 0.0
    }

}



