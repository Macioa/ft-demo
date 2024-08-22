const getTrucks = async (lng, lat, dist) =>
  fetch(
    `http://localhost:4000/api/trucks?longitude=${lat}&latitude=${lng}&distance=${dist}`
  )
    .then((response) => response.json())
    .catch((error) => console.error("Error fetching trucks:", error));

export default getTrucks;
