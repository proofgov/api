# Proof's API documentation

## Requirements
All requests must contain headers:
* `Authorization: Bearer {PROOF PROVIDED API TOKEN}`
* `Accept: application/json`
* `Content-Type: application/json`

## Notes

1. In this documentation, `${API_TOKEN}` is meant to refer to the token provided by Proof for your integration.
2. We use `${API_HOST}` to refer to the hostname of the Proof instance you're meaning to interact with. For most users, this will be app.proofgov.com. For users of special single-tenant installs, this should the hostname you would visit in your browser (e.g. trac.ynet.gov.yk.ca).

In both cases, we're writing these as interpolated shell variables to facilitate copying and pasting snippets directly into a shell session.

## Formatting
### Dates
All dates sent to and returned from the system will be formatted as `YYYY-MM-DD`.

## Endpoints

* [Users](users-endpoint.md)
* [Routings](routings-endpoint.md)
* [Forms](forms-endpoints.md)