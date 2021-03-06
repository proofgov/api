# Routings endpoint

### Routings - Fetching all Routings
This allows you to see all routings in the system (that your user has access to)

#### Request

```sh
curl "https://${API_HOST}/api/routings" \
     -H 'Accept: application/json' \
     -H "Authorization: Bearer ${API_TOKEN}" \
     -H 'Content-Type: application/json'
```

#### Response
Status code `200` - OK

```json
[
  {
    "id":1,
    "cacheKey":"routings/1-20190225015947395218",
    "creatorId":1,
    "deadline":"2019-02-28",
    "displayKey":"PROOF-1",
    "pdfUrl":"/routings/PROOF-1.pdf",
    "priority":"Urgent",
    "routingType":"Acting Pay",
    "stakeholders":[
      {
        "id":70,
        "descriptor":"Citizen#70",
        "label":"Obdulia Armstrong",
        "type":"Citizen",
        "firstName":"Obdulia",
        "lastName":"Armstrong",
        "stakeholderLinkId":2
      },
      {
        "id":11,
        "descriptor":"Organization#11",
        "label":"Yundt, Hermiston and Barton",
        "type":"Organization",
        "name":"Yundt, Hermiston and Barton",
        "stakeholderLinkId":3
      }
    ],
    "status":"open",
    "stepsSummary":{
      "total":8,
      "completed":1,
      "progress":13
    },
    "summary":"Testing",
    "tagNames":[
      "aesthetic",
      "Start"
    ],
    "tenantScopeId":1,
    "title":"My first routing",
    "url":"/routings/PROOF-1"
  },
  {
    "id":5,
    "cacheKey":"routings/5-20190225015423457578",
    "creatorId":1,
    "deadline":"2019-03-02",
    "displayKey":"PROOF-5",
    "pdfUrl":"/routings/PROOF-5.pdf",
    "priority":"Low",
    "routingType":"Acting Pay",
    "stakeholders":[],
    "status":"open",
    "stepsSummary":{
      "total":3,
      "completed":1,
      "progress":33
    },
    "summary":"",
    "tagNames":[],
    "tenantScopeId":8,
    "title":"Routing steps with details.",
    "url":"/routings/PROOF-5"
  }
]
```


### Routings - Fetching specific Routing
Allows you to see details on a specific routing

#### Request

```sh
curl "https://${API_HOST}/api/routings/6" \
     -H 'Accept: application/json' \
     -H "Authorization: Bearer ${API_TOKEN}" \
     -H 'Content-Type: application/json'
```

#### Response
Status code `200` - OK

```json
{
  "id":6,
  "cacheKey":"routings/6-20190225220915679855",
  "creatorId":1,
  "deadline":"2019-03-14",
  "displayKey":"PROOF-6",
  "participants":[
    {
      "id":33,
      "cacheKey":"participants/33-20190225221019536936",
      "createdAt":"2019-02-25 22:10:19 UTC",
      "displayKey":"33",
      "entityId":6,
      "entityType":"Routing",
      "notificationType":"my_actions",
      "updatedAt":"2019-02-25 22:10:19 UTC",
      "userId":13
    }
  ],
  "pdfUrl":"/routings/PROOF-6.pdf",
  "priority":"Medium",
  "routingType":"Acting Pay",
  "stakeholders":[

  ],
  "status":"open",
  "steps":[
    {
      "id":53,
      "action":"Create",
      "actorId":null,
      "createdAt":"2019-02-25 22:09:15 UTC",
      "details":null,
      "executionAuthority":"unknown",
      "position":1,
      "routingId":6,
      "timeDone":null,
      "updatedAt":"2019-02-25 22:09:15 UTC",
      "userId":1
    },
    {
      "id":54,
      "action":"Review",
      "actorId":null,
      "createdAt":"2019-02-25 22:09:15 UTC",
      "details":null,
      "executionAuthority":"unknown",
      "position":2,
      "routingId":6,
      "timeDone":null,
      "updatedAt":"2019-02-25 22:09:15 UTC",
      "userId":10
    }
  ],
  "stepsSummary":{
    "total":2,
    "completed":0,
    "progress":0
  },
  "summary":"Responding to Mark about vacation payments",
  "tagNames":[

  ],
  "tenantScopeId":6,
  "title":"Vacation payment information",
  "url":"/routings/PROOF-6"
}
```

### Routings - Creating a routing
This endpoint creates a routing for the current user (based on API token).

#### Request

```sh
curl -X "POST" "https://${API_HOST}/api/routings" \
     -H 'Accept: application/json' \
     -H "Authorization: Bearer ${API_TOKEN}" \
     -H 'Content-Type: application/json' \
     -d $'{
  "routing": {
    "summary": "Responding to Mark about vacation payments",
    "title": "Vacation payment information",
    "deadline": "2019-03-14",
    "tag_names": [],
    "routing_type": "Acting Pay",
    "priority": "Medium",
    "stakeholder_links_attributes": [],
    "steps_attributes": [
      {
        "user_id": 1,
        "action": "Create"
      },
      {
        "user_id": 10,
        "action": "Review"
      }
    ]
  }
}'

```

#### Response
Status code `201` - Created

```json
{
  "id":7,
  "cacheKey":"routings/7-20190225221659371828",
  "creatorId":13,
  "deadline":"2019-03-14",
  "displayKey":"PROOF-7",
  "participants":[
    {
      "id":36,
      "cacheKey":"participants/36-20190225221659414156",
      "createdAt":"2019-02-25 22:16:59 UTC",
      "displayKey":"36",
      "entityId":7,
      "entityType":"Routing",
      "notificationType":"my_actions",
      "updatedAt":"2019-02-25 22:16:59 UTC",
      "userId":10
    },
    {
      "id":35,
      "cacheKey":"participants/35-20190225221659406971",
      "createdAt":"2019-02-25 22:16:59 UTC",
      "displayKey":"35",
      "entityId":7,
      "entityType":"Routing",
      "notificationType":"my_actions",
      "updatedAt":"2019-02-25 22:16:59 UTC",
      "userId":1
    },
    {
      "id":34,
      "cacheKey":"participants/34-20190225221659400840",
      "createdAt":"2019-02-25 22:16:59 UTC",
      "displayKey":"34",
      "entityId":7,
      "entityType":"Routing",
      "notificationType":"my_actions",
      "updatedAt":"2019-02-25 22:16:59 UTC",
      "userId":13
    }
  ],
  "pdfUrl":"/routings/PROOF-7.pdf",
  "priority":"Medium",
  "routingType":"Acting Pay",
  "stakeholders":[

  ],
  "status":"open",
  "steps":[
    {
      "id":55,
      "action":"Create",
      "actorId":null,
      "createdAt":"2019-02-25 22:16:59 UTC",
      "details":null,
      "executionAuthority":"unknown",
      "position":1,
      "routingId":7,
      "timeDone":null,
      "updatedAt":"2019-02-25 22:16:59 UTC",
      "userId":1
    },
    {
      "id":56,
      "action":"Review",
      "actorId":null,
      "createdAt":"2019-02-25 22:16:59 UTC",
      "details":null,
      "executionAuthority":"unknown",
      "position":2,
      "routingId":7,
      "timeDone":null,
      "updatedAt":"2019-02-25 22:16:59 UTC",
      "userId":10
    }
  ],
  "stepsSummary":{
    "total":2,
    "completed":0,
    "progress":0
  },
  "summary":"Responding to Mark about vacation payments",
  "tagNames":[

  ],
  "tenantScopeId":7,
  "title":"Vacation payment information",
  "url":"/routings/PROOF-7"
}
```