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

### Filtering All BuildingAccessAppointments

The following properties of the BuilidngAccessAppointments model currently support filtering:

- `floor` : number
- `buildingId` : number
- `startAt` : timestamp
- `endAt` : timestamp
- `userId` : number
- `cancelledAt` : timestamp
- `updatedAt` : timestamp

Supported operations:

- between
- ends_with
- eq
- gt
- gte
- ilike
- in
- lt
- lte
- ne
- starts_with'

Example(s)

**All Appointments Updated AFTER a specific datetime**
```js
axios({
  method: 'GET',
  url: `${PROOF_API_HOST}/api/building_access_appointments?filter[updatedAt][value]=2020-11-13T15:15:34.088Z&filter[updatedAt][operation]=gt`,
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
      "id": 770,
      "buildingId": 160,
      "buildingName": "75 Jarvis St.",
      "cacheKey": "building_access_appointments/770",
      "displayKey": "770",
      "duration": 120,
      "endAt": "2020-11-12T13:00:00.000-0800",
      "endTime": "13:00",
      "errors": {},
      "floor": "2",
      "isCancelled": false,
      "routingId": null,
      "slug": "770",
      "startAt": "2020-11-12T11:00:00.000-0800",
      "startTime": "11:00",
      "timezone": "America/Whitehorse",
      "userId": 214
    }
  ],
  "meta": {
    "pagination": {
      "currentPage": 1,
      "totalPages": 1,
      "totalCount": 1,
      "perPage": 25
    }
  }
}
```

</details>


###  Ordering

You may pass in an `order` field to order the results. For example, if you would like to update by `updated_at`, you would make a request to:

`GET https://{API_HOST}/api/building_access_appointments?order=updated_at`

Example(s)

**Ordering filtered appointments**

```
axios({
  method: 'GET',
  url: `${PROOF_API_HOST}/api/building_access_appointments?filter[updatedAt][value]=2020-11-13T15:15:34.088Z&filter[updatedAt][operation]=lt&order=updated_at'`,
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
            "id": 765,
            "buildingId": 160,
            "buildingName": "75 Jarvis St.",
            "cacheKey": "building_access_appointments/765",
            "displayKey": "765",
            "duration": 60,
            "endAt": "2020-11-14T02:40:00.000-0800",
            "endTime": "02:40",
            "errors": {},
            "floor": "10",
            "isCancelled": false,
            "routingId": null,
            "slug": "765",
            "startAt": "2020-11-14T01:40:00.000-0800",
            "startTime": "01:40",
            "timezone": "America/Whitehorse",
            "updatedAt": "2020-11-13T14:59:16.866+0000",
            "userId": 209
        },
        {
            "id": 766,
            "buildingId": 160,
            "buildingName": "75 Jarvis St.",
            "cacheKey": "building_access_appointments/766",
            "displayKey": "766",
            "duration": 120,
            "endAt": "2020-11-14T07:20:00.000-0800",
            "endTime": "07:20",
            "errors": {},
            "floor": "8",
            "isCancelled": false,
            "routingId": null,
            "slug": "766",
            "startAt": "2020-11-14T05:20:00.000-0800",
            "startTime": "05:20",
            "timezone": "America/Whitehorse",
            "updatedAt": "2020-11-13T14:59:45.497+0000",
            "userId": 210
        },
        {
            "id": 767,
            "buildingId": 160,
            "buildingName": "75 Jarvis St.",
            "cacheKey": "building_access_appointments/767",
            "displayKey": "767",
            "duration": 60,
            "endAt": "2020-11-12T17:30:00.000-0800",
            "endTime": "17:30",
            "errors": {},
            "floor": "6",
            "isCancelled": false,
            "routingId": null,
            "slug": "767",
            "startAt": "2020-11-12T16:30:00.000-0800",
            "startTime": "16:30",
            "timezone": "America/Whitehorse",
            "updatedAt": "2020-11-13T14:59:46.758+0000",
            "userId": 211
        },
        {
            "id": 768,
            "buildingId": 160,
            "buildingName": "75 Jarvis St.",
            "cacheKey": "building_access_appointments/768",
            "displayKey": "768",
            "duration": 60,
            "endAt": "2020-11-12T13:10:00.000-0800",
            "endTime": "13:10",
            "errors": {},
            "floor": "4",
            "isCancelled": false,
            "routingId": null,
            "slug": "768",
            "startAt": "2020-11-12T12:10:00.000-0800",
            "startTime": "12:10",
            "timezone": "America/Whitehorse",
            "updatedAt": "2020-11-13T14:59:47.506+0000",
            "userId": 212
        },
        {
            "id": 769,
            "buildingId": 160,
            "buildingName": "75 Jarvis St.",
            "cacheKey": "building_access_appointments/769",
            "displayKey": "769",
            "duration": 120,
            "endAt": "2020-11-12T20:40:00.000-0800",
            "endTime": "20:40",
            "errors": {},
            "floor": "3",
            "isCancelled": false,
            "routingId": null,
            "slug": "769",
            "startAt": "2020-11-12T18:40:00.000-0800",
            "startTime": "18:40",
            "timezone": "America/Whitehorse",
            "updatedAt": "2020-11-13T14:59:48.251+0000",
            "userId": 213
        }
    ],
    "meta": {
        "pagination": {
            "currentPage": 1,
            "totalPages": 1,
            "totalCount": 5,
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
