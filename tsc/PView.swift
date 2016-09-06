//
//  PView.swift
//  pages
//
//  Created by Bobo on 15/12/31.
//  Copyright © 2015年 myname. All rights reserved.
//

import UIKit


typealias addTarget = (UIButton) -> Void


class PView: NSObject {
    
    let screenSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    
    let screenCenter = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
    
    let h0: CGFloat = 0.3
    let h1: CGFloat = 0.345
    let h2: CGFloat = 0.6
    let h3: CGFloat = 0.3
    
    var dragging = false
    var atTheEnd = false
    

    
    func getPageForMainPage(VC: MainViewController) {
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: VC.view.frame.width, height: VC.view.frame.height - 64))
        let height = screenSize.height * (h0 + h1 + h2 + h3) + 20
        scrollView.contentSize = CGSize(width: 0, height: height)
        scrollView.tag = 99999
        VC.view.addSubview(scrollView)
        
        let imageNames = ["s0", "s1", "s2"]
        let frame0 = CGRect(x: 0, y: 0, width: VC.view.frame.width, height: VC.view.frame.height * h0)
        let scrolling = scrollingImagesView(frame: frame0, imagesCount: 3, imageNames: imageNames)
        scrolling.delegate = self
        scrollView.addSubview(scrolling)
        addTarget(VC: VC, view: scrolling)
        
        let timer = Timer(timeInterval: 3.0, target: self, selector: #selector(PView.movePic(timer:)), userInfo: scrolling, repeats: true)
        RunLoop.main.add(timer, forMode: RunLoopMode.defaultRunLoopMode)
        
        
        let names = ["肽", "国医", "特医", "特膳", "签到", "品牌馆", "秒抢", "超值热卖"]
        let point1 = CGPoint(x: 0, y: scrolling.frame.height)
        let eightButton = eightButtonView(point: point1, titles: names, imageNames: names)
        scrollView.addSubview(eightButton)
        addTarget(VC: VC, view: eightButton)
        
        let news = ["【200份】醉生梦死三套件", " 惊爆价：100元"]
        let newsView = infomationView(y: point1.y + eightButton.frame.height, allNews: [news], imageNames: ["罪生梦死", "s1"])
        scrollView.addSubview(newsView)
        
        let adImageView = UIImageView(frame: CGRect(x: 0, y: newsView.frame.origin.y + newsView.frame.height, width: ScreenWidth, height: ScreenHeight * h3))
        adImageView.image = UIImage(named: "s0")
        scrollView.addSubview(adImageView)
        
        let frame4 = CGRect(x: 0, y: adImageView.frame.origin.y + adImageView.frame.height, width: ScreenWidth, height: ScreenHeight * h3)
        let iconImageNames = ["med", "med", "med", "med", "med"]
        let titles = ["感冒发烧", "感冒发烧", "感冒发烧", "感冒发烧", "感冒发烧"]
        let noPrices = ["¥200", "¥200", "¥200", "¥200", "¥200"]
        let Icons = productIcons(frame: frame4, imageNames: iconImageNames, titles: titles, newPrices: noPrices, oldPrices: noPrices)
        scrollView.addSubview(Icons)
    

    }

    
    func addTarget(VC: MainViewController, view: UIView) {
        for i in view.subviews {
            if let button = i as? UIButton {
                button.addTarget(VC, action: #selector(VC.open(sender:)), for: .touchUpInside)
            }
        }
    }
    
    func blockView(frame: CGRect, imageNames: [String]) -> UIView {
        let blockView = UIView(frame: frame)
        blockView.backgroundColor = UIColor.white
        
        for i in 0..<7 {
            let button = blockButton(index: i, imageName: imageNames[i], size: blockView.frame.size)
            blockView.addSubview(button)
        }
        
        return blockView
    }
    
    
    func blockButton(index: Int, imageName: String, size: CGSize) -> UIButton {
        var frame = CGRect.zero
        var imageFrame = CGRect.zero
        var titleFrame = CGRect.zero
        
        switch index {
        case 0:
            frame = CGRect(x: 0, y: 0, width: size.width / 2.5, height: size.height / 2)
            imageFrame = frame
        case 1:
            frame = CGRect(x: size.width / 2.5, y: 0, width: size.width * 3 / 5, height: size.height / 4)
            imageFrame = CGRect(x: -10, y: 0, width: frame.height, height: frame.height)
            titleFrame = CGRect(x: frame.height * 0.8, y: frame.height * 0.2, width: 150, height: 30)
        case 2:
            frame = CGRect(x: size.width / 2.5, y: size.height / 4, width: size.width * 3 / 5, height: size.height / 4)
            imageFrame = CGRect(x: -10, y: 0, width: frame.height, height: frame.height)
            titleFrame = CGRect(x: frame.height * 0.8, y: frame.height * 0.2, width: 150, height: 30)
        case 3:
            frame = CGRect(x: 0, y: size.height / 2, width: size.width * 3 / 4, height: size.height / 4)
            imageFrame = CGRect(x: -10, y: 0, width: frame.height, height: frame.height)
            titleFrame = CGRect(x: frame.height * 0.8, y: frame.height * 0.2, width: 150, height: 30)
        case 4:
            frame = CGRect(x: 0, y: size.height * 3 / 4, width: size.width * 3 / 8, height: size.height / 4)
            imageFrame = CGRect(x: -10, y: 0, width: frame.height, height: frame.height)
            titleFrame = CGRect(x: frame.height * 0.7, y: frame.height * 0.2, width: 150, height: 30)
        case 5:
            frame = CGRect(x: size.width * 3 / 8, y: size.height * 3 / 4, width: size.width * 3 / 8, height: size.height / 4)
            imageFrame = CGRect(x: -18, y: 0, width: frame.height, height: frame.height)
            titleFrame = CGRect(x: frame.height * 0.58, y: frame.height * 0.2, width: 150, height: 30)
        case 6:
            frame = CGRect(x: size.width * 6 / 8, y: size.height / 2, width: size.width / 4, height: size.height / 2)
            imageFrame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
            titleFrame = CGRect(x: 10, y: frame.width, width: 150, height: 30)
        default:
            break
        }
        
        let button = UIButton(type: .system)
        button.frame = frame
        button.tag = 10112 + index
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        
        let imageView = UIImageView(frame: imageFrame)
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        
        if index != 0 {
            imageView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            
            let titles = [""]
            let titleLabelView = blockButtonTitleView(frame: titleFrame, index: index, title: titles[0], subTitle: titles[1])
            button.addSubview(titleLabelView)
        }
        
        button.addSubview(imageView)
        
        return button
    }
    
    func blockButtonTitleView(frame: CGRect, index: Int, title: String, subTitle: String) -> UILabel {
        let titleLabel = UILabel()
        titleLabel.frame = frame
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()
        
        let subTitleLabel = UILabel(frame: CGRect(x: 0, y: titleLabel.frame.height, width: 150, height: 30))
        subTitleLabel.text = subTitle
        subTitleLabel.textColor = UIColor.lightGray
        subTitleLabel.font = UIFont.italicSystemFont(ofSize: 11)
        titleLabel.addSubview(subTitleLabel)
        
        
        return titleLabel
    }
    
    
    // MARK: ScrollingImagesView
    
    func scrollingImagesView(frame: CGRect, imagesCount: Int, imageNames: [String]) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.frame = frame
        scrollView.contentSize = CGSize(width: screenSize.width * CGFloat(imagesCount), height: 0)
        scrollView.isPagingEnabled = true
        
        for i in 0..<imagesCount {
            let buttonFrame = CGRect(x: frame.origin.x + (frame.width * CGFloat(i)), y: 0, width: frame.width, height: frame.height)
            let imageButton = imageButtonForScrolling(frame: buttonFrame, imageName: imageNames[i])
            imageButton.tag = 10101 + i
            scrollView.addSubview(imageButton)
        }
        
        return scrollView
    }
    
    func imageButtonForScrolling(frame: CGRect, imageName: String) -> UIButton {
        let imageButton = UIButton()
        imageButton.frame = frame
        
        if imageName.contains("http://") {
//            let imageView = UIImageView(frame: imageButton.bounds)
//            imageView.loadImageWithURl(NSURL(string: imageName)!)
//            imageButton.addSubview(imageView)
//            imageButton.imageView?.loadImageWithURl(NSURL(string: imageName)!)
//            UIImage.imageWithURL(NSURL(string: imageName)!, done: { (image) -> Void in
//                imageButton.setImage(image, forState: .Normal)
//                print(image)
//            })

            
        } else {
            imageButton.setImage(UIImage(named: imageName), for: .normal)

        }
        
        return imageButton
    }
    
    // MARK: EightButtonView
    
    func eightButtonView(point: CGPoint, titles: [String], imageNames: [String]) -> UIView {
        let eightButtonView = UIView()
        eightButtonView.backgroundColor = UIColor.white
        eightButtonView.frame.origin = point
        eightButtonView.frame.size = CGSize(width: screenSize.width, height: screenSize.height * h1)
        
        for i in 0..<8 {
            let scale = i < 4 ? i : i - 4
            let distance = screenSize.height * 0.02992958
            let height = i < 4 ? distance : ((eightButtonView.frame.size.height - 20) / 2 + distance)
            let point = CGPoint(x: ((screenSize.width - 20) / 4) * CGFloat(scale) + 10, y: height)
            let smallTap = smallTapOneInEight(point: point, title: titles[i], image: imageNames[i], tag: i)
            smallTap.tag = 10104 + i
            eightButtonView.addSubview(smallTap)
        }
        
        return eightButtonView
    }
    
    
    func smallTapOneInEight(point: CGPoint, title: String, image: String, tag: Int) -> UIButton {
        let oneInEight = UIButton(type: .system)
        oneInEight.tag = tag
        oneInEight.frame.origin = point
        let oneInEightWidth = (screenSize.width - 20) / 4
        let oneInEightHeight = (screenSize.height * h1 - 20) / 2
        oneInEight.frame.size = CGSize(width: oneInEightWidth, height: oneInEightHeight)
        
        let imageHeight = oneInEightHeight * 0.5
        let titleImageView = UIImageView(frame: CGRect(x: (oneInEightWidth - imageHeight) / 2, y: 5, width: imageHeight, height: imageHeight))
        titleImageView.image = UIImage(named: image)
        oneInEight.addSubview(titleImageView)
        
        let labelHeight = oneInEightHeight * 0.2
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 10 + imageHeight, width: oneInEight.frame.size.width, height: labelHeight))
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.text = title
        oneInEight.addSubview(titleLabel)
        
        return oneInEight
    }
    
    // MARK: NewsView
    
    func infomationView(y: CGFloat, allNews: [[String]], imageNames: [String]) -> UIView {
        let extraHeight = allNews.count == 1 ? (screenSize.height * h2 - 40) / 2 : 0.0
        let infomationView = UIView(frame: CGRect(x: 0, y: y, width: ScreenWidth, height: screenSize.height * h2 - extraHeight))
        infomationView.backgroundColor = UIColor.white
        
        let point0 = CGPoint(x: 0, y: 0)
        let tView = titleView(point: point0, title: "今日最新")
        infomationView.addSubview(tView)
        
        for i in 0..<allNews.count {
            let y = 40 + ((screenSize.height * h2 - 40) / 2) * CGFloat(i)
            let point = CGPoint(x: 0, y: y)
            let newsView = genNewsButton(point: point, contents: allNews[i], imageName: imageNames[i])
            newsView.tag = 10112 + i
            infomationView.addSubview(newsView)
        }
        
        return infomationView
        
    }
    
    func titleView(point: CGPoint, title: String) -> UIView {
        let titleView = UIView()
        titleView.frame.origin = point
        titleView.frame.size = CGSize(width: screenSize.width, height: 40)
        
//        let redView = UIView(frame: CGRect(x: 10, y: 10, width: 3, height: 20))
//        redView.backgroundColor = UIColor.orange
//        titleView.addSubview(redView)
        
        let titleLabel = UILabel(frame: CGRect(x: 5, y: 5, width: titleView.frame.width, height: 30))
        titleLabel.textColor = UIColor.orange
        titleLabel.text = title
        titleView.addSubview(titleLabel)
        
//        let grayLine = UIView(frame: CGRect(x: 0, y: titleView.frame.height - 0.5, width: titleView.frame.width, height: 0.5))
//        grayLine.backgroundColor = UIColor.lightGray
//        titleView.addSubview(grayLine)
        
        return titleView
    }
    
    func genNewsButton(point: CGPoint, contents: [String], imageName: String) -> UIButton {
        let newsButton = UIButton(type: .system)
        let buttonHeight = (screenSize.height * h2 - 40) / 2
        newsButton.frame.origin = point
        newsButton.frame.size = CGSize(width: screenSize.width, height: buttonHeight)
        
        let titleLabel = UILabel(frame: CGRect(x: 5, y: buttonHeight - 50, width: ScreenWidth - 10, height: 25))
        titleLabel.text = contents[0]
        titleLabel.textColor = UIColor.lightGray
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        newsButton.addSubview(titleLabel)
        
        let contentLabel = UILabel(frame: CGRect(x: 5, y: buttonHeight - 25, width: ScreenWidth - 10, height: 25))
        contentLabel.text = contents[1]
        contentLabel.textColor = UIColor.lightGray
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        newsButton.addSubview(contentLabel)
        
        let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: ScreenWidth - 10, height: buttonHeight - 50))
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        newsButton.addSubview(imageView)
        
        return newsButton
        
    }
    
    // MARK: Product Icon
    
    func productIcons(frame: CGRect, imageNames: [String], titles: [String], newPrices: [String], oldPrices: [String]) -> UIView {
        let productIconsView = UIScrollView(frame: frame)
        productIconsView.contentSize = CGSize(width: (ScreenWidth / 3) * CGFloat(imageNames.count), height: 0)
        
        for i in 0..<imageNames.count {
            let frame = CGRect(x: (ScreenWidth / 3) * CGFloat(i), y: 0, width: ScreenWidth / 3, height: ScreenHeight * h3)
            let icon = serviceButton(frame: frame, imageName: imageNames[i], name: titles[i], prices: oldPrices[i])
            productIconsView.addSubview(icon)
        }
        
        
        return productIconsView
    }
    
    
    
    
    
    
    // MARK: ServicesView
    
    func serviceButtonView(point: CGPoint, title: String, names: [String]) -> UIView {
        let view = UIView()
        view.frame.origin = point
        view.frame.size = CGSize(width: screenSize.width, height: screenSize.height * h3)
        view.backgroundColor = UIColor.white
        
        let point0 = CGPoint(x: 0, y: 0)
        let tView = titleView(point: point0, title: title)
        view.addSubview(tView)
        
        for i in 0..<names.count {
            let scale = i < 4 ? i : i - 4
            let height = i < 4 ? 50 : (screenSize.height * h3 - 70) / 2 + 60
            let point = CGPoint(x: ((screenSize.width - 50) / 4 + 10) * CGFloat(scale) + 10, y: CGFloat(height))
            
            let size = CGSize(width: (screenSize.width - 50) / 4, height: (screenSize.height * h3 - 70) / 2)
            let frame = CGRect(origin: point, size: size)
            let button = serviceButton(frame: frame, imageName: "", name: names[i], prices: "")
            button.tag = 10114 + i
            view.addSubview(button)
        }
        
        return view
    }
    
    func produnctButtonView_1(point: CGPoint, title: String, names: [String]) -> UIView {
        let view = UIView()
        view.frame.origin = point
        let height = screenSize.height * h3 + (screenSize.height * h2 - 40) / 2
        view.frame.size = CGSize(width: screenSize.width, height: height)
        view.backgroundColor = UIColor.white
        
        let point0 = CGPoint(x: 0, y: 0)
        let tView = titleView(point: point0, title: title)
        view.addSubview(tView)
        
        for i in 0..<names.count {
            let scale = i < 2 ? i : i - 2
            let height = i < 2 ? 50 : (view.frame.height - 70) / 2 + 60
            let point = CGPoint(x: ((screenSize.width - 30) / 2 + 10) * CGFloat(scale) + 10, y: CGFloat(height))
            
            let size = CGSize(width: (screenSize.width - 30) / 2, height: (view.frame.height - 70) / 2)
            let frame = CGRect(origin: point, size: size)
            let button = serviceButton(frame: frame, imageName: "", name: names[i], prices: "")
            button.tag = 10114 + i
            view.addSubview(button)
        }
        
        return view
    }
    
    func serviceButton(frame: CGRect, imageName: String, name: String, prices: String) -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.frame = frame
        
        let imageView = UIImageView(frame: CGRect(x: 5, y: 5, width: button.frame.width - 10, height: button.frame.height * 0.6 - 10))
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        button.addSubview(imageView)
        
        let name_label = UILabel(frame: CGRect(x: 0, y: imageView.frame.height, width: button.frame.width, height: button.frame.height * 0.2))
        name_label.text = name
        name_label.textAlignment = .left
        name_label.font = UIFont.systemFont(ofSize: 15)
        button.addSubview(name_label)
        
        let price_label = UILabel(frame: CGRect(x: 0, y: name_label.frame.origin.y + name_label.frame.height, width: button.frame.width, height: button.frame.height * 0.2))
        price_label.text = prices
        price_label.textColor = UIColor.orange
        price_label.textAlignment = .left
        price_label.font = UIFont.systemFont(ofSize: 15)
        button.addSubview(price_label)
        
        return button
    }
    
    
}


extension PView: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        dragging = true
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        dragging = false
    }
    
    func movePic(timer: Timer) {
        let scrollingImages = timer.userInfo as! UIScrollView
        let onePic = scrollingImages.contentSize.width == scrollingImages.frame.size.width
                
        if dragging == false && onePic == false {
            let atStartPoint = scrollingImages.contentOffset.x == 0
            let atEndPoint = scrollingImages.contentOffset.x == scrollingImages.contentSize.width - scrollingImages.frame.width
            if atStartPoint { atTheEnd = false }
            if atEndPoint { atTheEnd = true }
            atTheEnd ? moveRight(scrollView: scrollingImages) : moveLeft(scrollView: scrollingImages)
        }
        
    }
    
    func moveRight(scrollView: UIScrollView) {
        let duration = Double(scrollView.frame.width / 640)
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
            scrollView.contentOffset.x -= scrollView.frame.width
        }, completion: nil)
        
    }
    
    func moveLeft(scrollView: UIScrollView) {
        let duration = Double(scrollView.frame.width / 640)
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.95, initialSpringVelocity: 0.5, options: [], animations: { () -> Void in
            scrollView.contentOffset.x += scrollView.frame.width
        }, completion: nil)
    }
}
