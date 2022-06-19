import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  // Maps
  Set<Marker> _markers = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  List<LatLng> polygonLatLngs = [
    LatLng(-6.975581462489882, 107.6307637079522),
    LatLng(-6.975575564736307, 107.63055772782457),
    LatLng(-6.97600216871913, 107.63055376666827),
    LatLng(-6.9760041346352075, 107.6307597467959),
  ];
  //Ids
  int _polygonIdCounter = 1;
  int _markerIdCounter = 1;
  // Type controllers
  bool _isMarker = false;
  bool _isPolygon = false;

  void _setMarkers(LatLng point) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    setState(() {
      print(
          'Marker | Latitude: ${point.latitude} Longitude: ${point.latitude}');
      _markers.add(
        Marker(markerId: MarkerId(markerIdVal), position: point),
      );
    });
  }

  void _setPolygon() {
    final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _polygons.add(Polygon(
        polygonId: PolygonId(polygonIdVal),
        points: polygonLatLngs,
        strokeWidth: 2,
        strokeColor: Colors.yellow,
        fillColor: Colors.yellow.withOpacity(0.15)));
  }

  static final _kMapCenter = LatLng(-6.975575564736307, 107.63055772782457);
  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 14.0, tilt: 0, bearing: 0);
  static final CameraPosition _kTelU = CameraPosition(
      // bearing: 192.8334901395799,
      target: LatLng(-6.975581462489882, 107.6307637079522),
      // tilt: 59.440717697143555,
      zoom: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map TP15"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            markers: _markers,
            polygons: _polygons,
            initialCameraPosition: _kInitialPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (point) {
              if (_isMarker) {
                setState(() {
                  _markers.clear();
                  _setMarkers(point);
                });
              } else if (_isPolygon) {
                setState(() {
                  //polygonLatLngs.add(point);
                  _setPolygon();
                });
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                RaisedButton(
                    color: Colors.black54,
                    child: Text(
                      'Marker',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    onPressed: () {
                        _isMarker = true;
                        _isPolygon = false;
                    }),
                RaisedButton(
                    color: Colors.black54,
                    child: Text(
                      'Polygon',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    onPressed: () {
                        _isPolygon = true;
                        _isMarker = false;
                    })
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTelkomUniversity,
        label: const Text('To Tel-U!'),
        icon: const Icon(Icons.school),
      ),
    );
  }

  Future<void> _goToTelkomUniversity() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kTelU));
  }
}
