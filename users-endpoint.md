# Users Endpoints

### Users - Getting users (and current user)
This endpoint returns an array of all users in the system (including users who are no longer active).

The current user (calculated via API token) has an additional attribute called `current` which is set to `true`.

**NOTE** We will make the currentUser accessible through a different endpoint in the future. We may ask users to refer to that endpoint to learn the currently authenticated user.

#### Request
```sh
curl "https://${API_HOST}/api/users" \
     -H 'Accept: application/json' \
     -H "Authorization: Bearer ${API_TOKEN}" \
     -H 'Content-Type: application/json'
```

#### Response
Status code `200` - OK

```json
[
  {
    "id":3,
    "active":true,
    "delegations":[

    ],
    "delegationsAsDelegate":[

    ],
    "department":null,
    "division":null,
    "divisionForAdmin":null,
    "email":"waltraud-altenwerth-2@somegovernment.gov",
    "firstName":"Waltraud",
    "fullName":"Waltraud Altenwerth",
    "lastName":"Altenwerth",
    "roleId":3,
    "roleLevel":"edit"
  },
  {  
    "id":11,
    "active":true,
    "delegations":[

    ],
    "delegationsAsDelegate":[

    ],
    "department":null,
    "division":null,
    "divisionForAdmin":null,
    "email":"simon-cummerata-10@somegovernment.gov",
    "firstName":"Simon",
    "fullName":"Simon Cummerata",
    "lastName":"Cummerata",
    "roleId":3,
    "roleLevel":"edit"
  },
  {  
    "id":12,
    "active":true,
    "delegations":[

    ],
    "delegationsAsDelegate":[

    ],
    "department":null,
    "division":null,
    "divisionForAdmin":null,
    "email":"tajuana-dare-11@somegovernment.gov",
    "firstName":"Tajuana",
    "fullName":"Tajuana Dare",
    "lastName":"Dare",
    "roleId":3,
    "roleLevel":"edit"
  },
  {
    "id":13,
    "active":true,
    "delegations":[

    ],
    "delegationsAsDelegate":[

    ],
    "department":null,
    "division":null,
    "divisionForAdmin":null,
    "email":"timmy.zuza@proofgov.com",
    "firstName":"Timmy",
    "fullName":"Timmy Zuza",
    "lastName":"Zuza",
    "roleId":3,
    "roleLevel":"edit",
    "current":true
  }
]
```
