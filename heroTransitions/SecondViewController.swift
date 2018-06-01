//
//  SecondViewController.swift
//  heroTransitions
//
//  Created by Rohan Lokesh Sharma on 02/06/18.
//  Copyright © 2018 Rohan Lokesh Sharma. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    var animatableView :UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = .yellow;
        view.hero.id = "test"
        return view;
    }()
    
    var button1:UIButton = {
        let button = UIButton(frame: CGRect.zero);
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setTitle("LOL", for: .normal);
        button.backgroundColor = .blue;
        button.hero.id = "button1"
        return button;
    }()
    var button2:UIButton = {
        let button = UIButton(frame: CGRect.zero);
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setTitle("LOL1", for: .normal);
        button.backgroundColor = .black;
        button.titleLabel?.numberOfLines = 0;
        button.hero.id = "button2"
        return button;
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        self.hero.isEnabled = true;
        view.backgroundColor = .green
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(lol)))

    }

    @objc func lol(){
        self.dismiss(animated: true, completion: nil);
    }
    
}
extension SecondViewController{
    func setupViews(){
        view.addSubview(animatableView)
        NSLayoutConstraint.activate([
            animatableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            animatableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            animatableView.topAnchor.constraint(equalTo: view.topAnchor,constant: 300),
            animatableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant:-10)
            ])
        
        view.addSubview(button1)
        NSLayoutConstraint.activate([
            button1.leftAnchor.constraint(equalTo: view.leftAnchor,constant:5),
            button1.rightAnchor.constraint(equalTo: view.rightAnchor,constant:-5),
            button1.topAnchor.constraint(equalTo: view.topAnchor,constant:100),
            button1.bottomAnchor.constraint(equalTo: animatableView.topAnchor,constant:-10)
            ])
        animatableView.addSubview(button2)
        NSLayoutConstraint.activate([
            button2.leftAnchor.constraint(equalTo: animatableView.centerXAnchor,constant:5),
            button2.rightAnchor.constraint(equalTo: animatableView.rightAnchor,constant:-5),
            button2.bottomAnchor.constraint(equalTo: animatableView.bottomAnchor,constant:-5),
            button2.heightAnchor.constraint(equalToConstant: 100)
            
            ])
    }
}
