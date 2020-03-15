import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('autocomplete-location-1');
  if (addressInput) {
    places({ container: addressInput });
  }
};

const initAutocomplete2 = () => {
  const addressInput = document.getElementById('autocomplete-location-2');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
export { initAutocomplete2 };
