get_BON_PIT_obs<-function(start_month,start_mday,end_month,end_mday,years){
  for(i in 1:length(years)){
    year=years[i]
    url<-paste0(
      "https://www.cbr.washington.edu/dart/cs/php/rpt/pitall_obs_de.php?sc=1&queryName=pitadult_obs_de&stage=A&outputFormat=csv&year=",
      year,
      "&proj=B2A%3ABonneville+Dam+Adult+Fishways+%28B2A+BO1+BO2+BO3+BO4+BWL%29+rkm+234&species=3&run=Null&rear_type=Null&span=no&startdate=",
      start_month,
      "%2F",
      start_mday,
      "&enddate=",
      end_month,
      "%2F",
      end_mday,
      "&syear=",
      year,
      "&eyear=",
      year,
      "&reltype=alpha&relloc=&summary=no"
    )
    if(i==1){
      dat<-read_csv(url)
    }else{
      dat<-dat%>%
        bind_rows(read_csv(url))
    }
  }
  return(dat)
}
