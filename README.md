
[![NSF-0000000](https://img.shields.io/badge/NSF-1915913-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1915913)
# ERC-bird-dispersal
Evaluate abundance and distribution of potential birds dispersing Eastern Red Cedar seeds.
Project is currently under development (2020).

**Authors:** Sarah Supp, Jessy Niu, Kairuo Yan (Denison University)
**Email:** supps@denison.edu

**TODO**
*working from migration-pathways.Rmd
1. merge locs.Rdata with Bombycilla_cedorum.Rdata
2. weight Bombycilla_cedorum counts by effort.Rdata
3. Create migration path for 2008-2019, separately by year, using gam
4. Estimate begin and end dates for migratory season
5. Estimated fasted "speed" of migration (km/day)
6. Repeat for list of species known to disperse eastern redcedar (ERC) cones


Files:
* process-raw-eBird-data.Rmd - This file takes in original files from FAL eBird (effort, locations, polyFID) and merges them together into a species-level .rds file for later analysis. 
* migration-paths.Rmd - This file is used analyze ebird data across multiple species. It creates average migration pathway, identifies start and end of migration seasons, and peak latitude (summer), and identifies linear trends in migration dates (onset, end) through time, where they exist. 
* movement-ecology-paper.Rmd - This file creates an example data visual for Supp et al. 2021 (in revision) Movement Ecology Review manuscript (it is not part of the main repository/project analysis)
* ERC-range.Rmd - This file is used to examine aspects of the ERC tree range and set boundaries for species-level data or aggregation
* three-locations.Rmd - This file was to assess ERC seed disperser presences for Kaitlin Schvach's field locations (related project at Kent State Univ.)
* waxwing_exploratory.Rmd - This file takes eBird data as input and outputs a figure used for the NSF proposal (2019) This is not a main file we are continuing to work with.


Old files (some of these are in oldcode file): 
*These contain code from a previous project, for reference (Supp et al. 2015)*
* hb-migration.r - This file was originally from Supp et al. 2015, and pieces can be used and modified in a new file for the purposes of this new project. 
* migration-fxns.r - This file contains source code for implementing tasts in hb-migration.r
* hb_prep_mb-ebd_tracks_toGrid.R - This file contains code for Supp & Graham et al (unpublished)
* hb_prep_mb-ebd_tracks.R - This file contains code for Supp & Graham et al. (unpublished)
* eBird-effort-new.R - ??
* eBird-effort.R - ??


Data: 
* Bombycilla_cedorum.Rdata - Cedar Waxwing counts by hexagonal polygon grid
* effort.Rdata - Total eBirder count of activity by hexagonal polygon grid
* locs.Rdata - latitude and longitude locations of hexagonal polygon grid cells
* dat_effort.Rdata - merged datafile, created using the three files above in the migration-paths.Rmd file.
* gadm36_CAN_0_sp.rds - map files for Canada (not needed?)
* gadm36_MEX_0_sp.rds - map files for Mexico (not needed?)
* gadm36_USA_0_sp.rds - map files for United States (not needed?)


Figures:
* Cewa_2017.png - Cedar Waxwing eBird occurrences in 2017 across the United States. Exploratory work for the NSF proposal
* migration.pdf - Cedar Waxwing (but check?) centroid latitudes by day of year from 2008-2019
* proposal_figures.pptx - figures developed for the NSF proposal







