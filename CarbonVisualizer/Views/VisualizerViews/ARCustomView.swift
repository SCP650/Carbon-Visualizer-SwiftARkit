//
//  ARCustomView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/3/22.
//

import SwiftUI
import Foundation
import RealityKit
import ARKit
import FocusEntity

struct ARViewContainer: UIViewRepresentable {
    @Binding var triggerObject: Bool
    @Binding var kgOfCo2: Float
    let boxResource = MeshResource.generateBox(size: 1)
    let myMaterial = SimpleMaterial(color: SimpleMaterial.Color(_colorLiteralRed: 255, green: 249, blue: 166, alpha: 0.7), roughness: 0.5, isMetallic: false)
    let directions = [SIMD3(Float(1),-2,0),SIMD3(Float(-1),-2,0),SIMD3(Float(0),-2,-1.0)];
    //move left, move right, move forward
    
    func makeUIView(context: Context) -> CustomARView {
        let arView = CustomARView(frame: .zero)//ARView(frame: .zero)
        return arView
        
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) {
        if(self.triggerObject){
            let anchorEntity = AnchorEntity()//plane: .horizontal)
            let volumn = kgOfCo2 / 1.836 //volumns in cube meters
            var directionIndex = 0//index directions
            var preModelEntity : ModelEntity? = nil
            for i in 1...Int(ceil(volumn)){
                let boxModelEntity : ModelEntity
                if(Float(i) < volumn){
                    //not the last one
                    boxModelEntity = createBoxModelEntity()
                }else{
                    //the last one
                    let height = volumn - Float(i-1)
                    boxModelEntity = createBoxModelEntity(height: height)
                    boxModelEntity.setPosition(SIMD3(0,0.5+height/2,0), relativeTo: preModelEntity)
                    anchorEntity.addChild(boxModelEntity)
                    break
                }
                if(preModelEntity != nil){
                    if((i-1)%3 != 0){
                        boxModelEntity.setPosition(SIMD3(0,1,0), relativeTo: preModelEntity)
                    }else{
                        boxModelEntity.setPosition(self.directions[directionIndex], relativeTo: preModelEntity)
                        directionIndex += 1
                        if(directionIndex>=directions.count){
                            directionIndex = 0
                        }
                    }
                    
                }
                preModelEntity = boxModelEntity
                anchorEntity.addChild(boxModelEntity)
            }
            uiView.scene.addAnchor(anchorEntity)
            uiView.HideFocusEntity()
        }else{
            uiView.scene.anchors.removeAll()
            uiView.showFocusEntity()
        }
    }
    
    func createBoxModelEntity(height: Float = -1) -> ModelEntity {
        if(height < 0){
            return ModelEntity(mesh: boxResource, materials: [myMaterial])
        }else{
            let newBox = MeshResource.generateBox(size: SIMD3(x: 1, y: height, z: 1))
            return ModelEntity(mesh: newBox, materials: [myMaterial])
        }
        
    }
    
}

class CustomARView:ARView{
    var focusEntity: FocusEntity?
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        self.setupARVIew()
        self.focusEntity = FocusEntity(on: self, style: .classic(color: .yellow))
    }
    
    func setupARVIew(){
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        if(ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh)){
            config.sceneReconstruction = .mesh
        }
        self.session.run(config)
    }
    
    public func showFocusEntity(){
        self.focusEntity = FocusEntity(on: self, style: .classic(color: .yellow))
    }
    
    public func HideFocusEntity(){
        //self.focusEntity?.destroy()
    }
    
    @objc required dynamic init?(coder decoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
     }
}
