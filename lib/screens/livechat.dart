import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({super.key});

  @override
  State<LiveChatScreen> createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  // ignore: unused_field
  late GoogleMapController _mapController;
  final TextEditingController _messageController = TextEditingController();
  final LatLng _deliveryLocation = const LatLng(37.7749, -122.4194); // Example
  final CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  final String currentUser = 'User123'; // Replace with actual user ID
  final String deliveryPerson = 'DeliveryPerson456'; // Replace with actual ID

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    messages.add({
      'sender': currentUser,
      'receiver': deliveryPerson,
      'message': _messageController.text.trim(),
      'timestamp': FieldValue.serverTimestamp(),
    });

    _messageController.clear();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Live Chat',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 239, 148, 11),
      ),
      body: Column(
        children: [
          // Map Section
          Expanded(
            flex: 2,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _deliveryLocation,
                zoom: 15.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('delivery'),
                  position: _deliveryLocation,
                  infoWindow: const InfoWindow(title: 'Delivery Location'),
                ),
              },
            ),
          ),
          // Chat Section
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder(
                    stream: messages
                        .orderBy('timestamp', descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final chatMessages = snapshot.data!.docs;
                      return ListView.builder(
                        reverse: true,
                        itemCount: chatMessages.length,
                        itemBuilder: (context, index) {
                          final message = chatMessages[index];
                          final isMine = message['sender'] == currentUser;
                          return Align(
                            alignment: isMine
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 8.0),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 14.0),
                              decoration: BoxDecoration(
                                color: isMine
                                    ? const Color.fromARGB(255, 239, 148, 11)
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text(
                                message['message'],
                                style: TextStyle(
                                  color: isMine ? Colors.white : Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                // Input Section
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.grey[200],
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 239, 148, 11),
                        child: IconButton(
                          icon: const Icon(Icons.send, color: Colors.white),
                          onPressed: _sendMessage,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
