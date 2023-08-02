//
//  BottomSheetVM.swift
//  UBeer
//
//  Created by Lobster on 22.04.23.
//

import Foundation
import UIKit
import CoreLocation

final class BottomSheetVM: BottomSheetVMProtocol {
    
    private weak var coordinator: BottomSheetCoordinatorProtocol?
    private var adapter: BottomSheetAdapterProtocol
    
    private let imageDowloadService: ImageDownloadServiceProtocol
    
    private var checkIn: CheckInModel?
    private var myCoordinate: CLLocationCoordinate2D
    
    init(coordinator: BottomSheetCoordinatorProtocol,
         adapter: BottomSheetAdapterProtocol,
         imageDowloadService: ImageDownloadServiceProtocol,
         checkIn: CheckInModel?,
         myCoordinate: CLLocationCoordinate2D) {
        self.coordinator = coordinator
        self.adapter = adapter
        self.imageDowloadService = imageDowloadService
        self.checkIn = checkIn
        self.myCoordinate = myCoordinate
        adapter.setupDelegate(self)
    }
    
    private func calculateDistance() -> CLLocationDistance {
        guard let checkIn = checkIn else { return 0.0 }
        let myLocation = CLLocation(latitude: myCoordinate.latitude,
                                    longitude: myCoordinate.longitude)
        let selectedPinLocation = CLLocation(latitude: checkIn.latitude,
                                             longitude: checkIn.longitude)
        return myLocation.distance(from: selectedPinLocation)
        
    }
    
    func setupTableView(_ tableView: UITableView) {
        adapter.setupTableView(tableView)
        setupCheckInValues(checkIn: checkIn)
        downloadImage()
    }
    
    private func setupCheckInValues(checkIn: CheckInModel?) {
        guard let checkIn = checkIn else { return }
        adapter.setupCheckInValuesAndDistance(model: checkIn,
                                              distance: calculateDistance())
    }
    
    func downloadImage() {
        let imageURL = checkIn?.imageURL ?? ""
        if imageURL != "" {
            imageDowloadService.downloadImage(imageURL: imageURL) { [weak self] result in
                switch result {
                case .success(let downloadedImage):
                    DispatchQueue.main.async {
                        self?.checkIn?.image = downloadedImage
                        self?.setupCheckInValues(checkIn: self?.checkIn)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

    func shouldDismissVC(_ shouldDismiss: Bool) {
        coordinator?.shouldDismissVC(shouldDismiss)
    }
}

extension BottomSheetVM: BottomSheetHeaderDelegate {
    
    func dismissButtonDidTap() {
        shouldDismissVC(true)
    }
}
