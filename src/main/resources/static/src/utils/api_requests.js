const API_URLS = {
    backendURL: "http://localhost:8080"
}

function sendQuery(url, method) {
    return fetch(url, {
        method
    });
}

function makeURL(endpoint, params) {
    let url = `${API_URLS.backendURL}/${endpoint}`;
    if (params) {
        url += '?'
        for(const param in params) {
            url += `${param}=${params[param]}&`
        }
        url = url.substring(0, url.length - 1);
    }
    return url;
}

export function get_stat(categoryId) {
    const url = makeURL('api/stat', {category_id: categoryId});
    return sendQuery(url, "GET");
}

export function get_categories() {
    const url = makeURL('api/categories');
    return sendQuery(url, "GET");
}

export function get_current_username() {
    const url = makeURL('api/employee/name');
    return sendQuery(url, "GET");
}