create table google_merchandising.sessions (
	channelGrouping text null,
	"date" integer null,
	fullVisitorId text null,
	socialEngagementType text null,
	visitId text null,
	visitNumber integer null,
	visitStartTime integer null,
	salesRegion text null,
	device_mobileDeviceMarketingName text null,
	device_screenColors text null,
	device_deviceCategory text null,
	device_flashVersion text null,
	device_mobileDeviceBranding text null,
	device_mobileDeviceModel text null,
	device_screenResolution text null,
	device_mobileDeviceInfo text null,
	device_language text null,
	device_browserSize text null,
	device_browser text null,
	device_operatingSystemVersion text null,
	device_browserVersion text null,
	device_operatingSystem text null,
	device_mobileInputSelector text null,
	device_isMobile boolean null,
	geoNetwork_metro text null,
	geoNetwork_city text null,
	geoNetwork_country text null,
	geoNetwork_cityId text null,
	geoNetwork_subContinent text null,
	geoNetwork_longitude text null,
	geoNetwork_latitude text null,
	geoNetwork_continent text null,
	geoNetwork_networkDomain text null,
	geoNetwork_networkLocation text null,
	geoNetwork_region text null,
	totals_pageviews integer null,
	totals_newVisits integer null,
	totals_totalTransactionRevenue text null,
	totals_hits integer null,
	totals_bounces integer null,
	totals_timeOnSite integer null,
	totals_transactions integer null,
	totals_sessionQualityDim integer null,
	totals_visits integer null,
	totals_transactionRevenue text null,
	trafficSource_adContent text null,
	trafficSource_campaign text null,
	trafficSource_source text null,
	trafficSource_referralPath text null,
	trafficSource_isTrueDirect boolean null,
	trafficSource_keyword text null,
	trafficSource_medium text null
);


-- Copy data from .csv file to the table created above
copy google_merchandising.sessions
from 'path\sessions.csv'
with csv header;

-- Preview table
select * from google_merchandising.sessions
limit 10;