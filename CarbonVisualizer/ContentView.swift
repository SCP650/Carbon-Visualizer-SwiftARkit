//
//  ContentView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/2/22.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct ContentView : View {
    @State private var placeObject = false
    var body: some View {
        VStack{ ARViewContainer(triggerObject:self.$placeObject).edgesIgnoringSafeArea(.all)
            Button(placeObject ? "Reset":"Visualize"){
                placeObject = !placeObject
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var triggerObject: Bool
    
    func makeUIView(context: Context) -> CustomARView {
        let arView = CustomARView(frame: .zero)//ARView(frame: .zero)
        return arView
        
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) {
        if(self.triggerObject){
            let boxModelEntity = createBoxModelEntity()
            let anchorEntity = AnchorEntity(plane: .horizontal)
            anchorEntity.addChild(boxModelEntity)
            uiView.scene.addAnchor(anchorEntity)
            uiView.HideFocusEntity()
        }else{
            uiView.scene.anchors.removeAll()
            uiView.showFocusEntity()
        }
    }
    
    func createBoxModelEntity() -> ModelEntity {
        let boxResource = MeshResource.generateBox(size: 1)
        let myMaterial = SimpleMaterial(color: .blue, roughness: 0.5, isMetallic: true)
        return ModelEntity(mesh: boxResource, materials: [myMaterial])
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
        self.focusEntity?.destroy()
    }
    
    @objc required dynamic init?(coder decoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
     }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
