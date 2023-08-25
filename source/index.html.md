---
title: Abuse Prevention Systems API Documentation

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://ministrysafe.zendesk.com/hc/en-us/articles/9388755288084-How-to-Generate-an-API-Key'>Generate API Key Instructions</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the MinistrySafe and Abuse Prevention Systems API.

You may use this API to assign Trainings, manage Trainings, Background Checks and deliver our content and quizzes in your own system.

Contact support@ministrysafe.com for a sandbox account

Developers console url for staging environment: <a href="https://staging.ministrysafe.com/developers" >https://staging.ministrysafe.com/developers</a>

Developers console url for production environment: <a href="https://safetysystem.ministrysafe.com/developers" >https://safetysystem.ministrysafe.com/developers</a>


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
curl "https://safetysystem.ministrysafe.com/api/v2/users"
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
      "direct_login_url": "https://safetysystem.ministrysafe.com/trainings/quiz?t=jds95h2lslf92nl4klsd02n3",
      "tags": [
          "Tag-1",
          "Tag-2",
          "Tag-3"
      ]
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
      "direct_login_url": "https://safetysystem.ministrysafe.com/trainings/quiz?t=jds95h2j4labhHH4klsd02n3",
      "tags": [
          "Tag-4",
          "Tag-5"
      ]
    }
  ]
```

Retrieves a list of Users. Users will be returned up to 100 at a time. This endpoint supports paging, and the default page is 1. To retrieve the next hundred Users, change the page param to 2, 3, 4 etc.


### HTTP Request

`GET https://safetysystem.ministrysafe.com/api/v2/users`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page | 1 | The page of Users that will be returned
external_id | <blank> | Will filter the returned Users by external_id
search | <blank> | Will filter the returned Users by a keyword search
tag | <blank> | Only Users having this Tag will be returned


## Get a User

```shell
curl "https://safetysystem.ministrysafe.com/api/v2/users/2"
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
  "direct_login_url": "https://safetysystem.ministrysafe.com/trainings/quiz?t=jds95h2lslf92nl4klsd02n3",
  "tags": [
      "Tag-1",
      "Tag-2"
  ]
}
```

This endpoint retrieves a specific User.

### HTTP Request

`GET https://safetysystem.ministrysafe.com/api/v2/users/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the User to retrieve

## Create a User


```shell
curl "https://safetysystem.ministrysafe.com/api/v2/users"
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
  "external_id": "123",
  "tags": []
```

> Example Error Response:

```json
  "errors": {
    "first_name": ["You must provide a first name"],
    "last_name": ["You must provide a last name"]
  }
```

This endpoint creates a new User.

### HTTP Request

`POST https://safetysystem.ministrysafe.com/api/v2/users`

### User Attributes

Parameter | Required |  Description
--------- | ----------- | ----------
first_name | Yes | The first name of the user
last_name | Yes | The last name of the user
email | Yes | The user's email address
user_type | No | ['employee', 'volunteer']
external_id | No | As another option, you may assign a User an ID for use in integration with your own system.


## Update a User


```shell
curl "https://safetysystem.ministrysafe.com/api/v2/users/1"
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
  "external_id": "123",
  "tags": [
      "Tag-1",
      "Tag-2"
  ]
```

> Example Error Response:

```json
  "errors": {
    "first_name": ["You must provide a first name"],
    "last_name": ["You must provide a last name"]
  }
```

### HTTP Request

This endpoint updates a User.


`PUT https://safetysystem.ministrysafe.com/api/v2/users/<ID>`

### User Attributes

Parameter | Required |  Description
--------- | ----------- | ----------
first_name | No | New User's first name
last_name | No | New User's last name
email | No | New User's email
tag_list | No | New User's Tag list

## Deactivate a User

```shell
curl "https://safetysystem.ministrysafe.com/api/v2/users/2"
  -X DELETE
  -H "Authorization: Token token=myapitoken"
```

```json
  No Content Body
```

This endpoint deletes a specific User.

### HTTP Request

`DELETE https://safetysystem.ministrysafe.com/api/v2/users/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the User to delete

# Trainings

## Get All Trainings for a User


```shell
curl "https://safetysystem.ministrysafe.com/api/v2/users/2/trainings"
  -H "Authorization: Token token=myapitoken"
```

> The command above returns JSON structured like this:

```json
  {
    "id": 12345,
    "winner": true,
    "score": 100,
    "created_at": "2018-01-30T19:22:11.675-06:00",
    "complete_date": "2018-01-30T21:42:58.675-06:00",
    "survey_name": "Sexual Abuse Awareness Training (2021)",
    "survey_code": "standard",
    "certificate_url": "http://safetysystem.ministrysafe.com/trainings/4?print=true",
    "participant": {
        "id": 123,
        "employee_id": "employee-id",
        "first_name": "John",
        "last_name": "Sawyer"
    }
  }
```

Retrieves all Trainings that have been assigned to a User.


### HTTP Request

`GET https://safetysystem.ministrysafe.com/api/v2/users/<ID>/trainings`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
ID | Yes | The ID of the User for whom you want to retrieve Trainings

## Assign a training to a User


```shell
curl "https://safetysystem.ministrysafe.com/api/v2/users/2/assign_training"
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
  "external_id": "123",
  "participant": {
      "id": 123,
      "employee_id": "employee-id",
      "first_name": "John",
      "last_name": "Sawyer"
  }
```

> Example Error Response:

```json
  { "message": "Invalid survey code" }
```

Assigns the specified Training to a User.


### HTTP Request

`POST https://safetysystem.ministrysafe.com/api/v2/users/<ID>/assign_training`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
ID | Yes | The ID of the User to whom the Training will be assigned
survey_code | No | The code for the Training that will be assigned
send_email | No | Indicates whether an email is automatically sent to the Trainee (default is `false`)

### Survey Types

code | description
--------- | -------
`standard` | The most recent Sexual Abuse Awareness Training
`youth` | Sexual Abuse Awareness Training - Youth Sports
`camp` | Sexual Abuse Awareness Training - Camp
`spanish` | Sexual Abuse Awareness Training - Spanish
`daycare` | Sexual Abuse Awareness Training - Daycare
`education` | Sexual Abuse Awareness Training - Education
`youth_ministry` | Sexual Abuse Awareness Training - Youth Ministry
`skillful_screening` | Skillful Screening Training
`parent_training` | Parent/Guardian Training
`california` | Sexual Abuse Awareness Training (CA)*
`peer_to_peer_training` | Peer-to-Peer Sexual Abuse Training
`harassment` | Preventing Sexual Harassment Training (for Supervisors)

_* This Training specifically includes new California legal requirements_


## Resend a training


```shell
curl "https://safetysystem.ministrysafe.com/api/v2/users/2/resend_training"
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

Resends the specified Training to a User.


### HTTP Request

`POST https://safetysystem.ministrysafe.com/api/v2/users/<ID>/resend_training`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
ID | Yes | The ID of the User to whom the Training will be resent
survey_code | No | The code for the Training that will be resent


## Get All Trainings


```shell
curl "https://safetysystem.ministrysafe.com/api/v2/trainings"
  -H "Authorization: Token token=myapitoken"
```

> The command above returns JSON structured like this:

```json
  {
    "id": 1
    "winner": true,
    "score": 100,
    "created_at": "2018-01-30T19:22:11.675-06:00",
    "complete_date": "2018-01-30T21:42:58.675-06:00",
    "survey_name": "Sexual Abuse Awareness Training (2021)",
    "survey_code": "standard",
    "certificate_url": "http://safetysystem.ministrysafe.com/trainings/4?print=true"
    "participant": {
      "id": 123,
      "employee_id": "employee-id",
      "first_name": "John",
      "last_name": "Doe"
    }
  }
```

Retrieves all Trainings that have been assigned to Users in the Organization.


### HTTP Request

`GET https://safetysystem.ministrysafe.com/api/v2/trainings`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
page | 1 | The page of Trainings that will be returned
start_date |  | The start date for Background Check assignments *(Format: mm/dd/yyyy)*
end_date |  | The end date for Background Check assignments *(Format: mm/dd/yyyy)*


# Background Checks

## Get All Background Checks


```shell
curl "https://safetysystem.ministrysafe.com/api/v2/background_checks"
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

Retrieves a list of Background Checks for your Organization. Background Checks will be returned up to 100 at a time. This endpoint supports paging, and the default page is 1. To retrieve the next hundred Users, change the page param to 2, 3, 4, etc.


### HTTP Request

`GET https://safetysystem.ministrysafe.com/api/v2/background_checks`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page | 1 | The page of Background Checks that will be returned
start_date |  | The start date to filter Background Checks that were assigned on or after (Format: mm/dd/yyyy)
end_date |  | The end date to filter Background Checks that were assigned on or before (Format: mm/dd/yyyy)


## Get a Background Check

```shell
curl "https://safetysystem.ministrysafe.com/api/v2/background_checks/123"
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

This endpoint retrieves a specific Background Check record.

### HTTP Request

`GET https://safetysystem.ministrysafe.com/api/v2/background_checks/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the Background Check to retrieve

## Create a Background Check


```shell
curl "https://safetysystem.ministrysafe.com/api/v2/background_checks"
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

This endpoint creates a new Background Check.

### HTTP Request

`POST https://safetysystem.ministrysafe.com/api/v2/background_checks`

### Background Check Attributes

Parameter | Required | Type | Description
--------- | ----------- | ---------- | -----------
user_id | Yes | integer | The ID of the User for whom the Background Check will be ordered
level | No* | integer | The level of the Background Check being ordered
custom_background_check_package_code | No* | string | The code of the custom Background Check package being requested
quickapp | Yes | boolean | If true, an email will be sent to the applicant to fill out details. If false, all applicant information must be submitted in the initial request.
first_name | No** | string | The first name of the applicant
last_name | No** | string | The last name of the applicant
address | No** | string | The street address of the applicant's residence
city | No** | string | The city of the applicant's residence
county | No** | string | The county of the applicant's residence
state | No** | string | The two letter state code of the applicant's residence
zip | No** | string | The zip code of the applicant's residence
ssn | No** | string | The Social Security Number of the applicant
dob | No** | string format "MM/DD/YYYY" |  The applicant's date of birth
driver_license | No*** | string | The applicant's drivers license number
driver_license_state | No*** | string | The two letter code of the applicant's drivers license state
email | No** | string | The email address of the applicant
user_type | No | string | ['employee', 'volunteer']
child_serving | No | boolean | Designates whether the User is in a child-serving role
salary_range | No | string | ['under_20k', '20k_25k', '25k_75k', '75k_plus']
age_over_13 | No | boolean | Designates whether the applicant is over 13 years of age
employee_type | No | string | ['current', 'prospective']
applicant_self_disclosed | No | boolean | Designates whether the applicant self discloses
applicant_self_disclosed_notes | No | string | The applicant's notes if self disclosed

_* One of either `level` or `custom_background_check_package_code` are required_

_** Required if not doing a QuickApp (`quickapp`=`false`)_

_*** Required for levels 2, 4, 5, 6, 7, and some custom packages_


## Archive a Background Check


```shell
curl "https://safetysystem.ministrysafe.com/api/v2/background_checks/123/archive"
  -X PUT
  -H "Authorization: Token token=myapitoken"
```

> Example Success Response:

```json
  {
    "id": 7423,
    "order_date": "2018-01-16T10:54:02.585-06:00",
    "status": "archived",
    "applicant_interface_url": "http://theresults.com/form-for-applicant-to-complete",
    "results_url": null,
    "user_id": 123,
    "level": 1
  }
```

> Example Error Response:

```json
  { "message": "Background Check not found" }
```

This endpoint archives a Background Check.

### HTTP Request

`PUT https://safetysystem.ministrysafe.com/api/v2/background_checks/<ID>/archive`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the Background Check to archive

## Get Available Levels


```shell
curl "https://safetysystem.ministrysafe.com/api/v2/background_checks/available_levels"
  -X GET
  -H "Authorization: Token token=myapitoken"
```

> Example Success Response:

```json
  [1, 2, 3, 4, 5, 6, 7]
```

Each Organization may have different Levels available to its Users. This endpoint returns the Background Check Levels available to order on an Organization’s User.

### HTTP Request

`GET https://safetysystem.ministrysafe.com/api/v2/available_levels`


# Tags

## Get All Tags


```shell
curl "https://safetysystem.ministrysafe.com/api/v2/tags"
  -H "Authorization: Token token=myapitoken"
```

> The command above returns JSON structured like this:

```json
  [
    {
      "name": "Tag A"
    },
    {
      "name": "Tag B"
    }
  ]
```

Retrieves a list of Tags related to your Organization. Tags will be returned up to 100 at a time. This endpoint supports paging, and the default page is 1. To retrieve the next hundred Tags, change the page param to 2, 3, 4, etc.


### HTTP Request

`GET https://safetysystem.ministrysafe.com/api/v2/tags`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
page | 1 | The page of Tags that will be returned


# Webhooks

## Quizzes

### Implementation

> The webhook posts a JSON body structured like this:

```json
  {
    "user_id": "123",
    "external_id": "111",
    "score": 80,
    "complete_date": "2016-08-17T17:07:07.292Z",
    "survey_code": "standard",
    "certificate_url": "https://safetysystem.ministrysafe.com/path/to/certificate"
  }
```

Webhooks are triggered upon successful User completion of a Training and may be configured in your developer console.

If webhooks are enabled, we send an HTTP POST request to the URLs you specify when a Trainee completes a quiz.

## Background Checks

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

Webhooks are triggered when the Background Check is ready to be reviewed and may be configured in your developer console.

If webhooks are enabled,  we send an HTTP POST request to the URLs you specify when a Background Check is ready for review.
