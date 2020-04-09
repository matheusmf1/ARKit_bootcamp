//
//  ViewController.swift
//  World Tracking
//
//  Created by Matheus Mandotti on 09/04/20.
//  Copyright © 2020 Matheus Mandotti. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!


    let configuration = ARWorldTrackingConfiguration()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // -> Feature Points are the yellow points, it shows how the device is detecting the world
        // -> WordOrigin is the initial start point of device
        self.sceneView.debugOptions = [ ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin ]
        
        // make sure a soon the view loads it has this config, this able the device detecs orientation all time
        self.sceneView.session.run( configuration )
        
        // this enables light reflection
        self.sceneView.autoenablesDefaultLighting = true
    }
    
    
    
    
    @IBAction func addBtn(_ sender: Any) {
        
        // A node is just a position in space, there is no shape or size, it's invisable
        let node = SCNNode()
        
        // To let us see the node, let's create some shape
        node.geometry = SCNBox( width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.02 )
        
        // FirstMaterial defines the appearance of surface
        
        // Specular is the light that reflects of the susface
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        
        // Diffuse represents the color spread into the box
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
        
        // lets just aadd random numbers
        let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        
        // we need to specify the node's positon x( red ),y( green ),z( blue )
        node.position = SCNVector3( x,y,z )
        
        
        //To add the node to the sceneView, the root node is inside the scene, adding an element as a child of root will always refer to the starting point
        self.sceneView.scene.rootNode.addChildNode( node )
        
    }
    

    @IBAction func reset(_ sender: Any) {
        self.restartSession()
    }
    
    
    func restartSession() {
         // first pause the session
        self.sceneView.session.pause()
        // remove the box from root node
        self.sceneView.scene.rootNode.enumerateChildNodes { ( node, _ ) in node.removeFromParentNode() }
        
        // forget old position and get a new one
        self.sceneView.session.run( configuration, options: [ .resetTracking, .removeExistingAnchors ] )
    }
    
    
    func randomNumbers( firstNum: CGFloat, secondNum: CGFloat ) -> CGFloat {
        return CGFloat( arc4random() ) / CGFloat( UINT32_MAX ) * ( firstNum - secondNum ) + min( firstNum, secondNum )
    }
}
