//
//  DetailsViewController.swift
//  Project-1_Swift
//
//  Created by narendra.vadde on 16/05/21.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var selectedImage: String?
    var totalImages: Int?
    var selectedImageCount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \((selectedImageCount ?? 0) + 1) of \(totalImages ?? 0)"
        navigationItem.largeTitleDisplayMode = .never
        
        image.image = UIImage(named: selectedImage ?? "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
