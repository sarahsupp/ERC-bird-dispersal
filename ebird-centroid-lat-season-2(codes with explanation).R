##
##
##

id.arg <- as.numeric(Sys.getenv("SLURM_ARRAY_TASK_ID"))

.libPaths("/mnt/nfs/home/lasorte/R_Libs")
library(mgcv)
library(features)
library(geosphere)

##
setwd("/mnt/nfs/scratch1/lasorte/Western-Hemisphere-duration_study/data/centroids")
fls <-list.files() #use our centroids data, which is weighted_mean_locs
spp <- gsub(".RData", "", fls) #contain`s all of the species

##
tbl <- data.frame(aaa=seq(1,3900,100),
                  bbb=seq(100,3900,100)) ## 39
tbl2 <- tbl[id.arg,]


##
##
##
for(iii in tbl2$aaa:tbl2$bbb){
    
  setwd("/mnt/nfs/scratch1/lasorte/Western-Hemisphere-duration_study/data/centroids")
  load(fls[iii])
  names(out)[[3]] <- "lon"
  names(out)[[4]] <- "lat"
  yrs <- sort(unique(out$year))
  
  ## 
  #out.c is the centroids
  #out.s is season 
  out.s <- out.c[out.c$day %in% 166:227,] #summer dates (s=season)
  out.mx <- out.s[which.max(out.s$y),2:3] #find maximum latitude
  out.s <- out.c[out.c$day %in% c(319:365,1:74),] #winter dates
  out.mn <- out.s[which.min(out.s$y),2:3] #find minimum latitude
  dst.mig <- round(distVincentyEllipsoid(out.mx, out.mn)/1000) #calculate total distance between min latitude and max latitude

  if(is.na(out.mx[2])) next #not relevant
  if(out.mx[2]<30) next #not relevant
  if(dst.mig<200) next #not relevant
  

  ##
  ## year
  ##
  yrs2 <- 2012:2021 #edit for our years
  seas.out <- NULL
  lat.out <- NULL
  for(jjj in 1:length(yrs2)){
      
    ## buffer year
    yrs3 <- c(yrs2[jjj]-1, yrs2[jjj], yrs2[jjj]+1) #find the buffer years (focal-1,focal, focal+1)
    out2 <- out[out$year %in% yrs3,] #filtering down to the three year period
    if(nrow(out2)==0) next #test if there no data
    
    out2 <- out2[out2$day!=366,] #get rid of extra day in leap years
    out2a <- out2[out2$year==yrs3[1] & out2$day>319,] #end of year1 (winter)
    out2a$day2 <- out2a$day - 365 #renubmering so it makes sense in order
    out2b <- out2[out2$year==yrs3[2],] #focal year (year2; all)
    out2b$day2 <- out2b$day
    out2c <- out2[out2$year==yrs3[3] & out2$day<74,] #beginning of year3 (winter)
    out2c$day2 <- out2c$day + 365 #renumbering so it makes sense in order
    out2 <- rbind(out2a, out2b, out2c) #merge together the buffer times for the focal year
    out2 <- out2[order(out2$day2),] #sort by all the days

    ##
    if(nrow(out2)<300) next #check for missing/incomplete data

    ##
    gv <- seq(0,8,1) #test a range of different parameters to try to get the best gam
    kv <- seq(8,20,1) #test a range of parameters
    spr.mx <- NULL
    aut.mn <- NULL
    prd.out <- NULL
    dts <- NULL
    for(kkk in 1:length(kv)){
      
      for(ggg in 1:length(gv)){
        
        mdl <- gam(lat ~ s(day2,k=kv[kkk]), 
                   data=out2, 
                   gamma=gv[ggg])
        x.data <- data.frame(day2=1:365)
        prd.lat <- predict(mdl, newdata=x.data, type="response")           

        prd.out <- cbind(prd.out, prd.lat) #predicted dates from gam fit
        
        ## derivatives
        ### features package extracts the 1st and 2nd derivatives
        fts <- features(x.data$day2, prd.lat, smoother="glkerns",
                        control = list(npts=365))
        d1 <- attributes(fts)$fits$d1
        spr.mx <- c(spr.mx, which.max(d1[20:140])+19) #spring max date (day of year)
        aut.mn <- c(aut.mn, which.min(d1[220:320])+219) #autumn min date (day of year)
        
        d2 <- attributes(fts)$fits$d2
        
        ## for all the dates within -- seek expert opinion and check that windows contain those dates, treat them as a buffer for a sensible set up to the analysis.
        ## spring (get three dates)
        s2 <- which.max(d1[10:140]) + 9 #middle
        s1 <- try(which.max(d2[(s2-40):s2]) + (s2-41), silent=TRUE) #beginning
        s3 <- try(which.min(d2[s2:(s2+40)]) + (s2-1), silent=TRUE) #end
        
        ## autumn
        a2 <- which.min(d1[220:355]) + 219 #middle
        a1 <- try(which.min(d2[(a2-40):a2]) + (a2-41), silent=TRUE) #beginning
        a3 <- try(which.max(d2[a2:(a2+40)]) + (a2-1), silent=TRUE) #end
        
        ##
        if(class(s1)=="try-error") s1 <- NA
        if(class(s3)=="try-error") s3 <- NA
        if(class(a1)=="try-error") a1 <- NA
        if(class(a3)=="try-error") a3 <- NA
        
        ##
        dts <- rbind(dts, data.frame(s1=s1, s2=s2, s3=s3, 
                                     a1=a1, a2=a2, a3=a3))

      }
      
    } 
    prd.lat <- rowMeans(prd.out) #average prediction

    ## mean first derivative
    spr.mx <- mean(spr.mx)
    aut.mn <- mean(aut.mn)
   
    ## quantile second derivative 
    #### (method is to look across all the results to find the best line that would match what you'd expect to see)
    #### recommend using 0.1 and 0.9, could be adjusted but found to work well on lots of species
    #### removes some of the extreme outliers
    ### dts is dates 
    dts <- data.frame(species=spp[iii],
                      year=yrs2[jjj],
                      s1=quantile(dts[is.finite(dts$s1),"s1"], 0.1, na.rm=TRUE), 
                      s2=spr.mx,
                      s3=quantile(dts[is.finite(dts$s3),"s3"], 0.9, na.rm=TRUE),
                      a1=quantile(dts[is.finite(dts$a1),"a1"], 0.1, na.rm=TRUE), 
                      a2=aut.mn,
                      a3=quantile(dts[is.finite(dts$a3),"a3"], 0.9, na.rm=TRUE))
    
    ##
    seas.out <- rbind(seas.out, dts) #season out, stacks everything together into one datatable, results from dts quantile
    lat.out <- rbind(lat.out, data.frame(species=spp[iii],
                                         year=yrs2[jjj],
                                         day=1:365,
                                         lat=prd.lat))
  } 
  if(is.null(seas.out)) next
  
  ##
  setwd("/mnt/nfs/scratch1/lasorte/Western-Hemisphere-duration_study/analysis/seasons-year-2")
  save(seas.out, lat.out, dst.mig, file=paste0(spp[iii],".RData"))
  
}


