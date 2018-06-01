//
//  ViewController.swift
//  heroTransitions
//
//  Created by Rohan Lokesh Sharma on 01/06/18.
//  Copyright © 2018 Rohan Lokesh Sharma. All rights reserved.
//

import UIKit
import Hero
class ViewController: UIViewController {
    
    
    lazy var button1:UIButton = {
        let button = UIButton(frame: CGRect.zero);
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setTitle("Click for magic move thingy", for: .normal);
        button.backgroundColor = .blue;
        button.addTarget(self, action: #selector(didClickButton1), for: .touchUpInside)
        button.hero.id = "button1"
        return button;
    }()
    lazy var button2:UIButton = {
        let button = UIButton(frame: CGRect.zero);
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setTitle("Click for nav controller template transitions", for: .normal);
        button.backgroundColor = .black;
        button.addTarget(self, action: #selector(didClickButton2), for: .touchUpInside)
        button.titleLabel?.numberOfLines = 0;
        button.hero.id = "button2"
        return button;
    }()
    var animatableView :UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.backgroundColor = .yellow;
        view.hero.id = "test"
        return view;
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .white;
        self.navigationController?.hero.isEnabled = true; //imp

    }
    @objc func didClickButton1(){
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    @objc func didClickButton2(){
        print("did click");
        self.navigationController?.hero.navigationAnimationType = .selectBy(presenting: .zoomSlide(direction: .left), dismissing: .zoomSlide(direction: .right))
        let newVC = UIViewController()
        newVC.view.backgroundColor = .green
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    func setupViews(){
        view.addSubview(button1)
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.topAnchor,constant:100),
            button1.leftAnchor.constraint(equalTo: view.leftAnchor,constant:10),
            button1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            button1.heightAnchor.constraint(equalToConstant: 50)
            ])
        view.addSubview(button2)
        NSLayoutConstraint.activate([
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor,constant:10),
            button2.leftAnchor.constraint(equalTo: view.leftAnchor,constant:10),
            button2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            button2.heightAnchor.constraint(equalToConstant: 60)
            ])
        view.addSubview(animatableView)
        NSLayoutConstraint.activate([
            animatableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            animatableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            animatableView.topAnchor.constraint(equalTo: button2.bottomAnchor,constant: 10),
            animatableView.heightAnchor.constraint(equalToConstant: 200)
            ])
        view.bringSubview(toFront: button1)
        view.bringSubview(toFront: button2)
    }
}

