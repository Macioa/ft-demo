const https = require('https');
const fs = require('fs');
const url = 'https://raw.githubusercontent.com/peck/engineering-assessment/main/Mobile_Food_Facility_Permit.csv';
const filePath = 'Mobile_Food_Facility_Permit.csv';

https.get(url, (response) => {
  if (response.statusCode !== 200) {
    console.error(`Failed to get '${url}' (${response.statusCode})`);
    return;
  }

  const file = fs.createWriteStream(filePath);
  response.pipe(file);

  file.on('finish', () => {
    file.close(() => {
      console.log('Download completed.');
    });
  });
}).on('error', (err) => {
  console.error(`Error: ${err.message}`);
});