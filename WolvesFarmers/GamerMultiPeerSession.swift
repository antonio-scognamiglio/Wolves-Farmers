//
//  GamerMultiPeerSession.swift
//  WolvesFarmers
//
//  Created by Simona Ettari on 16/01/23.
//

import MultipeerConnectivity
import os
import SwiftUI

class GamerMultiPeerSession: NSObject, ObservableObject {
    
    var viewModel: CardViewModel? = nil
    
    private let serviceType = "Hanabi"
    private var session: MCSession
    var myPeerId = MCPeerID(displayName: UIDevice.current.name)
    private var serviceAdvertiser: MCNearbyServiceAdvertiser
    private var serviceBrowser: MCNearbyServiceBrowser
    private var log = Logger()
    var isMaster:Bool = false
    var cards: [Card] = []
    
    @Published var recvdInvite: Bool = false
    @Published var recvdInviteFrom: MCPeerID? = nil
    @Published var invitationHandler: ((Bool, MCSession?) -> Void)?
    
    @Published var connectedPeers: [MCPeerID] = []
    
    init(username: String) {
        let peerID = MCPeerID(displayName: username)
        self.myPeerId = peerID

        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .none)
        serviceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: serviceType)
        serviceBrowser = MCNearbyServiceBrowser(peer: peerID, serviceType: serviceType)
        super.init()

        session.delegate = self
        serviceAdvertiser.delegate = self
        serviceBrowser.delegate = self

        serviceAdvertiser.startAdvertisingPeer()
        serviceBrowser.startBrowsingForPeers()
    }
    
    func assignUsername(username: String) -> MCPeerID {
        let peerID = MCPeerID(displayName: username)
        self.myPeerId = peerID
        return peerID
    }
    
    override init() {
        
        precondition(Thread.isMainThread)
        self.session = MCSession(peer: myPeerId)
        
        self.serviceAdvertiser = MCNearbyServiceAdvertiser(peer: myPeerId, discoveryInfo: nil, serviceType: serviceType)
        self.serviceBrowser = MCNearbyServiceBrowser(peer: myPeerId, serviceType: serviceType)
        
        super.init()
        
        session.delegate = self
        serviceAdvertiser.delegate = self
        serviceBrowser.delegate = self
        
        serviceAdvertiser.startAdvertisingPeer()
        serviceBrowser.startBrowsingForPeers()
    }
    
    deinit {
        self.serviceAdvertiser.stopAdvertisingPeer()
        self.serviceBrowser.stopBrowsingForPeers()
    }
    
//    func send(isMaster: Bool) -> Bool {
//        precondition(Thread.isMainThread)
//        //guard let data = try? Data(isMaster.description.data(using: .unicode)!) else { return }
//        
//        if !session.connectedPeers.isEmpty {
//            do {
//                try session.send(Data(isMaster.description.data(using: .unicode)!), toPeers: session.connectedPeers, with: .reliable)
//            } catch {
//                log.error("Error for sending: \(String(describing: error))")
//            }
//        }
//        return isMaster
//    }
    
    func send(cards: [Card], isMaster: Bool) -> (Bool, [Card]) {
        precondition(Thread.isMainThread)
        
        if !session.connectedPeers.isEmpty {
          
            if (!isMaster) {
                do {
//                    try session.send(Data(card.name.description.data(using: .unicode)!), toPeers: session.connectedPeers, with: .reliable)
                    let data = try JSONEncoder().encode(cards)
                    try session.send(data, toPeers: session.connectedPeers, with: .reliable)
                      
                } catch {
                    log.error("Error sending: \(String(describing: error))")
                }
            } else {
                do {
                    try session.send(Data(isMaster.description.data(using: .utf8)!), toPeers: session.connectedPeers, with: .reliable)
                } catch {
                    log.error("Error sending: \(String(describing: error))")
                }
            }
        }
        return (isMaster, cards)
    }
}

extension GamerMultiPeerSession: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        precondition(Thread.isMainThread)
        log.error("ServiceAdvertiser didNotStartAdvertisingPeer: \(String(describing: error))")
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        precondition(Thread.isMainThread)
        log.info("didReceiveInvitationFromPeer \(peerID)")
        invitationHandler(true, session)
    }
}

extension GamerMultiPeerSession: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
        log.error("ServiceBrowser didNotStartBrowsingForPeers: \(String(describing: error))")
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String: String]?) {
        log.info("ServiceBrowser found peer: \(peerID)")
        browser.invitePeer(peerID, to: session, withContext: nil, timeout: 10)
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        log.info("ServiceBrowser lost peer: \(peerID)")
    }
}

extension GamerMultiPeerSession: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        log.info("peer \(peerID) didChangeState: \(state.debugDescription)")
        DispatchQueue.main.async {
            self.connectedPeers = session.connectedPeers
        }
    }
    
//    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
//        print("aaaaaa")
//        print(String(data: data, encoding: .unicode).flatMap(Bool.init))
//        isMaster = (String(data: data, encoding: .unicode).flatMap(Bool.init) != nil)
//        print("MASTER\(isMaster)")
//    }
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print("aaaaaa")
        
        if let decodedCards = try? JSONDecoder().decode([Card].self, from: data) as [Card] {
            viewModel?.decoded(cards: decodedCards)
            
        } else {
            // Qui è quale
            print(String(data: data, encoding: .utf8))
            isMaster = (String(data: data, encoding: .unicode).flatMap(Bool.init) != nil)
            print("MASTER\(isMaster)")
        }
        
    }
    
    
    
    public func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        log.error("Receiving streams is not supported")
    }
    
    public func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        log.error("Receiving resources is not supported")
    }
    
    public func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        log.error("Receiving resources is not supported")
    }
}

extension MCSessionState: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .notConnected:
            return "notConnected"
        case .connecting:
            return "connecting"
        case .connected:
            return "connected"
        @unknown default:
            return "\(rawValue)"
        }
    }
}
