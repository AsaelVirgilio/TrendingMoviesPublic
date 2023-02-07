//
//  DetalMovieViewController.swift
//  BAZProject
//
//  Created by hlechuga on 03/02/23.
//

import UIKit

class DetailMovieViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var imgMovieImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblReview: UILabel!
    
    //MARK: - Propperties
    var movie:Movie?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    //MARK: - Functions
    func setData(){
        if let url = URL(string: movie?.posterImagefullPath ?? "") ,let data = try? Data(contentsOf: url) {
            imgMovieImage.image = UIImage(data: data)
            }
        lblTitle.text = movie?.title?.uppercased()
        lblReview.text = movie?.overview
    }
}

//MARK: - Extensions
