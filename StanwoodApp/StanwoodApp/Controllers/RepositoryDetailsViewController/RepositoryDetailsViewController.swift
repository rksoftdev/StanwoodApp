//
//  RepositoryDetailsViewController.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 15/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit
import PanModal
import RxSwift

class RepositoryDetailsViewController: BaseViewController, PanModalPresentable {
    //MARK: Outlets
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryDescriptionLabel: UILabel!
    @IBOutlet weak var repositoryLanguageView: LabeledImageView!
    @IBOutlet weak var repositoryForksView: LabeledImageView!
    @IBOutlet weak var repositoryStarsView: LabeledImageView!
    @IBOutlet weak var repositoryCreationDateView: LabeledImageView!
    @IBOutlet weak var openInGitHubButton: UIButton!
    @IBOutlet weak var favouriteButton: UIButton!
    
    //MARK: Properties
    private let viewModel: RepositoryDetailsViewModelable
    private let router: RepositoryDetailsRoutable
    private let disposeBag: DisposeBag = DisposeBag()
    
    //MARK: Initializers
    init(_ viewModel: RepositoryDetailsViewModelable, _ router: RepositoryDetailsRoutable) {
        self.viewModel = viewModel
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    override func createBindingSet() {
        disposeBag.insert(
            viewModel.repositoryName.bind(to: repositoryNameLabel.rx.text),
            viewModel.repositoryDescription.bind(to: repositoryDescriptionLabel.rx.text),
            viewModel.forksCountDescription.bind(to: repositoryForksView.label.rx.text),
            viewModel.starsCountDescription.bind(to: repositoryStarsView.label.rx.text),
            viewModel.createdDateDescription.bind(to: repositoryCreationDateView.label.rx.text),
            viewModel.languageDescription.bind(to: repositoryLanguageView.label.rx.text),
            openInGitHubButton.rx.tap.bind { [weak self] _ in self?.viewModel.openGitHubUrl() },
            viewModel.isFafourite.bind { [weak self] isFavourite in
                self?.handleIsFavourite(isFavourite)
            }
        )
    }
    
    private func handleIsFavourite(_ value: Bool) {
        favouriteButton.setImage(UIImage(systemName: value
            ? "bookmark.fill"
            : "bookmark"), for: .normal)
    }
}
