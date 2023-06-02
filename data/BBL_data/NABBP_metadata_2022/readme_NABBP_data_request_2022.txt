July 2022

The data is provided "as is" without warranty or any representation of accuracy, timeliness or completeness.

The data format is comma-delimited text in utf8 encoding.

Lookup tables must be matched to year of results tables.

2022 Results tables may include the following fields:
---------------------------------------------------
band                         Twelve-digit alphanumeric identifier representing individual federal metal band on bird at time of data retrieval. Band number is obfuscated.

original_band                Original band, usually (for original banding) is same as band. Twelve-digit alphanumeric identifier for individual federal metal band attached to bird at time of original banding. Band number is obfuscated.

other_bands                  Twelve-digit alphanumeric identifiers for other federal metal bands on bird at some point in its life. Bands may be replaced during the lifetime of a bird. All bands associated with this bird other than this band are included here. Band number is obfuscated.

event_type                   Two event types: B-Banding, E-Encounter. Definition of encounter here includes record sources for both encounters and recaptures.

event_date                   Text in format mm/dd/yyyy. Event date for a banding record is the date of release. Event date for encounter and recapture records is the date of capture or observation. May include inexact date values. See lookup table inexact_dates.csv for definitions.

event_day                    Day of month bird was banded, recaptured or encountered. It may include inexact day values. See lookup table inexact_dates.csv for definitions.

event_month                  Month a bird was banded, recaptured or encountered. It may include inexact month values. Refer to lookup table inexact_dates.csv for definitions of inexact month.
event_year                   Year bird was banded, recaptured or encountered.

iso_country                  Two-letter abbreviation of country for bird banding release location, country of capture for encounters and recapture location. Country designations are described in lookup table country_state.csv.

iso_subdivision              Five-character code for US and Canada, empty for others. For example US-MD, CA-ON. For bandings, country subdivision represents location of bird release. For encounters and recaptures, subdivision represents location of bird capture. US and Canada only are subdivided to state and province. See lookup table country_state.csv.

lat_dd                       Latitude, decimal degrees. Location of bird banding, recapture or encounter.

lon_dd                       Longitude, decimal degrees. Location of bird banding, recapture or encounter record.

coordinates_precision_code   See lookup table coordinates_precision.csv. Includes numeric codes for 13 coordinate precision categories. All banding and encounter records for sensitive species are released at 10-minute block coordinate precision. Game birds include waterfowl, cranes, rails, woodcock, doves, crows and ravens. All bandings are released at 1-degree block coordinate precision, encounters are released at coordinate precisions as originally provided.

band_type_code               Two-digit alphanumeric codes and descriptions of band types and closures. See lookup table band_type.csv.

species_name                 Currently accepted common species names for birds in NABBP dataset. Additional designations include dead bird, hybrids and unidentified species. See lookup table species.csv for 4-character alpha codes, 4-digit numeric codes, common and scientific names, recommended band sizes, and species group designations for 1065 species of birds.

species_id                   Four-digit BBL numeric code to identify species. Species IDs are defined in lookup table species.csv. Additional designations include dead bird, hybrids and unidentified species. Species.csv also includes 4-character alpha codes, 4-digit numeric codes, common and scientific names, recommended band sizes, and species group designations for 1065 species of birds.

bird_status                  Bird status is a single-digit numeric code describing aspects of bird or circumstances at time of banding. See lookup table bird_status.csv for single-digit numeric codes and descriptions for 8 bird status categories 2-8. ([ – ] represents dead bird) 

extra_info_code              Two-digit numeric code used with bird status code to describe additional aspects of bird or circumstances at time of banding. See extra_info.csv lookup table of two-digit numeric codes for 43 bird status sub-categories.

age_code                     See lookup table age.csv for alpha codes, numeric codes and descriptions of 9 bird age categories.

sex_code                     See sex.csv lookup table for alpha codes, numeric codes and descriptions of 5 bird sex categories.

permit                       Eight-digit alphanumeric identifier representing a bird banding permit. Permit numbers are obfuscated.

band_status_code             See lookup table band_status.csv for alphanumeric codes and descriptions of 10 band status categories. Range of values are 0-8, F,X.

how_obtained_code            See lookup table how_obtained.csv for 2-digit numeric codes and descriptions of 69 how record was obtained categories. The how_obtained_code describes how a bird was obtained in encounter and recapture records.

who_obtained_code            See lookup table who_obtained.csv for 2-digit numeric codes and descriptions of 10 categories. The who_reported_code describes finder of a bird obtained in encounter and recapture records.

reporting_method             See reporting_method.csv lookup table for 2-digit numeric codes and descriptions of 14 categories of reporting methods.

present_condition            Present condition refers to condition of bird and condition of band at time of encounter or recapture. See present_condition.csv lookup table for 2-digit numeric codes and descriptions for 15 combinations of present condition.

min_age_at_enc               Minimum age of a bird at time of encounter or recapture is calculated using difference of dates between banding and encounter records. Decimal value translates to years and months (e.g. 12.25 = 12 years 3 months).

record_source                Indicates source of record in NABBP database. See record_source.csv lookup table for 3 values: B – banding, E – encounter, R – recapture.

species_scientific_name      Currently accepted scientific names for birds in NABBP dataset. Scientific names are defined in lookup table species.csv. Species.csv also includes 4-character alpha codes, 4-digit numeric codes, common and scientific names, recommended band sizes, and species group designations for 1065 species of birds.


2022 lookup tables:
-----------------------------
event_type.csv
extra_info.csv
how_obtained.csv
inexact_dates.csv
present_condition.csv
record_source.csv
reporting_method.csv
sex.csv
species.csv
who_obtained.csv
age.csv
band_status.csv
band_type.csv
bird_status.csv
coordinates_precision.csv
country_state.csv

-----------------------------

Data source BBL_DATA_RELEASE_2022, retrieved 2022-07-11:
https://www.pwrc.usgs.gov/bbl/Bander_portal


