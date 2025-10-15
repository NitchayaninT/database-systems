# union
Select * From  lecture04.P
union
Select * From  lecture04.P2;

# difference
Select * From  lecture04.Fname
except
Select * From  lecture04.Fname2;

# Product (cross join)
SELECT * 
FROM lecture04.P cross join store;

# With condition
SELECT * FROM lecture04.P 
WHERE Price < 2.0;

SELECT * FROM lecture04.P 
WHERE P_CODE = 311452;

#P_CODE starts with 1
SELECT * FROM lecture04.P 
WHERE P_CODE LIKE '1%'; #pattern

# shows only price column
SELECT Price,P_Descript FROM lecture04.P WHERE Price < 2;