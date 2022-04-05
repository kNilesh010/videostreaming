//
//  ViewController.swift
//  VideoStreamingSwift
//
//  Created by Nilesh Kumar on 04/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let myView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    var videoStreaming = VideoStreaming()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.systemGreen
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.addTarget(self, action: #selector(didTapPlay), for: .touchUpInside)
        return button
    }()
    
    private let pauseButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pause", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.systemMint
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.addTarget(self, action: #selector(didTapPause), for: .touchUpInside)
        return button
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton()
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.addTarget(self, action: #selector(didTapClear), for: .touchUpInside)
        return button
    }()
    
    private let myTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter url"
        textField.autocorrectionType = .no
        return textField
    }()
    
    @objc func didTapPlay(){
        guard let text = myTextField.text, !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {return}
        print(text)
        videoStreaming.play(url: URL(string: text))
        
    }
    
    @objc func didTapPause(){
        videoStreaming.pause()
    }
    
    @objc func didTapClear(){
        videoStreaming.pause()
        myTextField.text = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        view.addSubview(playButton)
        view.addSubview(pauseButton)
        view.addSubview(clearButton)
        view.addSubview(myTextField)
        videoStreaming.addView(with: myView)
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = view.bounds.size.width / 1.1
        myView.frame = CGRect(x: 20, y: (view.bounds.size.height - size ) / 2, width: size, height: size)
        playButton.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 50, width: 100, height: 50)
        pauseButton.frame = CGRect(x: 20 + 100 + 20, y: view.safeAreaInsets.top + 50, width: 100, height: 50)
        clearButton.frame = CGRect(x: 260, y: view.safeAreaInsets.top + 50, width: 100, height: 50)
        myTextField.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 120, width: view.bounds.width - 40, height: 50)
    }


}

