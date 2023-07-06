
[![NSF-0000000](https://img.shields.io/badge/NSF-1915913-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1915913)
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

Several specialized packages are used in the software and will need to be installed or updated. Below, we provide the sessionInfo() from July 6, 20223.

<img width="825" alt="session_info_230706" src="https://github.com/sarahsupp/ERC-bird-dispersal/assets/1189512/6b1bc039-6850-429a-8a33-69cf16e35fe4">


---
### Data
This project requires data from multiple different sources, all of which are freely available to request online by the original data providers. We provide here our queried versions of the raw data, for replication purposes.

The updated data used for drafting the multi-species disperser network manuscript is stored in the folder `data_2023` and comes from three main sources.

#### eBird
This data can be queried directly from eBird using their website or using the `auk` package in R. We worked directly with collaborator La Sorte to query the raw eBird data for 15 target species (listed above) and to assign locations into equal-area icosahedron cells (hexagonal grid) at resolution=5 for analysis. We also queried the total number of eBird records (including non-target species) for each icosahedron cell.

| file name and location | description| data wrangling |
| ------------- | ------------- | ------------- |
| raw_eBird_data_2023/species/[species name].RData | counts for each target species  | raw data  |
| raw_eBird_data_2023/effort-cout_2023.Rdata  | total number of eBird records submitted, for any species, for each grid cell  | raw data  |
| raw_eBird_data_2023/locs_2023.Rdata  | latitude and longitude locations of hexagonal polygon grid cells  | raw data  |
| effort-merged_data_2023/dat_effort_[species name].rds  | partly processed files that merge the species occurrences with the effort datasets for analysis  | merged data  |
| dat_effort_2023.rds  | merged datafile with all species, created using the files above in migration-paths.Rmd  | merged data  |
| dat_effort_in_range_2023  | filters observations from dat_effort_2023.rds that fall within the ERC range  | processed data  |
| df_nvector_2023.rds  | adds lats/lons as n-vector representation to dat_effort_2023.rds | processed data  |
| migration_timing_2023.rds  | for every species and for each year, this dataframe shows the average start, middle, and end dates for autumn and spring migration  | output data  |
| daily_mean_lats_2023.rds  | for every day from 2009 to 2022, this dataframe shows the average latitude of each species on that day  | output data  |
| ContentCell  | ContentCell  | ContentCell  |
| ContentCell  | ContentCell  | ContentCell  |
| ContentCell  | ContentCell  | ContentCell  |
| ContentCell  | ContentCell  | ContentCell  |
| ContentCell  | ContentCell  | ContentCell  |
| ContentCell  | ContentCell  | ContentCell  |



* Bombycilla_cedorum.Rdata - Cedar Waxwing counts by hexagonal polygon grid
* effort-merged_data_2023 - a folder that contains .rds files for each bird (species counts by hexagonal polygon grid)
* effort.Rdata - Total eBirder count of activity by hexagonal polygon grid
* locs.Rdata - latitude and longitude locations of hexagonal polygon grid cells
* dat_effort.Rdata - merged datafile, created using the files above in the migration-paths.Rmd file.
  

* occurrence_maps.rds - bird species ranges (breeding, non-breeding, etc.), see Metadata_BirdLife_HBW_Bird_Maps_2022.2.docx for more information
* BBL2022.rds - Bird Banding Laboratory data with all captures/recaptures from 1960 - 2022, see NABBP_metadata_2022 for more information
* ERC_shapefile_2023 - updated shapefile for ERC range (just one polygon)
* BBL_in_range_2022.rds - only includes observations from BBL2022.rds that fall within the ERC range (not needed?)
* gadm36_CAN_0_sp.rds - map files for Canada (not needed?)
* gadm36_MEX_0_sp.rds - map files for Mexico (not needed?)
* gadm36_USA_0_sp.rds - map files for United States (not needed?)


### Files:
* process-raw-eBird-data.Rmd - This file takes in original files from FAL eBird (effort, locations, polyFID) and merges them together into a species-level .rds file for later analysis. 
* migration-paths.Rmd - This file is used analyze ebird data across multiple species. It creates average migration pathway, identifies start and end of migration seasons, and peak latitude (summer), and identifies linear trends in migration dates (onset, end) through time, where they exist. 
* movement-ecology-paper.Rmd - This file creates an example data visual for Supp et al. 2021 (in revision) Movement Ecology Review manuscript (it is not part of the main repository/project analysis)
* ERC-range.Rmd - This file is used to examine aspects of the ERC tree range and set boundaries for species-level data or aggregation
* three-locations.Rmd - This file was to assess ERC seed disperser presences for Kaitlin Schvach's field locations (related project at Kent State Univ.)
* waxwing_exploratory.Rmd - This file takes eBird data as input and outputs a figure used for the NSF proposal (2019) This is not a main file we are continuing to work with. 
* BBL_summary.Rmd - This file takes data from Bird Banding Laboratory (BBL) as input and uses it to create maps depicting the movements of individual banded birds (that were captured more than once) for each species
* cooccur.Rmd - This file uses eBird data (that has been filtered to fall within the range of the ERC) in order to calculate species co-occurrence for the 15 species of interest
* ERC_shapefile_basics.Rmd - This file uses a shapefile of the ERC's range to filter eBird data to only include observations that fall within that range
* Migration-path-window.Rmd - This file uses GAMs to calculate the yearly migration paths for the 15 species of interest, as well as the start/end dates of those migrations for the 15 species of interest
* plot_migration_paths.Rmd - This file uses the results from Migration-path-window.Rmd to plot the migration paths for all 15 species
* occ_range_maps.Rmd - This file uses occurrence range data from BirdLife International and Handbook of the Birds of the World to calculate the distance between the breeding and non-breeding ranges for each migratory bird species of interest. This file also uses the data to make occurrence range maps for each migratory species



### Old files (some of these are in oldcode file): 
*These contain code from a previous project, for reference (Supp et al. 2015)*
* hb-migration.r - This file was originally from Supp et al. 2015, and pieces can be used and modified in a new file for the purposes of this new project. 
* migration-fxns.r - This file contains source code for implementing tasts in hb-migration.r
* hb_prep_mb-ebd_tracks_toGrid.R - This file contains code for Supp & Graham et al (unpublished)
* hb_prep_mb-ebd_tracks.R - This file contains code for Supp & Graham et al. (unpublished)
* eBird-effort-new.R - ??
* eBird-effort.R - ??





### Figures:
* Cewa_2017.png - Cedar Waxwing eBird occurrences in 2017 across the United States. Exploratory work for the NSF proposal
* migration.pdf - Cedar Waxwing (but check?) centroid latitudes by day of year from 2008-2019
* proposal_figures.pptx - figures developed for the NSF proposal







