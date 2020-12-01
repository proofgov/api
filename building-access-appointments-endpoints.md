# Buildings Endpoints

## General Setup

All examples are using https://github.com/axios/axios#axios-api.
```js
axios = require('axios')
PROOF_API_HOST = process.env.PROOF_API_HOST
PROOF_API_TOKEN = process.env.PROOF_API_TOKEN
```

## GET: Fetch BuildingAccessAppointments
### Fetch All BuildingAccessAppointments
This allows you to see all appointments in the system (that your user has access to).


```js
axios({
  method: 'GET',
  url: `${PROOF_API_HOST}/api/building_access_appointments`,
  headers: {
    'Accept': 'application/json',
    'Authorization': `Bearer ${PROOF_API_TOKEN}`,
    'Content-Type': 'application/json',
  },
}).then(response => console.log(JSON.stringify(response.data, null, 2)))
```

<details>
  <summary>Server Response</summary>

Status Code `200` - OK

```json
{
  "data": [
    {
      "id": 8,
      "buildingId": 5,
      "buildingName": "John G Diefenbaker",
      "cacheKey": "building_access_appointments/8",
      "displayKey": "8",
      "duration": 120,
      "endAt": "2020-11-15T21:00:00.000-0500",
      "endTime": "21:00",
      "errors": {},
      "floor": "RT",
      "isCancelled": false,
      "routingId": null,
      "slug": "8",
      "startAt": "2020-11-15T19:00:00.000-0500",
      "startTime": "19:00",
      "timezone": "America/Toronto",
      "userId": 129
    },
    {
      "id": 42,
      "buildingId": 5,
      "buildingName": "John G Diefenbaker",
      "cacheKey": "building_access_appointments/42",
      "displayKey": "42",
      "duration": 120,
      "endAt": "2020-11-15T21:10:00.000-0500",
      "endTime": "21:10",
      "errors": {},
      "floor": "R1",
      "isCancelled": false,
      "routingId": null,
      "slug": "42",
      "startAt": "2020-11-15T19:10:00.000-0500",
      "startTime": "19:10",
      "timezone": "America/Toronto",
      "userId": 131
    },
    {
      "id": 36,
      "buildingId": 5,
      "buildingName": "John G Diefenbaker",
      "cacheKey": "building_access_appointments/36",
      "displayKey": "36",
      "duration": 60,
      "endAt": "2020-11-15T21:10:00.000-0500",
      "endTime": "21:10",
      "errors": {},
      "floor": "S3",
      "isCancelled": false,
      "routingId": null,
      "slug": "36",
      "startAt": "2020-11-15T20:10:00.000-0500",
      "startTime": "20:10",
      "timezone": "America/Toronto",
      "userId": 135
    }
  ],
  "meta": {
    "pagination": {
      "currentPage": 1,
      "totalPages": 4,
      "totalCount": 100,
      "perPage": 25
    }
  }
}
```
</details>

### Fetch a BuildingAccessAppointment
This endpoint allows you to fetch a single appointment in more detail than provided by a bulk fetch.

```js
axios({
  method: 'GET',
  url: `${PROOF_API_HOST}/api/building_access_appointments/8`,
  headers: {
    'Accept': 'application/json',
    'Authorization': `Bearer ${PROOF_API_TOKEN}`,
    'Content-Type': 'application/json',
  },
}).then(response => console.log(JSON.stringify(response.data, null, 2)))
```

<details>
  <summary>Server Response</summary>

Status Code `200` - OK

```json
{
  "data": {
    "id": 8,
    "building": {
      "id": 5,
      "assetIdentifier": "John G Diefenbaker",
      "cacheKey": "buildings/5",
      "closingTime": "18:00",
      "displayKey": "5",
      "errors": {},
      "frenchName": "John G Diefenbaker",
      "lobbyCapacity": 10,
      "name": "John G Diefenbaker",
      "openingTime": "06:00",
      "region": null,
      "slug": "5",
      "timezone": "America/Toronto",
      "timezoneOffset": "-05:00"
    },
    "buildingId": 5,
    "buildingName": "John G Diefenbaker",
    "cacheKey": "building_access_appointments/8",
    "displayKey": "8",
    "duration": 120,
    "endAt": "2020-11-15T21:00:00.000-0500",
    "endTime": "21:00",
    "errors": {},
    "floor": "RT",
    "isCancelled": false,
    "routingId": null,
    "slug": "8",
    "startAt": "2020-11-15T19:00:00.000-0500",
    "startTime": "19:00",
    "timezone": "America/Toronto",
    "userId": 129
  },
  "meta": {
    "policy": {
      "modelId": 8,
      "modelType": "BuildingAccessAppointment",
      "userId": 4,
      "authorized": true,
      "destroy": true,
      "create": true,
      "show": true,
      "update": true,
      "edit": true,
      "export": true,
      "new": true,
      "visibilityMode": 1,
      "permittedAttributes": [
        "start_at",
        "end_at"
      ]
    }
  }
}
```
</details>

# DELETE - Cancel a BuildingAccessAppointment
This endpoint allows you to cancel an appointment. You'll need to be the owner of the appointment or an administrator

```js
axios({
  method: 'DELETE',
  url: `${PROOF_API_HOST}/api/building_access_appointments/34`,
  headers: {
    'Accept': 'application/json',
    'Authorization': `Bearer ${PROOF_API_TOKEN}`,
    'Content-Type': 'application/json',
  },
}).then(response => console.log(JSON.stringify(response.data, null, 2)))
```

<details>
  <summary>Server Response</summary>

Status Code `200` - OK

```json
{
  "data": {
    "id": 34,
    "building": {
      "id": 5,
      "assetIdentifier": "John G Diefenbaker",
      "cacheKey": "buildings/5",
      "closingTime": "18:00",
      "displayKey": "5",
      "errors": {},
      "frenchName": "John G Diefenbaker",
      "lobbyCapacity": 10,
      "name": "John G Diefenbaker",
      "openingTime": "06:00",
      "region": null,
      "slug": "5",
      "timezone": "America/Toronto",
      "timezoneOffset": "-05:00"
    },
    "buildingId": 5,
    "buildingName": "John G Diefenbaker",
    "cacheKey": "building_access_appointments/34",
    "displayKey": "34",
    "duration": 60,
    "endAt": "2020-11-17T09:10:00.000-0500",
    "endTime": "09:10",
    "errors": {},
    "floor": "S5",
    "isCancelled": true,
    "routingId": null,
    "slug": "34",
    "startAt": "2020-11-17T08:10:00.000-0500",
    "startTime": "08:10",
    "timezone": "America/Toronto",
    "userId": 134
  },
  "meta": {
    "policy": {
      "modelId": 34,
      "modelType": "BuildingAccessAppointment",
      "userId": 4,
      "authorized": true,
      "destroy": true,
      "create": true,
      "show": true,
      "update": true,
      "edit": true,
      "export": true,
      "new": true,
      "visibilityMode": 1,
      "permittedAttributes": [
        "start_at",
        "end_at"
      ]
    }
  }
}
```
</details>
