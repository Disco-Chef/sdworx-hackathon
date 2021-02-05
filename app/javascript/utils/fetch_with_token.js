import { csrfToken } from "@rails/ujs";
// https://kitt.lewagon.com/knowledge/tutorials/fetch_in_rails
//
//
const fetchWithToken = (url, options) => {
  options.headers = {
    "X-CSRF-Token": csrfToken(),
    ...options.headers
  };

  return fetch(url, options);
}

export { fetchWithToken };
