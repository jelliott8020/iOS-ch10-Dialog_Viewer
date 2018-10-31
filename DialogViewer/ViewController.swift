//
//  ViewController.swift
//  DialogViewer
//
//  Created by Josh Elliott on 10/31/18.
//  Copyright © 2018 JoshElliott. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    private var sections = [
        
            ["header": "First Witch",
             "content" : "Hey, when will the three of us meet up later?"],
            ["header" : "Second Witch",
             "content" : "When everything's straightened out."],
            ["header" : "Third Witch",
             "content" : "That'll be just before sunset."],
            ["header" : "First Witch",
             "content" : "Where?"],
            ["header" : "Second Witch",
             "content" : "The dirt patch."],
            ["header" : "Third Witch",
             "content" : "I guess we'll see Mac there."]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.register(ContentCell.self, forCellWithReuseIdentifier: "CONTENT")
        var contentInset = collectionView!.contentInset
        
        contentInset.top = 20
        collectionView!.contentInset = contentInset
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func wordsInSection(section: Int) -> [String] {
        let content = sections[section]["content"]
        let spaces = NSCharacterSet.whitespacesAndNewlines
        let words = content?.components(separatedBy: spaces)
        return words!
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let words = wordsInSection(section: section)
        return words.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            let words = wordsInSection(section: indexPath.section)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                "CONTENT", for: indexPath) as! ContentCell
            cell.maxWidth = collectionView.bounds.size.width
            cell.text = words[indexPath.row]
            return cell
    }


}

