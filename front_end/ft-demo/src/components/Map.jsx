import React, { useState, useEffect } from "react";
import {
  MapContainer,
  TileLayer,
  Marker,
  useMapEvents,
} from "react-leaflet";
import Truck from "./Truck";
import Overlay from "./Overlay";
import getTrucks from "../requests/Trucks";
import { customPinIcon } from "./Icons";
import "leaflet/dist/leaflet.css";
import "./Map.css";


const Map = () => {
  const [location, setLoc] = useState([37.7749, -122.4194]);
  const [dist, setDist] = useState(0.003);
  const [trucks, setTrucks] = useState([]);

  useEffect(() => {
    getTrucks(location[0], location[1], dist).then((data) => setTrucks(data));
  }, []);

  const MapClickHandler = () => {
    useMapEvents({
      click(e) {
        const [lat, lng] = [e?.latlng?.lat, e?.latlng?.lng] 
        setLoc([lat, lng]);
        getTrucks(lat, lng, dist).then((data) => setTrucks(data))
      },
    });
    return null;
  };

  const onOverlayChange = (lat, lng, new_dist) => {
    new_dist == dist ? setLoc([lat, lng]) : setDist(new_dist);
    getTrucks(lat, lng, new_dist).then((data) => setTrucks(data))
  };

  const overLayProps = {
    lat: location[0],
    lng: location[1],
    dist,
    onOverlayChange,
  };

  return (
    <div className="Mapp">
      <Overlay {...overLayProps} />
      <MapContainer
        center={location}
        zoom={1000}
        className="map-container"
        style={{ height: "100vh", width: "100vw" }}
      >
        <TileLayer
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        />
       {trucks.map((tr, index) => <Truck key={index} {...tr} />)}
        <Marker
          position={location}
          icon={customPinIcon}
          className=".custom-leaflet-icon"
        >
        </Marker>
        <MapClickHandler />
      </MapContainer>
    </div>
  );
};

export default Map;
