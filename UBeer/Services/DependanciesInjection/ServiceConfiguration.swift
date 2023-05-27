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
    }
}

protocol AuthorizationServiceProtocol: AnyObject, LoginAuthorizationServiceProtocol & RegisterAuthorizationServiceProtocol & ForgotPasswordAuthorizationServiceProtocol & SettingsAuthorizationServiceProtocol { }

protocol RealtimeDatabaseServiceProtocol: AnyObject, CreateCheckInRealtimeDBServiceProtocol { }

protocol AlertFactoryProtocol: AnyObject, AlertControllerFactoryProtocol { }

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
}
