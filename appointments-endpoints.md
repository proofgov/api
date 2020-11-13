# Building Access Appointments

---

## GET /api/building_access_appointments/

### **Endpoint**

/api/building_access_appointments/

### **Method**

`GET`

#### Examples

##### **Retrieve All Appointments**

**Request**

```javascript
var axios = require('axios')

var config = {
  method: 'get',
  url: 'https://{API HOST}/api/building_access_appointments',
  headers: {
    Authorization: 'Bearer {API TOKEN}',
  },
}

axios(config)
  .then(function (response) {
    console.log(JSON.stringify(response.data))
  })
  .catch(function (error) {
    console.log(error)
  })
```

**Response**

Code `200`

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
      "floor": "8",
      "isCancelled": false,
      "routingId": null,
      "slug": "770",
      "startAt": "2020-11-12T11:00:00.000-0800",
      "startTime": "11:00",
      "timezone": "America/Whitehorse",
      "userId": 214
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
      "userId": 212
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
      "userId": 211
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
      "userId": 213
    },
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
      "userId": 210
    }
  ],
  "meta": {
    "pagination": {
      "currentPage": 1,
      "totalPages": 1,
      "totalCount": 6,
      "perPage": 25
    }
  }
}
```

###### **Pagination w/ Appointments**

All responses will return a `meta` property:

```
    "meta": {
        "pagination": {
            "currentPage": 1,
            "totalPages": 1,
            "totalCount": 6,
            "perPage": 25
        }
    }
```

You may pass in the `perPage` and `page` params to limit your results:

**Request**

```
var axios = require('axios');

var config = {
  method: 'get',
  url: 'http://{API HOST}/api/building_access_appointments?perPage=1&page=4',
  headers: {
    'Authorization': 'Bearer {API TOKEN}'
  }
};

axios(config)
.then(function (response) {
  console.log(JSON.stringify(response.data));
})
.catch(function (error) {
  console.log(error);
});
```

**Response**

Code `200`

```json
{
  "data": [
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
      "userId": 213
    }
  ],
  "meta": {
    "pagination": {
      "currentPage": 4,
      "totalPages": 6,
      "totalCount": 6,
      "perPage": 1
    }
  }
}
```

##### **Filtering Resutls**

The following properties of the BuilidngAccessAppointments model currently support filtering:

- `floor` : number
- `building_id` : number
- `start_at` : timestamp
- `end_at` : timestamp
- `user_id` : number
- `cancelled_at` : timestamp
- `updated_at` : timestamp

Supported operations:
-  between
-  ends_with
-  eq
-  gt
-  gte
-  ilike
-  in
-  lt
-  lte 
-  ne
-  starts_with'
-  
Example(s):

**All Appointments Updated AFTER a specific datetime**
Code `200`

**Request**

```javascript
var axios = require('axios');

var config = {
  method: 'get',
  url: 'http://{API HOST}/api/building_access_appointments?filter[updatedAt][value]=2020-11-13T15:15:34.088Z&filter[updatedAt][operation]=gt',
  headers: { 
    'Authorization': 'Bearer {API TOKEN}',
  }
};

axios(config)
.then(function (response) {
  console.log(JSON.stringify(response.data));
})
.catch(function (error) {
  console.log(error);
});

```

**Response**

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

---

## GET /api/building_access_appointments/{id}

### **Endpoint**

/api/building_access_appointments/{id}

### **Method**

`GET`

#### Examples

##### **Retrieve Details of a Single Appointment**

**Request**

Code `200`

```javascript
var axios = require('axios');

var config = {
  method: 'get',
  url: 'http://{API HOST}/api/building_access_appointments/770',
  headers: { 
    'Authorization': 'Bearer superadmin_api_token'
  }
};

axios(config)
.then(function (response) {
  console.log(JSON.stringify(response.data));
})
.catch(function (error) {
  console.log(error);
});

```

**Response**

- `data` contains all the information regarding the appointment
- `meta` contains information regarding the `policy` (what actions are permitted for your token)

```json
{
    "data": {
        "id": 770,
        "building": {
            "id": 160,
            "assetIdentifier": "jzjpjidziy",
            "cacheKey": "buildings/160",
            "closingTime": "20:00",
            "displayKey": "160",
            "errors": {},
            "frenchName": "Doors of Durin 9",
            "lobbyCapacity": 96,
            "name": "75 Jarvis St.",
            "openingTime": "08:00",
            "region": null,
            "slug": "160",
            "timezone": "America/Whitehorse",
            "timezoneOffset": "-08:00"
        },
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
    },
    "meta": {
        "policy": {
            "modelId": 770,
            "modelType": "BuildingAccessAppointment",
            "userId": 4,
            "show": true,
            "authorized": true,
            "create": true,
            "update": true,
            "destroy": true,
            "new": true,
            "edit": true,
            "export": true,
            "visibilityMode": 1,
            "permittedAttributes": [
                "start_at",
                "end_at"
            ]
        }
    }
}
```
