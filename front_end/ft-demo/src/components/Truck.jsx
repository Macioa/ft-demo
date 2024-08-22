import { customTruckIcon } from "./Icons";
import {
    Marker, Popup
  } from "react-leaflet";

const Truck = ({
  applicant,
  facilitytype,
  dayshours,
  fooditems,
  latitude,
  longitude,
}) => {
  return (
    <Marker position={[latitude, longitude]} icon={customTruckIcon}>
      <Popup>
        <div>
          <h2>{applicant}</h2>
          <h3>{facilitytype}</h3>
          <h4>{dayshours}</h4>
          <br />
          <br />
          <p>{fooditems}</p>
        </div>
      </Popup>
    </Marker>
  );
};

export default Truck;
