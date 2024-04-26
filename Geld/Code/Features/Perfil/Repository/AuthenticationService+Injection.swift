//
//  AuthenticationService+Injection.swift
//  Geld
//
//  Created by Roberto Edgar Geiss on 21/04/24.
//

import Foundation
import Factory

extension Container 
{
  public var authenticationService: Factory<AuthenticationService> 
    {
    self { AuthenticationService() }.singleton
  }
}
