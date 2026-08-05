# API Getting Started — A short "Hello World" walkthrough to a developer's first successful API call

**Use when:** You want to get a developer from zero to one working request fast — auth, base URL, one real request/response, next steps. The minimal viable path through the API.
**Don't use when:** The reader needs every endpoint, parameter, and field documented for lookup (use api-reference), an orientation to a client library (use sdk-overview), or in-depth beginner teaching of the whole problem space (use a full tutorial). Getting-started targets domain experts who want quick setup, not novices needing comprehensive explanation.
**Audience & voice:** Developers integrating the API who already know the problem space. Direct, imperative, second person ("you"). Numbered steps, one action per step, verb-led headings. Short and essential — no broad concept explanation.

## Skeleton

~~~
# {Product} API getting started guide

This guide walks you through getting started with the {product} API to {what the user will accomplish — e.g. make GET/POST requests, build an app}.

By the end of this guide, you will be able to:
* {Objective 1}
* {Objective 2}
* {Objective 3}

## Prerequisites
Before you begin, ensure you:
* Are familiar with {relevant concepts/experience, e.g. REST APIs}.
* Have the following tools installed or set up:
  * {Software prerequisite 1}
  * {Software prerequisite 2}

## Authentication
{Optional — omit if no auth needed.} Making a request to the {product} API requires authentication. Follow these steps:
1. {Sign up for an account}
2. {Request an API key}
3. {Additional steps as necessary}

## Base URL
The base URL for all requests to the API is:
```text
{https://api.example.com/v2}
```

## Make your first API request
To make your first API request:
1. Select an API endpoint. {See the API reference for a list of endpoints.}
2. Use cURL or Postman to make a request.

### Request
{Sample request — e.g. a POST to the `tasks` endpoint using cURL. Replace boilerplate with your own.}
```bash
{curl -X POST "..." -H "Authorization: Bearer ACCESS_TOKEN" -d '{...}'}
```

### Response
{Sample JSON response. Replace boilerplate with your own.}
```json
{ "status": "success", ... }
```

## Next steps
Congratulations on making your first API request! For more, see:
* {Link to API Reference}
* {Link to other available features}
* {Tutorials and articles about the API}
* {Community, support, FAQs, troubleshooting}
~~~

## Filling tips

- **Introduction / objectives:** Briefly state what the API is and who the guide is for, then list the concrete things the reader will be able to do by the end (integrate, build, or test). Keep it short and outcome-focused.
- **Prerequisites:** List everything needed up front: hardware, software dependencies, where to download/install, and how to get keys or credentials. If setup or auth is involved, link out to a dedicated setup/auth guide rather than expanding it here.
- **Authentication:** Optional — include only if the API requires it. Give the minimal numbered path to credentials: sign up, get a key/token, set up auth. Defer deep auth detail to a separate doc.
- **Base URL:** State the root address all endpoints append to, near the top, so relative paths stay consistent and a domain change is a one-line edit.
- **Make your first API request:** This is the core. Walk through one real CRUD request with numbered steps (one action each) and show the exact response so the reader can confirm success. Provide a runnable "Hello World" snippet, add inline comments or explanations, and call out common errors with troubleshooting tips.
- **Next steps:** Point to the API reference, the glossary/core concepts, and further tutorials, blogs, troubleshooting guides, and videos so the reader can go deeper.
