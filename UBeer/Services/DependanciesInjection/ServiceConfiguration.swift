//
//  ServiceConfiguration.swift
//  UBeer
//
//  Created by Lobster on 23.05.23.
//

import Foundation

final class ServiceConfiguration {
    
    private init() { }
    
    static func configure(container: Container) {
        container.register({ Self.authorizationService })
        container.register({ Self.alertFactory })
        container.register({ Self.realtimeDatabase })
        container.register({ Self.imageDownloadService })
    }
}


protocol AuthorizationServiceProtocol: AnyObject, LoginAuthorizationServiceProtocol & RegisterAuthorizationServiceProtocol & ForgotPasswordAuthorizationServiceProtocol & SettingsAuthorizationServiceProtocol { }

protocol RealtimeDatabaseServiceProtocol: AnyObject, CreateCheckInRealtimeDBServiceProtocol & LoadCheckInsRealtimeDBServiceProtocol { }

protocol AlertFactoryProtocol: AnyObject, AlertControllerFactoryProtocol { }

protocol DIImageDownloadServiceProtocol: AnyObject, ImageDownloadServiceProtocol { }


private extension ServiceConfiguration {
    
    static var authorizationService: AuthorizationServiceProtocol {
        return AuthorizationService()
    }
    
    static var alertFactory: AlertFactoryProtocol {
        return AlertControllerFactory()
    }
    
    static var realtimeDatabase: RealtimeDatabaseServiceProtocol {
        return RealtimeDatabaseService()
    }
    
    static var imageDownloadService: DIImageDownloadServiceProtocol {
        return ImageDowloadService()
    }
}
