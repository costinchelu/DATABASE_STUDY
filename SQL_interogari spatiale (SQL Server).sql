use bdsa;

select SHAPE.STAsText() AS point, * FROM dbo.spitale;

select *, shape.STX as lng, shape.STY as lat from dbo.spitale;

select shape.STLength() as perimetru, shape.STArea() as aria from dbo.SPITALE;

select OBJECTID, HospitalNa, Uat, County, Address, shape.STBuffer(0.002) as buffergeom from dbo.SPITALE;

select OBJECTID, county, SHAPE.STBuffer(-0.02) as judbuffer from dbo.JUDETE;

select * from dbo.SPITALE where HospitalNa LIKE '%Babes%';

select shape.STBuffer(0.002) as tampon_vb, HospitalNa, Address from dbo.SPITALE where OBJECTID = 80;

-- selecteaza toate spitalele care se afla in judetul sibiu
declare @geomsb geometry;
set @geomsb = (select shape from dbo.JUDETE where county = 'SB');
select * from dbo.SPITALE where shape.STIntersects(@geomsb) = 1;

-- sau

select * from dbo.SPITALE where shape.STIntersects((select shape from dbo.JUDETE where county = 'SB')) = 1;

-- calculati distanta dintre puncte
select HospitalNa, shape.STDistance((select shape from dbo.judete where county = 'SB')) as dist from dbo.SPITALE;

declare @geomsbunion geometry;
set @geomsbunion = (select shape from dbo.judete where county = 'SB');
declare @geombvunion geometry;
set @geombvunion = (select shape from dbo.judete where county = 'BV');
select ((select shape from dbo.judete where county = 'SB')).STUnion((select shape from dbo.judete where county = 'BV')) from dbo.SPITALE;


select geometry::CollectionAggregate(shape).STAsText() as Romania from dbo.JUDETE;


-- selectati spitalele din judetele PH si BV 
-- selectati spitalele suport_covid din judetele ph si bv
declare @geomphbv geometry;
set @geomphbv = (select geometry::CollectionAggregate(shape) from dbo.JUDETE where county in ('PH', 'BV'));
select * from dbo.spitale where shape.STIntersects(@geomphbv) = 1 and Category = 'SUPORT_COVID';