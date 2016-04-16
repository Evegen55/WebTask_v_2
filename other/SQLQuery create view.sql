USE paymentsDB_v_1_3_SQLExpress;
GO

create view v_user_role as
select u.email, g.name, u.password 
from client u, groups g, clients_groups ug 
where u.email = ug.email and g.groups_ID = ug.groups_ID;