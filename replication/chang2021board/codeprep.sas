/**********************************************************************************************************************************************************************
*** This program is used to construct the data used in Chang and Wu (2020) ***
*For the network information, We use BoardEx for individual information on directors and executives in U.S. public firms.
We first match BoardEx firms with Compustat data using CUSIP and CIK and apply a string matching approach by firm name when 
these two identifiers are not available, following previous works such as Engelberg, Gao, and Parsons (2013). 
We then identify social connections between each director and a pool consisting of directors and top executives in our sample firms. 
Two individuals are defined as connected if there are one or more connections of the following three types between the two. 
Two individuals share an employment connection if they are currently employed or were previously employed by the same firm, other than the focal firm, at the same time. 
They share an education connection if they attended the same educational institution and overlapped in time.  
They share an activity connection if they both belong or belonged to a non-business organization, such as a golf club or charity. 
Our primary network measure (Board network) is the number of directors and executives a firm? directors are connected to.  
Please see the paper for further information .

*For the patent information, We include NBER patent database by the United States Patent and Trademark Office (USPTO) from 1976 to 2006  
We use the patent data provided by Kogan, Papanikolaou, Seru, and Stoffman (2017) to update patent information through 2010 
the data is available at https://iu.app.box.com/v/patents/folder/779886700. As noted in the paper, our first measure is the number   
of patents applied for and ultimately granted by the USPTO in a given year. Our second measure is the number of subsequent   
citations received by all patents filed in a given year. Given the nature of truncation bias, we end the sample perido in 2008 and correct  
for the truction bias in patent citations using the technology class-year fixed effect approach in Hall, Jaffe, and Trajtenberg (2001,2005).  
 Essentially, these two measures are aggregated values for firms in a given year. Please see the paper for further information                                                           
 
****************************************************************************************************************************************************************************/

libname dest 'C:\...\data';	*inventory for all datasets; 

/*Get data*/
options ls=72 ps=max nocenter nonumber nodate fullstimer ;

*process and convert BoardEx Network files. There are 95 such files; 
PROC IMPORT OUT= WORK.Network
            DATAFILE= "C:\...\Network - 1.xlsx" DBMS=xlsx REPLACE;
     SHEET="Director Network";      GETNAMES=YES;      MIXED=yes;      RUN; 
data work1; set Network; 
rename DirectorID_=DirectorID1 Linked_DirectorID_=DirectorID2 Connected_CompanyID_=CompanyID Connected_Company=CompanyName 
Connected_Company_Type=CompanyType Date_of_overlap=Overlap Overlapping_Person_s_Role_Title=role2 Individual_s_Role_Title=Role1 
ED_NED_SM_1=directorFlag1 ED_NED_SM=directorFlag2 ; 
drop  Sector  Index ;  * End_of_OverLap; 
if End_of_OverLap="Current" then End_of_OverLap="3014"; Date2=input(End_of_OverLap, BEST12.); 
Date1=Beginning_of_OverLap;
if Date1>3014 then do; Date1=Date1-21916; StartDate=put(Date1, YYMMDDN8.); StartYear=year(Date1); end; if StartYear=. then StartYear=date1; 
if Date2>3014 then do; Date2=Date2-21916; EndDate=put(Date2, YYMMDDN8.); EndYear=year(Date2); end;     if EndYear=. then EndYear=date2; 
drop  End_of_OverLap Beginning_of_OverLap date1 Date2;  
run; 
data append; set work1; run; *500217;


%macro bdx;
%do i=2 %to 30;
PROC IMPORT OUT= WORK.Network
            DATAFILE= "C:\...\Network - &i..xlsx" DBMS=xlsx REPLACE;
     SHEET="Director Network";      GETNAMES=YES;      MIXED=yes;      RUN; 
*rough process; 
data work1; set Network; 
rename DirectorID_=DirectorID1 Linked_DirectorID_=DirectorID2 Connected_CompanyID_=CompanyID Connected_Company=CompanyName 
Connected_Company_Type=CompanyType Date_of_overlap=Overlap Overlapping_Person_s_Role_Title=role2 Individual_s_Role_Title=Role1 
ED_NED_SM_1=directorFlag1 ED_NED_SM=directorFlag2 ; 
if End_of_OverLap="Current" then End_of_OverLap="3014"; Date2=input(End_of_OverLap, BEST12.); 
Date1=Beginning_of_OverLap;
if Date1>3014 then do; Date1=Date1-21916; StartDate=put(Date1, YYMMDDN8.); StartYear=year(Date1); end; if StartYear=. then StartYear=date1; 
if Date2>3014 then do; Date2=Date2-21916; EndDate=put(Date2, YYMMDDN8.); EndYear=year(Date2); end;     if EndYear=. then EndYear=date2; 
drop  End_of_OverLap Beginning_of_OverLap date1 Date2 Sector  Index;  
run; 
*rough append;  data append; set append work1;   run; 
%end;
%mend;
%bdx;

data dest.DirNetwork1_30; set append; run; 


PROC IMPORT OUT= WORK.Network
            DATAFILE= "C:\...\Network - 31.xlsx" DBMS=xlsx REPLACE;
     SHEET="Director Network";      GETNAMES=YES;      MIXED=yes;      RUN; *40 sec !; 
data work1; set Network; 
rename DirectorID_=DirectorID1 Linked_DirectorID_=DirectorID2 Connected_CompanyID_=CompanyID Connected_Company=CompanyName 
Connected_Company_Type=CompanyType Date_of_overlap=Overlap Overlapping_Person_s_Role_Title=role2 Individual_s_Role_Title=Role1 
ED_NED_SM_1=directorFlag1 ED_NED_SM=directorFlag2 ; 
drop  Sector  Index ;  
if End_of_OverLap="Current" then End_of_OverLap="3014"; Date2=input(End_of_OverLap, BEST12.); 
Date1=Beginning_of_OverLap;
if Date1>3014 then do; Date1=Date1-21916; StartDate=put(Date1, YYMMDDN8.); StartYear=year(Date1); end; if StartYear=. then StartYear=date1; 
if Date2>3014 then do; Date2=Date2-21916; EndDate=put(Date2, YYMMDDN8.); EndYear=year(Date2); end;     if EndYear=. then EndYear=date2; 
drop  End_of_OverLap Beginning_of_OverLap date1 Date2;  
run; 
data append; set work1; run; * ;

%macro bdx;
%do i=32 %to 60;
PROC IMPORT OUT= WORK.Network
            DATAFILE= "C:\...\Network - &i..xlsx" DBMS=xlsx REPLACE;
     SHEET="Director Network";      GETNAMES=YES;      MIXED=yes;      RUN; 
*rough process; 
data work1; set Network; 
rename DirectorID_=DirectorID1 Linked_DirectorID_=DirectorID2 Connected_CompanyID_=CompanyID Connected_Company=CompanyName 
Connected_Company_Type=CompanyType Date_of_overlap=Overlap Overlapping_Person_s_Role_Title=role2 Individual_s_Role_Title=Role1 
ED_NED_SM_1=directorFlag1 ED_NED_SM=directorFlag2 ; 
if End_of_OverLap="Current" then End_of_OverLap="3014"; Date2=input(End_of_OverLap, BEST12.); 
Date1=Beginning_of_OverLap;
if Date1>3014 then do; Date1=Date1-21916; StartDate=put(Date1, YYMMDDN8.); StartYear=year(Date1); end; if StartYear=. then StartYear=date1; 
if Date2>3014 then do; Date2=Date2-21916; EndDate=put(Date2, YYMMDDN8.); EndYear=year(Date2); end;     if EndYear=. then EndYear=date2; 
drop  End_of_OverLap Beginning_of_OverLap date1 Date2 Sector  Index;  
run; 
*rough append;  data append; set append work1;   run; 
%end;
%mend;
%bdx;

data dest.DirNetwork31_60; set append; run; *6.5min;


 PROC IMPORT OUT= WORK.Network
            DATAFILE= "C:\...\Network - 61.xlsx" DBMS=xlsx REPLACE;
     SHEET="Director Network";      GETNAMES=YES;      MIXED=yes;      RUN; *40 sec !; 
data work1; set Network; 
rename DirectorID_=DirectorID1 Linked_DirectorID_=DirectorID2 Connected_CompanyID_=CompanyID Connected_Company=CompanyName 
Connected_Company_Type=CompanyType Date_of_overlap=Overlap Overlapping_Person_s_Role_Title=role2 Individual_s_Role_Title=Role1 
ED_NED_SM_1=directorFlag1 ED_NED_SM=directorFlag2 ; 
drop  Sector  Index ;  
if End_of_OverLap="Current" then End_of_OverLap="3014"; Date2=input(End_of_OverLap, BEST12.); 
Date1=Beginning_of_OverLap;
if Date1>3014 then do; Date1=Date1-21916; StartDate=put(Date1, YYMMDDN8.); StartYear=year(Date1); end; if StartYear=. then StartYear=date1; 
if Date2>3014 then do; Date2=Date2-21916; EndDate=put(Date2, YYMMDDN8.); EndYear=year(Date2); end;     if EndYear=. then EndYear=date2; 
drop  End_of_OverLap Beginning_of_OverLap date1 Date2;  
run; 
data append; set work1; run; *500217;


%macro bdx;
%do i=62 %to 95;
PROC IMPORT OUT= WORK.Network
            DATAFILE= "C:\...\Network - &i..xlsx" DBMS=xlsx REPLACE;
     SHEET="Director Network";      GETNAMES=YES;      MIXED=yes;      RUN; 
*rough process; 
data work1; set Network; 
rename DirectorID_=DirectorID1 Linked_DirectorID_=DirectorID2 Connected_CompanyID_=CompanyID Connected_Company=CompanyName 
Connected_Company_Type=CompanyType Date_of_overlap=Overlap Overlapping_Person_s_Role_Title=role2 Individual_s_Role_Title=Role1 
ED_NED_SM_1=directorFlag1 ED_NED_SM=directorFlag2 ; 
if End_of_OverLap="Current" then End_of_OverLap="3014"; Date2=input(End_of_OverLap, BEST12.); 
Date1=Beginning_of_OverLap;
if Date1>3014 then do; Date1=Date1-21916; StartDate=put(Date1, YYMMDDN8.); StartYear=year(Date1); end; if StartYear=. then StartYear=date1; 
if Date2>3014 then do; Date2=Date2-21916; EndDate=put(Date2, YYMMDDN8.); EndYear=year(Date2); end;     if EndYear=. then EndYear=date2; 
drop  End_of_OverLap Beginning_of_OverLap date1 Date2 Sector  Index;  
run; 
*rough append;  data append; set append work1;   run; 
%end;
%mend;
%bdx;

data dest.DirNetwork61_95; set append; run; *6.47min, 21,509,331; 

*use the processed network files; 
data Bdxnetwork ; set dest.DirNetwork1_30 dest.DirNetwork31_60 dest.DirNetwork61_95; run; 


*create relevant director and executive list, for a intersect of BDX and Compustat/crsp sample; 
data Funda2; set dest.Funda2;  run;  *; 
data HistoricBrd; *; set dest.HistoricBrd; source="HistoricBrd"; keep CompanyID source role Company_Name Director_ID directorID Director_Name  StartYear EndYear StartDate EndDate ; run; 
data HistoricNonBrd;*; set dest.HistoricNonBrd; source="HistoricNonBrd"; keep CompanyID source role Company_Name Director_ID directorID Director_Name  StartYear EndYear StartDate EndDate ; run; 
data CurrentBrd;*; set dest.CurrentBrd; source="CurrentBrd"; keep CompanyID source role Company_Name Director_ID directorID Director_Name  StartYear EndYear StartDate ; run; 
data CurrentNonBrd;*; set dest.CurrentNonBrd; source="CurrentNonBrd"; keep CompanyID source role Company_Name Director_ID directorID Director_Name  StartYear EndYear StartDate  ; run; 
proc sort data=HistoricBrd  nodup ; by CompanyID Director_ID StartDate StartYear EndYear; run; 
proc sort data=CurrentBrd  nodup ; by CompanyID Director_ID StartDate StartYear EndYear; run;  run; * ;
proc sort data=HistoricNonBrd  nodup ; by CompanyID Director_ID StartDate StartYear EndYear; run;  run; * ;
proc sort data=CurrentNonBrd  nodup ; by CompanyID Director_ID StartDate StartYear EndYear; run;  run; 
data employment; set HistoricBrd HistoricNonBrd CurrentBrd CurrentNonBrd; run; * ;  
proc sql;	create table CCppl as
select *	from employment	where CompanyID  in   (select CompanyID from funda2); quit; run; * ;

*select the relevant networks only; 
proc sql;	
	create table Bdxnetwork1 as
	select *	
	from Bdxnetwork		
	where DirectorID1 in (select directorID from CCppl) and DirectorID2 in (select directorID from CCppl);
	quit; 

proc datasets library=work;  delete Bdxnetwork; run;quit; 
data Bdxnetwork1; set Bdxnetwork1; * ;
if CompanyType="Armed Forces"  or CompanyType="Government" then delete ; *; 
if CompanyType="Charities" or CompanyType="Sporting" or CompanyType="Medical" then do; 
	if Role1="Member" or Role2="Member" then delete; end; * ;
if CompanyType="Quoted" or CompanyType="Private" then Type="emp"  ;
if CompanyType="Charities" or CompanyType="Clubs" or CompanyType="Medical" then Type="act"  ; 
run; *;

* create the yearly panel data;
data  fundaPPL0; set dest.FundaDirectors;  run; *; 
data Funda; set dest.Compustat7811;  	gvkey1=input(gvkey, BEST12.); if CompYear>=1990; keep gvkey compyear datadate sic ind48 sic2; run; 
proc sql; 
	create table fundaPPL as 
	select  sic, ind48, sic2, CompYear, a.*
    from fundaPPL0  as a  left join Funda as c 
	on a.gvkey=c.gvkey and a.StartYear<=compyear<=a.EndYear ;* ; 
	quit; 

proc sort data=fundaPPL nodup; by gvkey directorID StartYear role CompYear ; run; 

proc sort data=fundaPPL (drop=CompYear) nodupkey; by gvkey directorID StartYear EndYear role; run; *; 

proc sql; 
	create table fundaTie1 as 
	select a.gvkey, a.role, a.StartYear as StartYearEmp, a.EndYear as EndYearEmp, b.*, sic, ind48, sic2
	from fundaPPL as a left join Bdxnetwork1 (drop=StartDate EndDate role1 role2 CompanyType CompanyName directorFlag1 directorFlag2 ) as b  
	on a.directorID=b.DirectorID1 and a.CompanyID^=b.CompanyID  and b.StartYear<=a.EndYear;*she needs to start before the end year (note there is no compyear anymore); 
	quit; 

data fundatie1; set fundatie1; if DirectorID1^=. and CompanyID^=.;
	rename DirectorID1=DirectorID_focal DirectorID2=DirectorID_tie CompanyID=CompanyID_connection  ;  
	laterStart=max(StartYearEmp ,startYear);  
	run;  
proc sort data=fundaTie1  nodup ; by gvkey DirectorID_focal StartYearEmp EndYearEmp DirectorID_tie Type  descending startYear overlap ; run; *quite some more dups!!! more than 1%. 24min;

*create a panel dataset from the connection data; 
PROC IMPORT OUT= WORK.years
            DATAFILE= "C:\Users\qwu5\Documents\P drive\Zhi_QQ\innovation\input\years.xlsx" DBMS=xlsx REPLACE;
     SHEET="Sheet1";      GETNAMES=YES;      MIXED=yes;      RUN; 
proc sql; 
	create table fundaTieYear as select  year, a.*
    from fundaTie1 (drop=Overlap StartYear EndYear) as a  left join years as c 
	on a.laterStart<=c.year<=a.EndYearEmp ;* ; 
	quit;  

proc sort data=fundaTieYear   nodupkey ; by gvkey year DirectorID_focal DirectorID_tie ; run;
data dest.fundaTieYear; set fundaTieYear; run; *15min; 

/*for the same two individuals, keep the emp ties before education before activity ties, to avoid double counting*/
proc sort data=fundaTieYear  nodupkey ; by gvkey year DirectorID_focal DirectorID_tie descending Type ; run; * ; 
proc sort data=fundaTieYear  nodupkey ; by gvkey year DirectorID_focal DirectorID_tie  ; run; * ; 


proc means data=fundaTieYear  noprint; by gvkey year;	output out=count1	( drop=_type_ _freq_)	n(year)=NumAll ;run;   
proc sort data=fundaTieYear  nodup ; by gvkey year Type  ; run; 
proc means data=fundaTieYear  noprint; by gvkey year Type;	output out=countType	( drop=_type_ _freq_)	n(year)=count ;run;   
data act edu emp; set countType; if Type="emp" then  output emp;  if Type="edu" then  output edu;  if Type="act" then  output act; run; 

/*merge the tie variables  */
proc sql;  
	create table count2 as		
	select a.*, c.count as NumAct , b.count as NumEdu, d.count as NumEmp
	from count1 as a 	left join   act  as c		
	on  a.gvkey=c.gvkey and a.year=c.year  
	left join   edu  as b		on  a.gvkey=b.gvkey and a.year=b.year 
	left join   emp  as d		on  a.gvkey=d.gvkey and a.year=d.year ;
	quit;

data dest.network_measures; set count2; 
if NumEmp=. then NumEmp=0; if NumAct=. then NumAct=0; if NumEdu=. then NumEdu=0; if year^=.;  
attrib _all_ label=''; 
rename NumAll=NumAll_Dir  NumEmp=NumEmp_Dir NumAct=NumAct_Dir NumEdu=NumEdu_Dir year=compyear ;  run; *    ;

/*get Compustat data*/
data comp1;
	set dest.funda (keep= &vars);
   	where fyear between 1990 and 2010;
   	if indfmt='INDL' and datafmt='STD' and popsrc='D' and consol='C';
  	* create begin and end dates for fiscal year;
  	format endfyr begfyr date9.;
  	endfyr= datadate;
  	begfyr= intnx('month',endfyr,-11,'beg');

	keep gvkey datadate begfyr endfyr fyr fyear FIC sich at  ni xrd ceq DLTT DLC PRCC_F CSHO Sale PPENT CHE CAPX txfo emp  ebitda;
  	run;

proc sort data = comp1; by gvkey endfyr; run;

*  Obtain the current SIC code;
data getsic;
	set dest.names;
	keep gvkey sic;
	run;

proc sql;
	create table comp2 as
	select *
	from comp1 as a, getsic as b
	where a.gvkey = b.gvkey
	order by gvkey, endfyr;
	quit;

/*get permno*/ 
proc sql;
	create table comp3 as select *
  	from comp2 as a, dest.ccmxpf_linktable as b
  	where a.gvkey = b.gvkey and
  	b.LINKTYPE in ("LU","LC","LD","LN","LS","LX") and
  	b.usedflag=1 and (b.LINKDT <= a.begfyr or missing(b.LINKDT) = 1) and (a.endfyr <= b.LINKENDDT or b.LINKENDDT= .E);
  	quit;

proc sort data=comp3 nodupkey; by gvkey fyear; run;

/* backfill the sic codes, get 2 digit sic and get calender year*/
proc sort data = comp3; by gvkey descending fyear sich; run;

data comp3;
	set comp3;
	by gvkey descending fyear;
	retain lsic;
	if first.gvkey then lsic = sic;
  	if sich^=. then lsic = sich;
	rename lsic = nsic;
	drop sic sich;
	rename lsic = sic;
	run;

data comp3;
	set comp3;
	sic2=int(sic/100);
	sic3=int(sic/10);
	if fyr>0 and fyr <=5 then cyear=fyear+1;
	else if fyr >=6 then cyear=fyear;
	run;

proc sql;
	create table comp4 as
	 select *  ,sum(sale) as market_size
	 from comp3
	 group by fyear, sic3 ;
	quit;

data comp4;
	set comp4;
	market_share_sqr = (sale/market_size)*(sale/market_size);
	run;

*calculate the herfindahl index;
proc sql;
	create table comp5 as
 	select *, sum(market_share_sqr) as Herfindahl
    from comp4
    group by fyear, sic3;
    quit;

/*merge with inflation data from Federal Reserve Economic Data*/
proc sql;	
	create table comp6 as
	select *
	from comp5 as a left join dset.Inflation_rate as b
	on a.cyear = b.year
	order by a.gvkey, a.fyear;
	quit;

/*merge with cleaned patent data*/
proc sql;
	create table dd1 as 
	select a.*,b.*
	from comp6  as a left join dset.patent  as b
	on a.gvkey=b.gvkey and a.cyear=b.appyear+1
	order by a.ngvkey, a.fyear;
	quit;

/*merge with all BdX data*/
proc sql;
	create table dd2 as 
	select a.*,b.*
	from dd1  as a left join dest.network_measures  as b
	on a.gvkey=b.gvkey and a.cyear=b.compyear
	order by a.ngvkey, a.fyear;
	quit;

proc sql;
	create table dd3 as 
	select a.*,b.*
	from dd2  as a left join dest.boardchardata  as b
	on a.gvkey=b.gvkey and a.cyear=b.compyear
	order by a.ngvkey, a.fyear;
	quit;


/*construct required variables for main results*/
data dd3;
	set dd3;
	if 60<=sic2<=69 or sic2=49 then delete;
	if xrd= . then xrd=0;
    lnpatent=log(patent+1);
	lnttcitations=log(ttcitations+1);
   	lnNumAll_Dir=log(NumAll_Dir+1);
	xrd_at=xrd/at;
	lev=(dltt+dlc)/at;
	che_at=che/at;
	capx_at= capx / at;	
	ppe_at=ppent/at;
	lnat=log(at/INFRATE);
	tobinq=(at+prcc_f*csho-ceq)/at;
	roa=ebitda/at;
	lnboardsize=log(boardsize);
	run;

/*main results can be estimated from the followign regression after winsorizing*/
proc genmod;
	 class sic2 cyear;
	 model lnpatent = lnNumAll_Dir xrd_at lev che_at capx_at ppe_at lnat tobinq roa Herfindahl lnboardsize;
	 repeated subject=gvkey / type=ind; 
	run;
	quit;
