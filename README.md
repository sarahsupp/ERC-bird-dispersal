# ERC-bird-dispersal
Evaluate abundance and distribution of potential birds dispersing Eastern Red Cedar seeds.
Project is currently under development.

Authors: Sarah Supp, Jessy Niu
Email: supps@denison.edu

**TODO**
1. merge locs.Rdata with Bombycilla_cedorum.Rdata
2. weight Bombycilla_cedorum counts by effort.Rdata
3. Create migration path for 2008-2019, separately by year


Files:
* waxwing_exploratory.Rmd - This file takes eBird data as input and outputs a figure used for the NSF proposal (2019)
* hb-migration.r - This file was originally from Supp et al. 2015, and is being modified with updated packages and for the purposes of this new project. 
* continue to add...


Data: 
* Bombycilla_cedorum.Rdata - Cedar Waxwing counts by hexagonal polygon grid
* effort.Rdata - Total eBirder count of activity by hexagonal polygon grid
* locs.Rdata - latitude and longitude locations of hexagonal polygon grid cells
