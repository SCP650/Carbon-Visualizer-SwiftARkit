//
//  ContentView.swift
//  CarbonVisualizer
//
//  Created by Atlas on 9/2/22.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    @State private var placeObject = false
    var body: some View {
        ZStack{ ARViewContainer(triggerObject:self.$placeObject).edgesIgnoringSafeArea(.all)
            Button("Visualize"){
                placeObject = !placeObject
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var triggerObject: Bool
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        if(ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh)){
            config.sceneReconstruction = .mesh
        }
        arView.session.run(config)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if(self.triggerObject){
            let boxModelEntity = createBoxModelEntity()
            let anchorEntity = AnchorEntity(plane: .horizontal)
            anchorEntity.addChild(boxModelEntity)
            uiView.scene.addAnchor(anchorEntity)
        }else{
            uiView.scene.anchors.removeAll()
        }
    }
    
    func createBoxModelEntity() -> ModelEntity {
        let boxResource = MeshResource.generateBox(size: 1)
        let myMaterial = SimpleMaterial(color: .blue, roughness: 0.5, isMetallic: true)
        return ModelEntity(mesh: boxResource, materials: [myMaterial])
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
