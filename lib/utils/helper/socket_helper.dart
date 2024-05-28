

import 'package:flutter_demo/data/api_provider/api_constant.dart';
import 'package:flutter_demo/utils/helper/storage_helper.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

const createBookingEmitter = "createBooking";
const bookingStatusEmitter = "bookingStatus";
const requestListEmitter = "requestList";
const bookingListEmitter = "bookingList";
const bookingByIdEmitter = "bookingById";


const bookingStatusListener = "bookingStatusListener";
const requestListListener= "requestListListener";
const bookingListListener = "bookingListListener";
const bookingByIdListener = "bookingByIdListener";
const commentsListener = "commentsListener";


// Function taking a String and returning nothing (void)


class SocketHelper{
  static final SocketHelper _singleton = SocketHelper._internal();

  SocketHelper._internal();

  factory SocketHelper() => _singleton;

  IO.Socket? _socketIO;

  bool isConnected=false;

  IO.Socket? getSocket()  => _socketIO;

  void init() {
    if(_socketIO!=null || StorageHelper().getUserToken() == null
    || isConnected == true){
      return;
    }
    _socketIO = IO.io(
        ApiConstants.socketUrl,
        IO.OptionBuilder().setTransports(['websocket'])  // for Flutter or Dart VM
            .enableAutoConnect()
            .enableForceNewConnection()
            // .setPath("/tracking")
            .setQuery({'token': StorageHelper().getUserToken()})
            .build());
    waitForConnection();
    _initListener();
  }


  _initListener(){
    _socketIO?.onConnect((data) {
      isConnected = true;
      // if(StorageHelper().getIsLoggedIn()){
      //   connectUser();
      // }
      print('connected');
    });
    _socketIO?.onConnectError((data) {
      isConnected = false;
      print(data.toString());
    });
    _socketIO?.onError((data) {
      print(data.toString());
    });
    _socketIO?.on("connection", (data) {
      print("user connected" + data.toString());
    });
  }


  void disconnect(){
    _socketIO?.disconnect();
    isConnected = false;
    _socketIO = null;
  }
  Future<void> waitForConnection() async {
    while (!SocketHelper().isConnected) {
      await Future.delayed(const Duration(milliseconds: 100)); // Avoid busy waiting
    }
    // Connection established! Proceed with your code here.
  }
}