//
//  TopRatedViewController.swift
//  BAZProject
//
//  Created by Mario Arceo on 01/02/23.
//

import UIKit

class TopRatedViewController: UITableViewController {
    
    var movies: [Movie] = []
    let movieApi = MovieAPI()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movies = movieApi.getMovies(ofType: .topRated)
        
        tableView.reloadData()
    }
}

    // MARK: - TableView's DataSource

extension TopRatedViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "TrendingTableViewCell")!
    }
    
}

    // MARK: - TableView's Delegate

extension TopRatedViewController {
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var config = UIListContentConfiguration.cell()
        config.text = movies[indexPath.row].title
        config.image = movies[indexPath.row].imagePrincipal
        cell.contentConfiguration = config
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "MovieDetails", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        viewController.myMovie = movies[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    
}

