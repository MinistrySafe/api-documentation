---
title: Abuse Prevention Systems API Documentation

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='mailto:jacob@ministrysafe.com'>Request a Developer Key</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the MinistrySafe and Abuse Prevention Systems API.

You can use this API to assign trainings, manage trainings, and deliver our content and quizzes in your own system.


# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: Token token=myapitoken"
```

> Make sure to replace `myapitoken` with your API key.

The API uses token authentication. We expect the API key to be included in all API requests to the server in a header that looks like this:

`"Authorization" => "Token token=myapitoken"`

<aside class="notice">
You must replace <code>myapitoken</code> with your actual API key.
</aside>

# Users

## Get All Users


```shell
curl "https://safetsystem.abusepreventionsystems.com/api/v2/users"
  -H "Authorization: Token token=myapitoken"
```

> The command above returns JSON structured like this:

```json
  [
    {
      "id": 423,
      "first_name": "Test",
      "last_name": "User",
      "employee_id": "111",
      "score": 80,
      "complete_date": "2016-08-17T17:07:07.292Z",
      "direct_login_url": "https://safetysystem.abusepreventionsystems.com/trainings/quiz?t=jds95h2lslf92nl4klsd02n3"
    },
    {
      "id": 139,
      "first_name": "John",
      "last_name": "Doe",
      "employee_id":"123",
      "score": 100,
      "complete_date": "2016-08-03T01:59:32.622Z",
      "direct_login_url": "https://safetysystem.abusepreventionsystems.com/trainings/quiz?t=jds95h2j4labhHH4klsd02n3"
    }
  ]
```

Retrieves a list of users. Users will be returned up to 100 at a time. This endpoint supports paging. The default page is 1. To retrieve the next hundred users, change the `page` param to 2, 3, 4 etc.


### HTTP Request

`GET https://safetsystem.abusepreventionsystems.com/api/v1/users`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page | 1 | the page of users that will be returned


## Get a User

```shell
curl "https://safetsystem.abusepreventionsystems.com/api/v2/users/2"
  -H "Authorization: Token token=myapitoken"
```

> The command above returns JSON structured like this:

```json
{
  "id": 423,
  "first_name": "Test",
  "last_name": "User",
  "employee_id": "111",
  "score": 80,
  "complete_date": "2016-08-17T17:07:07.292Z",
  "direct_login_url": "https://safetysystem.abusepreventionsystems.com/trainings/quiz?t=jds95h2lslf92nl4klsd02n3"
}
```

This endpoint retrieves a specific user.

### HTTP Request

`GET https://safetsystem.abusepreventionsystems.com/api/v1/users/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the user to retrieve

## Create a User


```shell
curl "https://safetsystem.abusepreventionsystems.com/api/v1/users/2"
  -X POST
  -H "Authorization: Token token=myapitoken"
  -d "user[first_name]=Tom&user[last_name]=Harrington&user[email]=test@example.com&user[external_id]=1234&tag_list=tag1,tag2,tag3"
```

> Example Success Response:

```json
  "id": 315,
  "first_name": "Tom",
  "last_name": "Harrington",
  "score": 95,
  "complete_date": "2016-08-17T17:07:07.292Z",
  "direct_login_url": "https://staging.ministrysafe.com/trainings/quiz?t=7671cf713e382812b749dbed2aa52f438ffc815f278a6c41",
  "employee_id": "123"
```

> Example Error Response:

```json
    "errors": {
      "first_name": ["You must provide a first name"],
      "last_name": ["You must provide a last name"]
    }
```

This endpoint creates a new user.

### HTTP Request

`POST https://safetsystem.abusepreventionsystems.com/api/v1/users`

### User Attributes

Parameter | Requred |  Description
--------- | ----------- | ----------
first_name | Yes | The first name of the user
last_name | Yes | The last name of the user
email | Yes | The user's email address
external_id | No | You can optionally assign a user an ID for use in integration with your own system


## Deactivate a User

```shell
curl "https://safetsystem.abusepreventionsystems.com/api/v1/users/2"
  -X DELETE
  -H "Authorization: Token token=myapitoken"
```

```json
  No Content Body
```

This endpoint deletes a specific user.

### HTTP Request

`DELETE https://safetsystem.abusepreventionsystems.com/api/v1/users/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the user to delete

# Trainings

## Get All Trainings for a User


```shell
curl "https://safetsystem.abusepreventionsystems.com/api/v2/users/2/trainings"
  -H "Authorization: Token token=myapitoken"
```

> The command above returns JSON structured like this:

```json
  {
    "winner": true,
    "score": 100,
    "created_at": "2018-01-30T19:22:11.675-06:00",
    "complete_date": "2018-01-30T21:42:58.675-06:00",
    "survey_name": "Sexual Abuse Awareness Training (2018)",
    "survey_code": "standard",
    "certificate_url": "http://safetysystem.ministrysafe.com/trainings/4?print=true"
  }
```

Retrieves all trainings that have been assigned to a user.


### HTTP Request

`GET https://safetsystem.abusepreventionsystems.com/api/v1/users/<ID>/trainings`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
ID | Yes | The ID of the user for whom you want to retrieve trainings

## Assign a training to a User


```shell
curl "https://safetsystem.abusepreventionsystems.com/api/v2/users/2/assign_training"
  -X POST
  -H "Authorization: Token token=myapitoken"
```

> Example Success Response:

```json
  No Content Body
```

> Example Error Response:

```json
  { "message": "Invalid survey code" }
```

Assigns the specified training to a user.


### HTTP Request

`POST https://safetsystem.abusepreventionsystems.com/api/v1/users/<ID>/assign_training`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
ID | Yes | The ID of the user to whom the training will be assigned
survey_code | No | the code for the training that will be assigned

### Survey Types

code | description
--------- | -------
`standard` | our standard 2018 Sexual Abuse Awareness Training
`youth` | our Youth Sports Sexual Abuse Awareness Training
`camp` | our Camp-Focused Sexual Abuse Awareness Training
`spanish` | our Spanish Sexual Abuse Awareness Training
