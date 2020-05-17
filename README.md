# The ITPower Weather Server 
Adapted from Don Coleman’s [Connected Devices](https://github.com/don/itp-connected-devices) source code.

## What it is

The ITPower weather server collects longterm weather data from ITP’s weather station. This data is available to you - yes, you! - for whatever nefarious purposes you may desire.

The server collects the following data:
| data point        | type   |
| ----------------- | ------ |
| wind_dir           | int    |
| winddir_avg2m     | int    |
| windspeedmph      | float  |
| windgustdir_10m   | int    |
| windgustmph_10m   | float  |
| rainin            | float  |
| dailyrainin       | float  |
| rain_avg1m        | float  |
| rain_avg10m       | float  |
| temperature       | float  |
| humidity          | float  |
| pressure          | float  |
| illuminance       | float  |
| uva               | float  |
| uvb               | float  |
| uvindex           | float  |

## How I use it

First, we’ll have to add your device to the approved list of devices. Send your mac address to [Brent](bb2906@nyu.edu), [Yeseul](yeseul.song@nyu.edu), or contact someone in ITPower and we’ll get you access.


Basically, there are four endpoints most people will be concerned with:

#### All data
`https://{url}/itpower-data`: this gives you all the data since we started recording it. You can use the following cURL request to get it: 

`curl -X GET -d macAddress={yourMacAddress} -d sessionKey={yourSessionKey} https://{url}/itpower-data`

#### Specific data point by ID

`https://{url}/itpower-data/:transactionID`

Sample request:
`curl -X GET -d macAddress={yourMacAddress} -d sessionKey={yourSessionKey} https://{url}/itpower-data/:{the ID number}`

#### Data from a date range

`https://{url}/itpower-data/by-time`: this endpoint takes a from and to date. We’re using moment.js to parse dates, so it can take a lot of formats. If you want to get granular, you can check out the [moment.js parsing documentation](https://momentjs.com/docs/#/parsing/).

Sample request:

`curl -X GET -d macAddress={yourMacAddress} -d sessionKey={yourSessionKey} -d dateFrom=’3-2-2020’ -d dateTo=’3-10-2020’ https://{url}/itpower-data/by-time`

#### Data by category
`https://{url}/itpower-data/by-category`: this can take a single category (e.g. `wind_dir`) or a comma-separated list of categories (e.g. `wind_dir, rainin`). It will return all data points from that category.

Sample request:

`curl -X GET -d macAddress={yourMacAddress} -d sessionKey={yourSessionKey} -d category=’winddir, rainin’ https://{url}/itpower-data/by-category`

### Posting

There’s no reason for you to post to this database! Talk to one of us if you’d like to get more involved in the weather station/database maintenance.

### Contributing

Please set up a local copy of this repository and test out any changes before you do so, but any pull requests/modifications/additional endpoints are welcome. You can follow Don’s original instructions for setup from the Connected Devices [repo](https://github.com/don/itp-connected-devices) - some file names are changed, but the process is functionally identical.
