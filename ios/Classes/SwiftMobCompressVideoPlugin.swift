import Flutter
import UIKit
import Photos

public class SwiftMobCompressVideoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mob_compress_video", binaryMessenger: registrar.messenger())
    let instance = SwiftMobCompressVideoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    
    if ("compress" == call.method) {

                  guard let args = call.arguments as? [String: String] else {
                fatalError("args are formatted badly")
            }
            let origem = args["origem"] ?? ""
            let destino = args["destino"] ?? ""

      // let origem = String(describing: call.arguments["origem"])
      // let destino = String(describing: call.arguments["destino"])

      let outputFileURL = URL.init(fileURLWithPath: destino)

    //let outputURL = URL.init(fileURLWithPath: tmpPath)
    let outputURL = URL.init(fileURLWithPath: origem)
    let urlAsset = AVURLAsset(url: outputURL)
     if let exportSession = AVAssetExportSession(asset: urlAsset,
                                                    presetName: AVAssetExportPresetMediumQuality) {
            exportSession.outputURL = outputFileURL
            // Changing the AVFileType enum gives you different options with
            // varying size and quality. Just ensure that the file extension
            // aligns with your choice
            exportSession.outputFileType = AVFileType.m4v                      
            //exportSession.outputFileType = AVFileTypeQuickTimeMovie
            //exportSession.shouldOptimizeForNetworkUse = true
            
            exportSession.exportAsynchronously {
                switch exportSession.status {
                case .unknown:
                  print("unknown")
                  result("unknown")
                case .waiting: break
                case .exporting: break
                case .completed:
                  result("ok")
                    // This code only exists to provide the file size after compression. Should remove this from production code
                    // do {
                    //     //let data = try Data(contentsOf: outputFileURL)
                    //     //print("File size after compression: \(Double(data.count / 1048576)) mb")
                    //     result("ok")
                    // } catch {
                    //     print("Error: \(error)")
                    //     result("erro")
                    // }
                case .failed:
                  print("failed")
                  result(exportSession.error?.localizedDescription)
                case .cancelled:
                  print("cancelled")
                  result("cancelled")

                }
            }
        }

        } else if ("getPathTemp" == call.method) {

           let filePath = NSTemporaryDirectory()+"video_picker_"
            result(filePath)
        }
        else{
          result("iOS " + UIDevice.current.systemVersion)
        }
    
    
    
  }

  
}