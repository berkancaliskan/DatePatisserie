import UIKit
import AVFoundation
import Firebase

class AdminQRScanner: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVCapturePhotoCaptureDelegate, AVCaptureMetadataOutputObjectsDelegate {
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var capturePhotoOutput: AVCapturePhotoOutput?
    var imageOrientation: AVCaptureVideoOrientation?
    var captureSession: AVCaptureSession?
    
    var previewView =  UIView()
    var lblOutput = UILabel()
    var isGiftGained = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefaultSize(view: view)
        
        let blur = UIBlurEffect(style: UIBlurEffect.Style.light)
        
        previewView.frame = view.bounds
        previewView.backgroundColor = .lightGray
        previewView.contentMode  = .scaleToFill
        view.addSubview(previewView)
        // Get an instance of the AVCaptureDevice class to initialize a
        // device object and provide the video as the media type parameter
        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
            fatalError("No video device found")
        }
        // handler chiamato quando viene cambiato orientamento
        self.imageOrientation = AVCaptureVideoOrientation.portrait
                              
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous deivce object
            let input = try AVCaptureDeviceInput(device: captureDevice)
                   
            // Initialize the captureSession object
            captureSession = AVCaptureSession()
                   
            // Set the input device on the capture session
            captureSession?.addInput(input)
                   
            // Get an instance of ACCapturePhotoOutput class
            capturePhotoOutput = AVCapturePhotoOutput()
            capturePhotoOutput?.isHighResolutionCaptureEnabled = true
                   
            // Set the output on the capture session
            captureSession?.addOutput(capturePhotoOutput!)
            captureSession?.sessionPreset = .high
                   
            // Initialize a AVCaptureMetadataOutput object and set it as the input device
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
                   
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
                   
            //Initialise the video preview layer and add it as a sublayer to the viewPreview view's layer
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = CGRect(x: 0.1 * screenWidth, y: 0.2 * screenHeight, width: 0.8 * screenWidth, height: 0.8 * screenWidth)
            previewView.layer.addSublayer(videoPreviewLayer!)

            //start video capture
            captureSession?.startRunning()
                   
        } catch {
            //If any error occurs, simply print it out
            print(error)
            return
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.captureSession?.startRunning()
    }
    
    // Find a camera with the specified AVCaptureDevicePosition, returning nil if one is not found
    func cameraWithPosition(position: AVCaptureDevice.Position) -> AVCaptureDevice? {
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .unspecified)
        for device in discoverySession.devices {
            if device.position == position {
                return device
            }
        }
        
        return nil
    }
    
    
    func increaseCoffeeCount(uid : String){
        
        let db = Firestore.firestore()
        let docRef =  db.collection("Users")
        docRef.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {

                    let documentData = document.data()
                    let documentID = document.documentID
                    
                    if documentID == uid{
                        
                        var currentCoffeeCount = 0
                        currentCoffeeCount =  unwrapToInt(variable: documentData["coffeCount"] as Any)
                        currentCoffeeCount += 1
                        
                        db.collection("Users").document("\(uid)").updateData([
                            "coffeCount": currentCoffeeCount])
                    }
                
                }}}
        
      
        
        
    }
    func metadataOutput(_ captureOutput: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is contains at least one object.
        if metadataObjects.count == 0 {
            return
        }
        
        //self.captureSession?.stopRunning()
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            if let outputString = metadataObj.stringValue {
                DispatchQueue.main.async { [self] in
                    print(outputString)
                    self.lblOutput.frame = CGRect(x: 0.1 * screenWidth, y: 0.7 * screenHeight, width: 0.8 * screenWidth, height: 0.1 * screenHeight)
                    self.view.addSubview(self.lblOutput)
                    self.lblOutput.backgroundColor = lacivert
                    self.lblOutput.text = outputString
                    
                    
                    if !isGiftGained{
                        isGiftGained = true
                    increaseCoffeeCount(uid: outputString)
                    }
//                    firebase veri artır.
                    
                    let _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
                        
                        presentVC(currentVC: self, destinationVC: AdminMainVC(), toDirection: .down)
                        
                  }

                    
                }
            }
        }
        
    }

}

