[![NSF-0000000](https://img.shields.io/badge/NSF-1915913-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1915913)
 [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
 
# ERC-bird-dispersal
Evaluate abundance and distribution of a multi-species avian seed dispersal network for Eastern Red Cedar trees. The code and data in this repository support the NSF award #1915913 (2019-2024), part of a Multi-Institution Collaborative award that includes researchers at Denison University, Kent State University, Ohio State University, and Holden Arboretum. The results of this analysis partly support a spatially explicit model for eastern red cedar range expansion (lead author, Gil Bohrer, Ohio State University) and a scientific paper about the spatial and temporal distribution and co-occurence of 15 bird species known to forage on and spread eastern redcedar fruits.
This project is currently under development (2020).

**Code Authors and Contributors:** Sarah Supp, Jessy Niu, Kairuo Yan, Esther Lee, Maximilian Wisnefski (Denison University), Frank A. La Sorte (Cornell University)

**Contact Email:** supps@denison.edu

---

## Getting Started
If you want to use or modify the code developed in this repository, please read the following steps to help with your setup and implementation.

### Prerequisites
This software requires Program R version 4.3 or greater. R can be downloaded for free <https://www.r-project.org/>.

Several specialized packages are used in the software and will need to be installed or updated. Below, we provide the sessionInfo() from July 6, 2023.


<img width="825" alt="session_info_230706"
src= "https://github.com/sarahsupp/ERC-bird-dispersal/assets/97928692/4ff74b31-c8aa-4842-ae41-e01381c7d4bd">


---
### Data
This project requires data from multiple different sources, all of which are freely available to request online by the original data providers. We provide here our queried versions of the raw data, for replication purposes.

The updated data used for drafting the multi-species disperser network manuscript is stored in the folder `data` and comes from three main sources.

#### eBird data
This data can be queried directly from eBird using their website or using the `auk` package in R. We worked directly with collaborator La Sorte to query the raw eBird data for 15 target species (listed above) and to assign locations into equal-area icosahedron cells (hexagonal grid) at resolution=5 for analysis. We also queried the total number of eBird records (including non-target species) for each icosahedron cell.

*Files are separately stored in raw data, intermediate data, and results data folders* 

| file name and location | description| data wrangling |
| ------------- | ------------- | ------------- |
| 1-raw_eBird_data/species/[species name].RData | counts for each target species  | raw data  |
| 1-raw_eBird_data/effort-count.Rdata  | total number of eBird records submitted, for any species, for each grid cell  | raw data  |
| 1-raw_eBird_data/locs.Rdata  | latitude and longitude locations of hexagonal polygon grid cells  | raw data  |
| 2-intermediate_eBird_data/species_effort/dat_effort_[species name].rds  | partly processed files that merge the species occurrences with the effort datasets for analysis  | merged data  |
| 2-intermediate_eBird_data/dat_effort_filtered.rds  | merged datafile with all species, created using the files above in migration-paths.Rmd  | merged data  |
| 2-intermediate_eBird_data/df_nvector.rds  | adds lats/lons as n-vector representation to dat_effort_2023.rds | processed data  |
| 2-intermediate_eBird_data/weighted_mean_locs.rds | calculates weighted mean locations for each day, using the nvector estimates | processed data |
| 2-intermediate_eBird_data/mig_spp_dailylocs.rds | adds gam estimated daily locations | processed data |
| 3-results_data/migration_dates.rds  | for every species and for each year, this dataframe shows the average start, middle, and end dates for autumn and spring migration  | output data  |
| 3-results_data/max_speed.rds  | for every species and for each year, this dataframe shows median maximum migration speed  | output data  |
| 3-results_data/max_speed_summary.rds  | for every species provides an overall summary of the maximum migration speeds  | output data  |
| 3-results_data/lm_migration_dates.rds  | for every species summarizes the linear model results for directional change in migration timing  | output data  |


#### USGS Bird Banding Lab (BBL) data
This data can be requested directly from the USGS Bird Banding Lab web interface [https://www.usgs.gov/labs/bird-banding-laboratory](https://www.usgs.gov/labs/bird-banding-laboratory). We queried data from 1960-2022 for our 15 target species. These data represent individually marked birds and their (re)capture locations.

| file name and location | description| data wrangling |
| ------------- | ------------- | ------------- |
| BBL_data/NABBP_metadata_2022  | contains files and information about the BBL data  | metadata  |
| BBL_data/BBL2022.rds  |  Bird Banding Laboratory data with captures/recaptures 1960 - 2022 | raw data  |
| BBL_data/BBL_in_range.rds  |  Bird Banding Laboratory data filtered to occurrences within the Haas ERC shapefile | raw data  |



#### Shapefiles and Range Maps
Brief description of the data and data sources.

| file name and location | description| data wrangling |
| ------------- | ------------- | ------------- |
| bird_occurrence_range_maps/Medatadata_BirdLife_HBW_Bird_Maps_2022.2.docx  | information about Bird Life International range maps  | metadata  |
| bird_occurrence_range_maps/occurrence_map.rds  | bird species ranges (breeding, non-breeding, etc.)  | processed data  |
| ERC_shapefile_2023/junivirg.*  | shapefiles for eastern redcedar range polygon  | processed data  |


### Code files

| file name and location | description| analysis stage |
| ------------- | ------------- | ------------- |
| process-raw-eBird-data.Rmd | This is the first code file to run if you are starting with the raw data files. This file takes in original files from FAL eBird (effort, locations, polyFID) and merges them together into a species-level .rds file for later analysis. | aggregates data |
| daily-nvector-centroids.Rmd | This is the second code file to run after initial data processing. It takes in the species files that were merged with eBird effort, uses the nvector method with a weighted mean to calculate daily centroids for population-level lat-lon, for each species, and adds season labels. It outputs a single datafile merging the results for all species. | outputs figures and results| 
| migration-paths.Rmd | This is the third code file to run, after generating the merged species-level .rds file and generating the centroids using the nvector method. This file is used analyze ebird data across multiple species. It creates average migration pathway, identifies start and end of migration seasons, and peak latitude (summer), and identifies linear trends in migration dates (onset, end) through time, where they exist. | outputs figures and results |
|community-analysis.Rmd | This file conducts a diversity analysis using the 15 ERC seed dispersing species and estimates for richness, shannon, and simpson diversity using the iNEXT package. | outputs figures and results |
| ERC_shapefile_basics.Rmd | This file uses a shapefile of the ERC's range (W. Haas) to filter eBird and BBL data to only include observations that fall within that range. Produces summary figures showing the data locations relative the to ERC range extent boundaries and writes new filtered datafiles | processes data |
| BBL_summary.Rmd | This file takes data from Bird Banding Laboratory (BBL) as input and uses it to create maps depicting the movements of individual banded birds (that were captured more than once) for each species | outputs figures and results |
| occ_range_maps.Rmd | This file uses occurrence range data from BirdLife International and Handbook of the Birds of the World to calculate the distance between the breeding and non-breeding ranges for each migratory bird species of interest. This file also uses the data to make occurrence range maps for each migratory species | outputs figures and results |


Several code files represent small calculations, exploration, or side analyses for related projects.
| file name and location | description| analysis stage |
| ------------- | ------------- | ------------- |
| movement-ecology-paper.Rmd | creates an example data visual for [Supp et al. 2021](https://movementecologyjournal.biomedcentral.com/articles/10.1186/s40462-021-00294-2) article (not part of the main project) | outputs figures |


### figs files
These represent figures that are relevant to the main project. It contains .png and .txt files.


---

### Old files (some of these are in oldcode file): 
**old files, SRS may move or delete if no longer needed**
Most of these files have been moved into the old-code-data folder for now, will decide if keeping or archiving elsewhere prior to publication.

| file name and location | description| analysis stage |
| ------------- | ------------- | ------------- |
| ERC-range.Rmd | examine aspects of the ERC tree range and set boundaries for species-level data or aggregation | does not complete |
| three-locations.Rmd | assess ERC seed disperser presences for K. Schvach field locations (related project at Kent State Univ.) | does not complete |
| waxwing_exploratory.Rmd | takes eBird data as input and outputs a figure used for the NSF proposal (2019) This is not a main file we are continuing to work with. | no longer needed |
| Migration-path-window.Rmd | This file uses GAMs to calculate the yearly migration paths for the 15 species of interest, as well as the start/end dates of those migrations for the 15 species of interest. calcuates using average of multiple parameter settings (k, g) | outputs figures and results |
| plot_migration_paths.Rmd | This file uses the results from Migration-path-window.Rmd to plot the migration paths for all 15 species | run after migration-path-window, outputs figures |
| cooccur.Rmd | This file uses eBird data (that has been filtered to fall within the range of the ERC) in order to calculate species co-occurrence for the 15 species of interest | outputs results |

* Bombycilla_cedorum.Rdata - Cedar Waxwing counts by hexagonal polygon grid
* effort-merged_data_2023 - a folder that contains .rds files for each bird (species counts by hexagonal polygon grid)
* effort.Rdata - Total eBirder count of activity by hexagonal polygon grid
* locs.Rdata - latitude and longitude locations of hexagonal polygon grid cells
* dat_effort.Rdata - merged datafile, created using the files above in the migration-paths.Rmd file.
* gadm36_CAN_0_sp.rds - map files for Canada (not needed?)
* gadm36_MEX_0_sp.rds - map files for Mexico (not needed?)
* gadm36_USA_0_sp.rds - map files for United States (not needed?)
These contain code from a previous project, for reference (Supp et al. 2015)*
* hb-migration.r - This file was originally from Supp et al. 2015, and pieces can be used and modified in a new file for the purposes of this new project. 
* migration-fxns.r - This file contains source code for implementing tasts in hb-migration.r
* hb_prep_mb-ebd_tracks_toGrid.R - This file contains code for Supp & Graham et al (unpublished)
* hb_prep_mb-ebd_tracks.R - This file contains code for Supp & Graham et al. (unpublished)
* eBird-effort-new.R - ??
* eBird-effort.R - ??


**Figures:**
* Cewa_2017.png - Cedar Waxwing eBird occurrences in 2017 across the United States. Exploratory work for the NSF proposal
* migration.pdf - Cedar Waxwing (but check?) centroid latitudes by day of year from 2008-2019
* proposal_figures.pptx - figures developed for the NSF proposal







