import React from 'react';
import './Overlay.css';

const Overlay = ({ lat, lng, dist, onOverlayChange }) => {
  return (
    <div className="overlay">
      <div className="grid-container">
        <div className="grid-item">
          <label htmlFor="lat">Latitude:</label>
          <input
            type="number"
            id="lat"
            value={lat}
            onChange={(e) => onOverlayChange(e.target.value, lng, dist)}
          />
        </div>
        <div className="grid-item">
          <label htmlFor="lng">Longitude:</label>
          <input
            type="number"
            id="lng"
            value={lng}
            onChange={(e) => onOverlayChange(lat, e.target.value, dist)}
          />
        </div>
        <div className="grid-item">
          <label htmlFor="dist">Distance:</label>
          <input
            type="number"
            id="dist"
            value={dist}
            step="0.003" 
            onChange={(e) => onOverlayChange(lat, lng, e.target.value)}
          />
        </div>
      </div>
    </div>
  );
};

export default Overlay;