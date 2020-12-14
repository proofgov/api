# Proof's REST/HTTP/JSON API documentation

## Pre-requisites

Readers of this document will need to have an account at an instance of the Proof platform (e.g. app.proofgov.com)

## API Token Generation

Today an api token can be generated for any user account and this process is self-serve:

1. Log into the app.
2. Go to your profile page and enabled the Developer Tools option.
3. Click on the API Token link under Developer Tools.

### Token invalidation
Token can be invalidated with an HTTP request with method DELETE at the correctly targetted URL, namely `/self-serve/api-tokens/<id>`

e.g.

```bash
API_TOKEN=6f7ad9f4fc06b73c2105cf1f3b5c287b02ff74a9c83b1a887cfbad04afa0f746
API_TOKEN_ID_TO_DELETE=3

curl \
  -X DELETE \
  "http://app.proofgov.com/self-serve/api-tokens/${API_TOKEN_ID_TO_DELETE}" \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${API_TOKEN}"
```

Note the _id_ of the token is different than the token itself (and can be determined from /self serve link).

At this time, only one api token can be issued for a single user account. There are a few work-arounds in-place - reach out to a technical contact or account manager for details.

## Example Applications

### Concerning Form Submissions

- [A basic example, downsampling implements some custom access control](https://github.com/proofgov/example-form-query-api)
- [A rate-limiting application](https://github.com/proofgov/example-app-capacity-management)

## Notes

1. In this documentation, `${API_TOKEN}` is meant to refer to the token provided by Proof for your integration.
2. We use `${API_HOST}` to refer to the hostname of the Proof instance you're meaning to interact with. For most users, this will be app.proofgov.com. For users of special single-tenant installs, this should the hostname you would visit in your browser (e.g. trac.ynet.gov.yk.ca).

In both cases, we're writing these as interpolated shell variables to facilitate copying and pasting snippets directly into a shell session.

## Endpoints

- [Users](users-endpoint.md)
- [Routings](routings-endpoint.md)
- [Forms](forms-endpoints.md)

Return to Office
- [Buildings](buildings-endpoints.md)
- [Building Access Appointments](building-access-appointments-endpoints.md)

### Common requirements

All requests must contain headers:

- `Authorization: Bearer {PROOF PROVIDED API TOKEN}`
- `Accept: application/json`
- `Content-Type: application/json`

### Paging

Endpoints that return multiple records will do so in pages.

`page` and `per_page` are the control parameters.

No more than 1k records will be returned on any request;
larger values of `per_page` will be ignored

#### Formatting

##### Dates

All dates sent to and returned from the system will be formatted as `YYYY-MM-DD`.
