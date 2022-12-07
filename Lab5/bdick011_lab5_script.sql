SELECT pid 
FROM catalog 
WHERE cost < 10
ORDER BY pid;

SELECT P.pname
FROM Parts P, Catalog C
WHERE P.pid = C.pid AND cost < 10;

SELECT S.address
FROM Suppliers S, Parts P, Catalog C
WHERE S.sid = C.sid AND P.pid = C.Pid AND P.pname = 'Fire Hydrant Cap';

SELECT S.sname
FROM Suppliers S, Parts P, Catalog C
WHERE S.sid = C.sid AND P.pid = C.Pid AND P.color = 'Green';

SELECT S.sname, P.pname
FROM Suppliers S, Parts P, Catalog C
WHERE S.sid = C.sid AND P.pid = C.pid; 
