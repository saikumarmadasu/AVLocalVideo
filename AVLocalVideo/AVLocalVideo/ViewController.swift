//
//  ViewController.swift
//  AVLocalVideo
//
//  Created by sai kumar madasu on 5/20/19.
//  Copyright © 2019 sai kumar madasu. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


struct Video {
    let name: String
    let url: String
}

class ViewController: UIViewController {

    @IBOutlet weak var videosTableView: UITableView!
    let videoArray = [Video(name: "The first Blender Open Movie from 2006", url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"),Video(name: "Tears of Stee", url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"), Video(name: "The Smoking Tire", url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videosTableView.delegate = self
        videosTableView.dataSource = self
    navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = videoArray[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      guard let url = URL(string: videoArray[indexPath.row].url) else { return }
        
        let player = AVPlayer(url: url)
        let controller = AVPlayerViewController()
        controller.player = player
        present(controller, animated: true)
    }
}

