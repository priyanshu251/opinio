import 'package:flutter/material.dart';
import 'package:practice2/feedback_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final qrKey = GlobalKey(debugLabel: "QR"); //what is this
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            buildQRview(context),
            // Positioned(bottom: 15, left: 0, right: 0, child: buildResult()),
            Positioned(
                top: 10,
                left: screenWidth * 0.355,
                child: buildControlButtons())
          ],
        ),
      ),
    );
  }

  Widget buildControlButtons() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: FutureBuilder<bool?>(
                future: controller?.getFlashStatus(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Icon(
                        snapshot.data! ? Icons.flash_on : Icons.flash_off);
                  } else {
                    return Container();
                  }
                }),
            onPressed: () async {
              await controller?.toggleFlash();
              setState(() {});
            },
          ),
          IconButton(
            icon: FutureBuilder(
                future: controller?.getCameraInfo(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return const Icon(Icons.switch_camera);
                  } else {
                    return Container();
                  }
                }),
            onPressed: () async {
              await controller?.flipCamera();
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  // Widget buildResult() {
  //   return Container(
  //     padding: const EdgeInsets.all(12),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(8),
  //       color: Colors.white24,
  //     ),
  //     child: Center(
  //       child: Text(
  //         barcode != null ? '${barcode!.code}' : 'Scan a code',
  //         style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
  //       ),
  //     ),
  //   );
  // }

  Widget buildQRview(BuildContext context) {
    return QRView(
      key: qrKey,
      overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderWidth: 10,
          borderColor: const Color.fromARGB(255, 56, 162, 215),
          borderRadius: 20),
      onQRViewCreated: (p0) {
        setState(() {
          controller = p0;
          controller!.scannedDataStream.listen((code) {
            // setState(() {
            //   barcode = code;
            //   HapticFeedback.mediumImpact();
            // });
            Future.delayed(const Duration(milliseconds: 500)).then((_) {
              HapticFeedback.heavyImpact();
              controller?.dispose();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => FeedbackPage(code: code.code))));
            });
          });
        });
      },
    );
  }
}
