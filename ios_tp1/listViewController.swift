//
//  ListViewController.swift
//  ios_tp1
//
//  Created by  on 04/03/2020.
//  Copyright © 2020 dordoloy. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTableView: UITableView!
    let cellID:String = "ListTableViewCellID"
    
    let movies: [Movie] = [Movie(poster:"alitaIcon", title: "Alita", date: "14/02/2019", synopsis: "Lorsqu’Alita se réveille sans aucun souvenir de qui elle est, dans un futur qu’elle ne reconnaît pas, elle est accueillie par Ido, un médecin qui comprend que derrière ce corps de cyborg abandonné, se cache une jeune femme au passé extraordinaire. Ce n’est que lorsque les forces dangereuses et corrompues qui gèrent la ville d’Iron City se lancent à sa poursuite qu’Alita découvre la clé de son passé - elle a des capacités de combat uniques, que ceux qui détiennent le pouvoir veulent absolument maîtriser. Si elle réussit à leur échapper, elle pourrait sauver ses amis, sa famille, et le monde qu’elle a appris à aimer."), Movie(poster:"avatarIcon", title: "Avatar", date: "16/12/2009", synopsis: "Malgré sa paralysie, Jake Sully, un ancien marine immobilisé dans un fauteuil roulant, est resté un combattant au plus profond de son être. Il est recruté pour se rendre à des années-lumière de la Terre, sur Pandora, où de puissants groupes industriels exploitent un minerai rarissime destiné à résoudre la crise énergétique sur Terre.")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listTableView.dataSource = self
        self.listTableView.delegate = self
        
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        listTableView.register(nib, forCellReuseIdentifier: cellID)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ListTableViewCell

        let movie = movies[indexPath.item]
        
        cell.setCell(poster: UIImage(named: movie.poster)!, title: movie.title, date: movie.releaseDate, synopsis: movie.synopsis)
    
      return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.item)
    }

}
