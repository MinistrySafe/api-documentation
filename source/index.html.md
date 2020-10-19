---
title: Abuse Prevention Systems API Documentation

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='mailto:support@ministrysafe.com'>Request a Developer Key</a>

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
curl "https://safetysystem.abusepreventionsystems.com/api/v2/users"
  -H "Authorization: Token token=myapitoken"
```

> The command above returns JSON structured like this:

```json
  [
    {
      "id": 423,
      "first_name": "Test",
      "last_name": "User",
      "email": "test@example.com",
      "external_id": "111",
      "score": 80,
      "complete_date": "2016-08-17T17:07:07.292Z",
      "user_type": "employee",
      "direct_login_url": "https://safetysystem.abusepreventionsystems.com/trainings/quiz?t=jds95h2lslf92nl4klsd02n3"
    },
    {
      "id": 139,
      "first_name": "John",
      "last_name": "Doe",
      "email": "test2@example.com",
      "external_id":"123",
      "score": 100,
      "complete_date": "2016-08-03T01:59:32.622Z",
      "user_type": "volunteer",
      "direct_login_url": "https://safetysystem.abusepreventionsystems.com/trainings/quiz?t=jds95h2j4labhHH4klsd02n3"
    }
  ]
```

Retrieves a list of users. Users will be returned up to 100 at a time. This endpoint supports paging. The default page is 1. To retrieve the next hundred users, change the `page` param to 2, 3, 4 etc.


### HTTP Request

`GET https://safetysystem.abusepreventionsystems.com/api/v2/users`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page | 1 | The page of users that will be returned
external_id | <blank> | Will filter the returned users by external_id
search | <blank> | Will filter the returned users by a keyword search
tag | <blank> | String. Only users having this tag will be returned


## Get a User

```shell
curl "https://safetysystem.abusepreventionsystems.com/api/v2/users/2"
  -H "Authorization: Token token=myapitoken"
```

> The command above returns JSON structured like this:

```json
{
  "id": 423,
  "first_name": "Test",
  "last_name": "User",
  "email": "test@example.com",
  "external_id": "111",
  "score": 80,
  "complete_date": "2016-08-17T17:07:07.292Z",
  "user_type": "employee",
  "direct_login_url": "https://safetysystem.abusepreventionsystems.com/trainings/quiz?t=jds95h2lslf92nl4klsd02n3"
}
```

This endpoint retrieves a specific user.

### HTTP Request

`GET https://safetysystem.abusepreventionsystems.com/api/v2/users/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the user to retrieve

## Create a User


```shell
curl "https://safetysystem.abusepreventionsystems.com/api/v2/users"
  -X POST
  -H "Authorization: Token token=myapitoken"
  -d "user[first_name]=Tom&user[last_name]=Harrington&user[email]=test@example.com&user[external_id]=1234&tag_list=tag1,tag2,tag3"
```

> Example Success Response:

```json
  "id": 315,
  "first_name": "Tom",
  "last_name": "Harrington",
  "email": "test@example.com",
  "score": 95,
  "complete_date": "2016-08-17T17:07:07.292Z",
  "user_type": "employee",
  "direct_login_url": "https://safetysystem.ministrysafe.com/trainings/quiz?t=7671cf713e382812b749dbed2aa52f438ffc815f278a6c41",
  "external_id": "123"
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

`POST https://safetysystem.abusepreventionsystems.com/api/v2/users`

### User Attributes

Parameter | Required |  Description
--------- | ----------- | ----------
first_name | Yes | The first name of the user
last_name | Yes | The last name of the user
email | Yes | The user's email address
external_id | No | You can optionally assign a user an ID for use in integration with your own system


## Update a User


```shell
curl "https://safetysystem.abusepreventionsystems.com/api/v2/users/1"
  -X PUT
  -H "Authorization: Token token=myapitoken"
  -d "user[first_name]=Tim"
```

> Example Success Response:

```json
  "id": 1,
  "first_name": "Tim",
  "last_name": "Harrington",
  "email": "test@example.com",
  "score": 95,
  "complete_date": "2016-08-17T17:07:07.292Z",
  "user_type": "employee",
  "direct_login_url": "https://safetysystem.ministrysafe.com/trainings/quiz?t=7671cf713e382812b749dbed2aa52f438ffc815f278a6c41",
  "external_id": "123"
```

> Example Error Response:

```json
  "errors": {
    "first_name": ["You must provide a first name"],
    "last_name": ["You must provide a last name"]
  }
```

### HTTP Request

This endpoint updates a user.


`PUT https://safetysystem.abusepreventionsystems.com/api/v2/users/<ID>`

### User Attributes

Parameter | Required |  Description
--------- | ----------- | ----------
first_name | No | New user's first name
last_name | No | New user's last name
email | No | New user's email
tag_list | No | Nw user's tag list

## Deactivate a User

```shell
curl "https://safetysystem.abusepreventionsystems.com/api/v2/users/2"
  -X DELETE
  -H "Authorization: Token token=myapitoken"
```

```json
  No Content Body
```

This endpoint deletes a specific user.

### HTTP Request

`DELETE https://safetysystem.abusepreventionsystems.com/api/v2/users/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the user to delete

# Trainings

## Get All Trainings for a User


```shell
curl "https://safetysystem.abusepreventionsystems.com/api/v2/users/2/trainings"
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

`GET https://safetysystem.abusepreventionsystems.com/api/v2/users/<ID>/trainings`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
ID | Yes | The ID of the user for whom you want to retrieve trainings

## Assign a training to a User


```shell
curl "https://safetysystem.abusepreventionsystems.com/api/v2/users/2/assign_training"
  -X POST
  -H "Authorization: Token token=myapitoken"
  -d "survey_code=standard"
```

> Example Success Response:

```json
  "id": 315,
  "first_name": "Tom",
  "last_name": "Harrington",
  "email": "test@example.com",
  "score": 95,
  "complete_date": "2016-08-17T17:07:07.292Z",
  "user_type": "employee",
  "direct_login_url": "https://safetysystem.ministrysafe.com/trainings/quiz?t=7671cf713e382812b749dbed2aa52f438ffc815f278a6c41",
  "external_id": "123"
```

> Example Error Response:

```json
  { "message": "Invalid survey code" }
```

Assigns the specified training to a user.


### HTTP Request

`POST https://safetysystem.abusepreventionsystems.com/api/v2/users/<ID>/assign_training`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
ID | Yes | The ID of the user to whom the training will be assigned
survey_code | No | the code for the training that will be assigned
send_email | No | indicates whether an email will be automatically sent to the trainee (default is `false`)

### Survey Types

code | description
--------- | -------
`standard` | our standard 2018 Sexual Abuse Awareness Training
`youth` | our Youth Sports Sexual Abuse Awareness Training
`camp` | our Camp-Focused Sexual Abuse Awareness Training
`spanish` | our Spanish Sexual Abuse Awareness Training
`skillful_screening` | our Skillful Screening Training

## Resend a training


```shell
curl "https://safetysystem.abusepreventionsystems.com/api/v2/users/2/resend_training"
  -X POST
  -H "Authorization: Token token=myapitoken"
  -d "survey_code=standard"
```

> Example Success Response:

```json
  "id": 315,
  "first_name": "Tom",
  "last_name": "Harrington",
  "email": "test@example.com",
  "score": 95,
  "complete_date": "2016-08-17T17:07:07.292Z",
  "user_type": "employee",
  "direct_login_url": "https://safetysystem.ministrysafe.com/trainings/quiz?t=7671cf713e382812b749dbed2aa52f438ffc815f278a6c41",
  "external_id": "123"
```

> Example Error Response:

```json
  { "message": "Invalid survey code" }
```

Resends the specified training to a user.


### HTTP Request

`POST https://safetysystem.abusepreventionsystems.com/api/v2/users/<ID>/resend_training`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
ID | Yes | The ID of the user to whom the training will be resent
survey_code | No | the code for the training that will be resent


# Background Checks

## Get All Background Checks


```shell
curl "https://safetsystem.abusepreventionsystems.com/api/v2/background_checks"
  -H "Authorization: Token token=myapitoken"
```

> The command above returns JSON structured like this:

```json
  [
    {
      "id": 7122,
      "order_date": "2017-07-18T11:39:46.503-05:00",
      "status": "complete",
      "applicant_interface_url": "http://theresults.com/form-for-applicant-to-complete",
      "results_url": "http://theresults.com/unique-results-link",
      "user_id": 2121,
      "level": 3
    },
    {
      "id": 7423,
      "order_date": "2018-01-16T10:54:02.585-06:00",
      "status": "processing",
      "applicant_interface_url": "http://theresults.com/form-for-applicant-to-complete",
      "results_url": null,
      "user_id": 2132,
      "level": 1
    }
  ]
```

Retrieves a list of background checks for your organization. Background Checks will be returned up to 100 at a time. This endpoint supports paging. The default page is 1. To retrieve the next hundred users, change the `page` param to 2, 3, 4 etc.


### HTTP Request

`GET https://safetsystem.abusepreventionsystems.com/api/v2/background_checks`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page | 1 | the page of background_checks that will be returned


## Get a Background Check

```shell
curl "https://safetsystem.abusepreventionsystems.com/api/v2/background_checks/123"
  -H "Authorization: Token token=myapitoken"
```

> The command above returns JSON structured like this:

```json
{
  "id": 7122,
  "order_date": "2017-07-18T11:39:46.503-05:00",
  "status": "complete",
  "applicant_interface_url": "http://theresults.com/form-for-applicant-to-complete",
  "results_url": "http://theresults.com/unique-results-link",
  "user_id": 2121,
  "level": 3
}
```

This endpoint retrieves a specific background check record.

### HTTP Request

`GET https://safetsystem.abusepreventionsystems.com/api/v2/background_checks/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the background check to retrieve

## Create a Background Check


```shell
curl "https://safetsystem.abusepreventionsystems.com/api/v2/background_checks/123"
  -X POST
  -H "Authorization: Token token=myapitoken"
  -d "background_check[user_id]=123&background_check[quickapp]=true&background_check[level]=1"
```

> Example Success Response:

```json
  {
    "id": 7423,
    "order_date": "2018-01-16T10:54:02.585-06:00",
    "status": "processing",
    "applicant_interface_url": "http://theresults.com/form-for-applicant-to-complete",
    "results_url": null,
    "user_id": 123,
    "level": 1
  }
```

> Example Error Response:

```json
  "errors": {
    "first_name": ["You must provide a first name"],
    "last_name": ["You must provide a last name"]
  }
```

This endpoint creates a new background check.

### HTTP Request

`POST https://safetsystem.abusepreventionsystems.com/api/v2/background_checks`

### Background Check Attributes

Parameter | Required | Type | Description
--------- | ----------- | ---------- | -----------
user_id | Yes | integer | The ID of the user for whom the background check will be ordered
level | No* | integer | The level of the background check being ordered
custom_background_check_package_code | No* | string | The code of the custom background check package being requested
quickapp | Yes | boolean | If true, an email will be sent to the applicant to fill out their details. If false, all the applicant's information is required to be submitted in the initial request
first_name | No** | string | the first name of the applicant
last_name | No** | string | the last name of the applicant
address | No** | string | the street address of the applicant's residence
city | No** | string | the city of the applicant's residence
county | No** | string | the county of the applicant's residence
state | No** | string | the two letter state code of the applicant's residence
zip | No** | string | the zipcode of the applicant's residence
ssn | No** | string | the Social Security Number of the applicant
dob | No** | string format "MM/DD/YYYY" |  The applicant's date of birth
driver_license | No*** | string | the applicant's drivers license number
driver_license_state | No*** | the two letter code of the applicant's drivers license state
email | No** | string | the email address of the applicant

_* One of either `level` or `custom_background_check_package_code` are required_

_** Required if not doing a quickapp (`quickapp`=`false`)_

_*** Required for levels 2, 4, 5, 6, 7, and some custom packages_

## Get Available Levels


```shell
curl "https://safetsystem.abusepreventionsystems.com/api/v2/background_checks/available_levels"
  -X GET
  -H "Authorization: Token token=myapitoken"
```

> Example Success Response:

```json
  [1, 2, 3, 4, 5, 6, 7]
```

Each organization could have different levels that are available to their users. This endpoint returns the background check levels that are available to order on a user.

### HTTP Request

`GET https://safetsystem.abusepreventionsystems.com/api/v2/available_levels`


# Webhooks

## Quizzes

### Implementation

> The webhook posts a JSON body structured like this:

```json
  {
    "id": "123",
    "external_id": "111",
    "score": 80,
    "complete_date": "2016-08-17T17:07:07.292Z",
    "survey_code": "standard",
    "certificate_url": "https://safetysystem.abusepreventionsystems.com/path/to/certificate"
  }
```

Webhooks are triggered upon successful completion of a training by a user, and can be configured in your developer console.

If webhooks are enabled, when a trainee completes a quiz, we send a http POST request to the URLs you choose to specify.

## Background checks

### Implementation

> The webhook posts a JSON body structured like this:

```json
  {
    "id": "100",
    "user_id": "123",
    "email": "user@email.com",
    "external_id": "111",
    "results_url": "https://reports.ministrysafe.com/send/interchangeview/?parameters=values",
    "complete_date": "2020-07-30T10:35:21.548Z",
  }
```

Webhooks are triggered when the background check is ready to be reviewed, and can be configured in your developer console.

If webhooks are enabled, when a background check is ready, we send a http POST request to the URLs you choose to specify.
