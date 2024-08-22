import L from "leaflet";

const customPinIcon = L.icon({
  iconUrl: require("../pinicon.png"),
  iconSize: [38, 38],
  iconAnchor: [19, 38],
  popupAnchor: [0, -38],
  className: "custom-leaflet-icon",
});
const customTruckIcon = L.icon({
  iconUrl: require("../truckicon.png"),
  iconSize: [38, 38],
  iconAnchor: [19, 38],
  popupAnchor: [0, -38],
  className: "custom-leaflet-icon",
});

export { customPinIcon, customTruckIcon };
