# API Reference — Exhaustive, structured lookup for every resource, endpoint, parameter, and response

**Use when:** You need complete technical specifications a developer consults while integrating — every endpoint, every parameter, types, required/optional, status codes, errors, request/response schemas. Built for lookup, not reading start-to-finish.
**Don't use when:** You want a quick path to a first working call (use api-getting-started), or to orient a developer to a client library (use sdk-overview). Reference is comprehensive and consulted; getting-started is minimal and followed once.
**Audience & voice:** Developers integrating the API (may be technical or non-technical depending on product). Precise, terse, consistent. Endpoint names start with an imperative verb ("Retrieve a user"); one-line descriptions use indicative mood ("Retrieves a user by `userID`"). Parameter descriptions start with a noun, omit articles. Fill empty cells with "N/A". Primarily for REST APIs.

## Skeleton

```
## Overview
Use the {product} APIs to {access | customize | program} the {features | functionality}.

### Base URL
{Base URL of the API, e.g. https://api.example.com. List multiple if they differ by environment/user.}

### Authorization
Authentication {is | is not} required. Supported methods: {Basic | Digest | OAuth | ...}
{Example request with authentication.}

### Version
{Optional. Version number via SemVer or your scheme, e.g. 0.0.1. Link migration guides if any.}

### Pagination
{Optional. How responses are paginated; settings and default values. Explain what pagination means in-text.}

### Rate limiting and throttling
{Optional. Strategy, max {number} requests per {time period}.}

### HTTP status codes
| Status code | Message | Description |
|-------------|---------|-------------|
| `200 OK`    | Request succeeds. | {description} |

### Errors
{Optional. Custom error types, each with a subsection.}
| Error | Description |
|-------|-------------|
| [{ExampleErrorType}](#exampleerrortype) | {Failure in ...} |

#### ExampleErrorType
| Field | Type | Description |
|-------|------|-------------|
| {errorType} | {enum} | {Predefined codes; possible values x, y, z.} |
| {errorMessage} | {string} | {Why the error occurs.} |

## {Resource name}
The {resource name} is used to {functionality}.

### Data model
| Attribute | Type | Required? | Description |
|-----------|------|-----------|-------------|
| {id} | string | Required | {Unique identifier of user} |
| {name} | string | Optional | {Name of user} |

### Example
{Example of the data representation in your project's format.}

### Endpoints
| Method | Endpoint name | Description |
|--------|---------------|-------------|
| POST | {[Endpoint A](#a)} | Creates a {resource}. |
| GET  | {[Endpoint B](#b)} | Retrieves a {resource}. |

## {Endpoint name}
{One-line description, indicative verb. E.g. "Retrieves a user by `userID`".}

### Endpoint
{METHOD} /{request-url}/{{path-parameter}}

### Description
{What the endpoint does, purpose, use cases.}
{Optional: deprecation note + replacement + migration link.}
{Optional: per-endpoint rate limit.}

### Authorization
The [{authorization method}](#authorization) is required for each request.
{Optional: also requires the {permission-name} permission.}

### Request schema
#### Path parameters {optional}
| Path parameter | Type | Required? | Description |
| {id} | string | Required | {Unique identifier of user} |

#### Query parameters {optional}
| Query parameter | Type | Required? | Description |
| {pageSize} | int | Optional | {Items per request. Default is N.} |

#### Header parameters {optional}
| Header parameter | Type | Required? | Description |
| {Content-Type} | string | Required | {Media type of the resource.} |

#### Request body {optional}
| Field | Type | Required? | Description |
| {id} | string | Required | {Unique identifier of the user} |
{If none of the above apply, write "None".}

### Request example
{Complete, copy-pasteable example: method, base URL, endpoint, headers, params, body. Prefer cURL.}

### Response schema
| Status code | Schema | Description |
| `2xx` | [{ExampleDataType}](#data-model) | {Result on success.} |
| `4xx` | [{ExampleErrorType}](#exampleerrortype) | {Result on failure.} |

### Response example
{Example response with sample values, or state "the response body is empty".}
```

## Filling tips

- **Overview:** Open with a high-level intro to the whole API set — key features, use cases, protocol, content types, structure. The overview holds everything that applies across all endpoints.
- **Base URL:** Define the common segment endpoint paths append to, so you don't repeat it per endpoint. List multiple URLs if they differ by environment or user group, with the condition for each.
- **Authorization:** Specify auth type, request schema, possible errors, and an example (use random strings for secrets). Keep it to technical specs; link a separate how-to for the authentication walkthrough. If several auth types exist, describe each and highlight the preferred one.
- **Version / Pagination / Rate limiting:** All optional. Cover versioning/compatibility/lifecycle and link migration guides; describe pagination options and defaults (and explain the term); state global rate-limit settings and quotas. Document per-endpoint overrides in the endpoint section.
- **HTTP status codes / Errors:** List only the status codes the API actually returns; in Description, explain causes and how to handle. Errors is optional — list custom error types, ideally each as its own subsection for linking.
- **Resource name:** Group endpoints by the resource they act on (or by use case if that suits users better). Use the source-code naming convention. Give a one-line definition plus when/how to use it.
- **Data model:** Table the resource's attributes: name, type, Required? (highlight required, e.g. capitalized), and a Description noting defaults, validation, and non-editable fields. Use "N/A" for empty cells. Follow with a concrete Example filling as many optional attributes as possible, in a syntax-highlighted code block.
- **Endpoints table:** List the resource's endpoints with capitalized methods, source-consistent names, and links to each endpoint's reference. Mark deprecated-but-live endpoints in the Description (consider strikethrough).
- **Endpoint name & Endpoint:** Name = operation + resource ("Create user"), singular unless a bulk op ("List users"). The Endpoint line: capitalized {METHOD}, a leading-slash path only (base URL omitted), placeholder path variables like `{user_id}`, no trailing slash.
- **Description / Authorization:** Explain purpose and use cases; add optional notes on versioning, limitations, deprecation. Link the common Authorization section and document any extra roles/permissions this endpoint needs.
- **Request schema:** Include only the sub-sections that apply (path params are always required; query params follow `?`; headers only if endpoint-specific; body only for POST/PUT/PATCH). Write "None" if nothing applies. Keep parameter names matching the endpoint line; use "Required"/"Optional" explicitly; link types defined elsewhere; descriptions start with a noun and add defaults, ranges, allowed values, and limits. No empty cells — use "N/A".
- **Request / Response examples:** Make the request complete and copy-pasteable (prefer cURL; add other languages only after user research, mindful of maintenance) and ensure it returns the documented response. For responses, give success and failure schemas with links, and show a real example body or state it is empty.
