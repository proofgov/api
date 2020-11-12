# Buildings Endpoints

## General Setup

All examples are using https://github.com/axios/axios#axios-api.
```js
axios = require('axios')
PROOF_API_HOST = process.env.PROOF_API_HOST
PROOF_API_TOKEN = process.env.PROOF_API_TOKEN
```

## Fetch all Buildings
This allows you to see all buildings in the system (that your user has access to).

```js
axios({
	method: 'GET',
	url: `${PROOF_API_HOST}/api/buildings`,
	headers: {
		'Accept': 'application/json',
		'Authorization': `Bearer ${PROOF_API_TOKEN}`,
		'Content-Type': 'application/json',
	},
}).then(response => console.log(JSON.stringify(response.data, null, 2)))
```

<details>
  <summary>Server Response</summary>

Status code `200` - OK

```json
{
  "data": [
    {
      "id": 1,
      "assetIdentifier": "200 Montcalm Tower 2",
      "cacheKey": "buildings/1",
      "closingTime": "18:00",
      "displayKey": "1",
      "errors": {},
      "floors": [
        {
          "id": 1,
          "cacheKey": "building_floors/1",
          "capacity": 4,
          "displayKey": "1",
          "errors": {},
          "label": "0 (CESP only)",
          "position": 1,
          "slug": "1"
        },
        {
          "id": 2,
          "cacheKey": "building_floors/2",
          "capacity": 5,
          "displayKey": "2",
          "errors": {},
          "label": "0 (IITB only)",
          "position": 2,
          "slug": "2"
        },
        {
          "id": 3,
          "cacheKey": "building_floors/3",
          "capacity": 20,
          "displayKey": "3",
          "errors": {},
          "label": "1",
          "position": 3,
          "slug": "3"
        }
      ],
      "frenchName": "200 Montcalm Tour 2",
      "lobbyCapacity": 5,
      "name": "200 Montcalm Tower 2",
      "openingTime": "07:00",
      "region": null,
      "slug": "1",
      "timezone": "America/Montreal",
      "timezoneOffset": "-05:00"
    }
  ],
  "meta": {}
}
```
</details>


## Fetch a Specific Building
Allows you to see details about a specific building (in particular policy information).

```js
axios({
	method: 'GET',
	url: `${PROOF_API_HOST}/api/buildings/1`,
	headers: {
		'Accept': 'application/json',
		'Authorization': `Bearer ${PROOF_API_TOKEN}`,
		'Content-Type': 'application/json',
	},
}).then(response => console.log(JSON.stringify(response.data, null, 2)))
```

<details>
  <summary>Server Response</summary>

Status code `200` - OK

```json
{
  "data": {
    "id": 1,
    "assetIdentifier": "200 Montcalm Tower 2",
    "cacheKey": "buildings/1",
    "closingTime": "18:00",
    "displayKey": "1",
    "errors": {},
    "floors": [
      {
        "id": 1,
        "cacheKey": "building_floors/1",
        "capacity": 4,
        "displayKey": "1",
        "errors": {},
        "label": "0 (CESP only)",
        "position": 1,
        "slug": "1"
      },
      {
        "id": 2,
        "cacheKey": "building_floors/2",
        "capacity": 5,
        "displayKey": "2",
        "errors": {},
        "label": "0 (IITB only)",
        "position": 2,
        "slug": "2"
      },
      {
        "id": 3,
        "cacheKey": "building_floors/3",
        "capacity": 20,
        "displayKey": "3",
        "errors": {},
        "label": "1",
        "position": 3,
        "slug": "3"
      }
    ],
    "frenchName": "200 Montcalm Tour 2",
    "lobbyCapacity": 5,
    "name": "200 Montcalm Tower 2",
    "openingTime": "07:00",
    "region": null,
    "slug": "1",
    "timezone": "America/Montreal",
    "timezoneOffset": "-05:00"
  },
  "meta": {
    "policy": {
      "modelId": 1,
      "modelType": "Building",
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
        "name",
        "french_name",
        "asset_identifier",
        "lobby_capacity",
        "opening_time",
        "closing_time",
        "region",
        "timezone_string"
      ]
    }
  }
}
```
</details>

## Creating a Building
This endpoint creates a building in the current user's government (based on the API token).

```js
axios({
	method: 'GET',
	url: `${PROOF_API_HOST}/api/buildings`,
	headers: {
		'Accept': 'application/json',
		'Authorization': `Bearer ${PROOF_API_TOKEN}`,
		'Content-Type': 'application/json',
	},
	data: {
	  "building": {
		  "name": "Fort Belmont",
		  "french_name": "Fort de la Montagne",
		  "asset_identifier": "ASJWKEKGDP",
		  "lobby_capacity": 180,
		  "timezone_string": "America/Montreal"
		}
	}
}).then(response => console.log(JSON.stringify(response.data, null, 2)))
```
<details>
  <summary>Server Response</summary>

 

</details>

```ruby
    api_buildings GET      /api/buildings(.:format)                                                                 api/buildings#index
                  POST     /api/buildings(.:format)                                                                 api/buildings#create
 new_api_building GET      /api/buildings/new(.:format)                                                             api/buildings#new
edit_api_building GET      /api/buildings/:id/edit(.:format)                                                        api/buildings#edit
     api_building GET      /api/buildings/:id(.:format)                                                             api/buildings#show
                  PATCH    /api/buildings/:id(.:format)                                                             api/buildings#update
                  PUT      /api/buildings/:id(.:format)                                                             api/buildings#update
                  DELETE   /api/buildings/:id(.:format) 
```
