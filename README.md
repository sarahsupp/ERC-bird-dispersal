
[![NSF-0000000](https://img.shields.io/badge/NSF-1915913-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1915913)
# ERC-bird-dispersal
Evaluate abundance and distribution of potential birds dispersing Eastern Red Cedar seeds.
Project is currently under development (2020).

**Authors:** Sarah Supp, Jessy Niu (Denison University)

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
* waxwing_exploratory.Rmd - This file takes eBird data as input and outputs a figure used for the NSF proposal (2019)
* migration-paths.Rmd - This file will be used to create average migration pathways for species, starting with cedar waxwing
* continue to add...


Old files: 
*These contain code from a previous project, for reference (Supp et al. 2015)*
* hb-migration.r - This file was originally from Supp et al. 2015, and pieces can be used and modified in a new file for the purposes of this new project. 
* migration-fxns.r - This file contains source code for implementing tasts in hb-migration.r


Data: 
* Bombycilla_cedorum.Rdata - Cedar Waxwing counts by hexagonal polygon grid
* effort.Rdata - Total eBirder count of activity by hexagonal polygon grid
* locs.Rdata - latitude and longitude locations of hexagonal polygon grid cells
* dat_effort.Rdata - merged datafile, created using the three files above in the migration-paths.Rmd file.
