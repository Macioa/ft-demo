import React, { useState } from "react";
import {
  MapContainer,
  TileLayer,
  Marker,
  Popup,
  useMapEvents,
} from "react-leaflet";
import L from "leaflet";
import Overlay from "./Overlay";
import "leaflet/dist/leaflet.css";
import "./Map.css";

const customIcon = L.icon({
  iconUrl: require("../pinicon.webp"),
  iconSize: [38, 38],
  iconAnchor: [19, 38],
  popupAnchor: [0, -38],
  className: 'custom-leaflet-icon'
});

const Map = () => {
  const [location, setLoc] = useState([37.7749, -122.4194]);
  const [dist, setDist] = useState(0.001);


  const MapClickHandler = () => {
    useMapEvents({
      click(e) {
        setLoc([e?.latlng?.lat, e?.latlng?.lng]);
      },
    });
    return null;
  };

  const onOverlayChange = (lat, lng, new_dist) => {(new_dist== dist ? setLoc([lat, lng]) : setDist(new_dist))};
  const overLayProps = {lat: location[0], lng: location[1], dist, onOverlayChange}

  return (
    <div className="Mapp">
      <Overlay {...overLayProps} />
      <MapContainer
        center={location}
        zoom={10}
        className="map-container"
        style={{ height: "100vh", width: "100vw" }}
      >
        <TileLayer
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        />
        <Marker position={location} icon={customIcon} className=".custom-leaflet-icon">
          <Popup>
            A new marker at {location[0]}, {location[1]}
          </Popup>
        </Marker>
        <MapClickHandler />
      </MapContainer>
    </div>
  );
};

export default Map;
