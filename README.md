# Proof's API document

## Requirements
All requests must contain three headers:
* `Authorization: Bearer {PROOF PROVIDED API TOKEN}`
* `Accept: application/json`
* `Content-Type: application/json`

**Notes**

1. In this documentation, anywhere you see `${API_TOKEN}` it refers to the token provided by Proof for your integration.
2. We use ${API_HOST} to refer to the hostname of the Proof instance to interact with. For most users, this will be app.proofgov.com. For users of special single-tenant installs, this should is whatever hostname you would visit in your browser (e.g. trac.ynet.gov.yk.ca).

In both cases, we're writing these like interpolated shell variables to facilitate copying and pasting these snippets directly into a shell session.

### Formatting of data
#### Dates
All dates sent to and returned from the system will be using `YYYY-MM-DD` format.

## Endpoints

* [Users](users-endpoint.md)
* [Routings](routings-endpoint.md)
* [Forms](forms-endpoints.md)