//
//  ViewController.swift
//  facebookfeed
//
//  Created by Megan Dsouza on 6/7/19.
//  Copyright © 2019 Megan Dsouza. All rights reserved.
//

import UIKit

let cellId = "CellID"

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        navigationItem.title = "Facebook Feed"
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        // Do any additional setup after loading the view.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width,height: 330)
    }

    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.collectionViewLayout.invalidateLayout()
    }
}

class FeedCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel : UILabel =  {
        let label = UILabel()
        label.numberOfLines = 2
        
        let attributeText = NSMutableAttributedString(string: "Harry Pup", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
       
        attributeText.append(NSAttributedString(string: "\n December 25 : California",attributes:[NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12),NSAttributedString.Key.foregroundColor: UIColor().rgb(red: 155, green: 161, blue: 161)] ))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attributeText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0,length: attributeText.string.count))
        label.attributedText = attributeText
        return label
        
    }()
    
    let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "dogpro")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let statusTextView : UITextView =
    {
        let textView = UITextView()
        textView.text = "Checkout this another cute puppy! 💁‍♀️"
        textView.font = UIFont.boldSystemFont(ofSize: 14)
       return textView 
    }()
    
    let statusImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "cutepuppy")
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let likesCommentLabel : UILabel = {
        let label = UILabel()
        label.text = "488 Likes   10.6 Comments"
        label.font = UIFont.boldSystemFont(ofSize: 10 )
        label.textColor =  UIColor().rgb(red: 155, green: 166, blue: 171)
        return label
    }()
    
    let dividerViewLine : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor().rgb(red: 226, green: 228, blue: 232)
        return view
    }()
    
    let likeButton : UIButton = setUpButton(name: "Likes", img: "fblike")
    let commentButton : UIButton = setUpButton(name: "Comments", img: "fbcomment")
    let shareButton : UIButton = setUpButton(name: "Share", img: "fbshare")
    
    static func setUpButton(name: String, img: String) -> UIButton {
        let button = UIButton()
        button.setTitle(name, for: .normal)
        button.setTitleColor(UIColor().rgb(red: 143, green: 150, blue: 163), for: .normal)
        button.setImage(UIImage(named: img), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8 , bottom: 0, right: 0)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12 )
        return button
    }
    func setupViews(){
        
        backgroundColor = .white
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likesCommentLabel)
        addSubview(dividerViewLine)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView,nameLabel)
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: statusImageView)
        addConstraintsWithFormat(format: "H:|-12-[v0]|", views: likesCommentLabel)
         addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: dividerViewLine)
        addConstraintsWithFormat(format: "V:|-12-[v0]", views: nameLabel)
        //Button Constraints
        addConstraintsWithFormat(format: "H:|[v0(v2)][v1(v2)][v2]|", views: likeButton,commentButton,shareButton)
        
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1(30)]-4-[v2]-8-[v3(24)]-8-[v4(0.4)][v5(44)]|", views: profileImageView,statusTextView,statusImageView,likesCommentLabel,dividerViewLine,likeButton)
        
        addConstraintsWithFormat(format: "V:[v0(44)]|", views: commentButton)
        addConstraintsWithFormat(format: "V:[v0(44)]|", views: shareButton)
        
        
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0(44)]-8-[v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":profileImageView,"v1":nameLabel]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":nameLabel]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0(44)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":profileImageView]))

    }
    
}

extension UIColor{
    func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView{
    func addConstraintsWithFormat(format: String, views: UIView...){
        var viewsDict = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDict[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDict))
    }
}
