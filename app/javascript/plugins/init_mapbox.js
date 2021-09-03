import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/k06kw02/ckszz90e17sx618o7dcya4qv9',
  });
};
// center: [52.6358333, -1.1390972]
// style: 'mapbox://styles/mapbox/streets-v11'

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window);
    const el = document.createElement('div')
    el.setAttribute('data-id', marker.id)
    el.setAttribute('aria-label', "Map marker")
    el.setAttribute('class', "mapboxgl-marker mapboxgl-marker-anchor-center")
    el.setAttribute('class', "transform: translate(-50%, -50%) translate(425px, 415px) rotateX(0deg) rotateZ(0deg)")

    new mapboxgl.Marker(el)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 10 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
