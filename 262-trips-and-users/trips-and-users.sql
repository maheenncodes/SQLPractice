# Write your MySQL query statement below


With unbanned_clients As
(
    Select users_id , role from Users where banned = 'No' and role = 'client'
),unbanned_drivers As
(
    Select users_id , role from Users where banned = 'No' and role = 'driver'
)

Select request_at as Day,
ROUND(SUM(status IN ('cancelled_by_driver', 'cancelled_by_client')) * 1.0 / COUNT(*), 2) as `Cancellation Rate`
From 
Trips 
where
    request_at BETWEEN '2013-10-01' AND '2013-10-03'
    AND client_id IN (SELECT users_id FROM unbanned_clients)
    AND driver_id IN (SELECT users_id FROM unbanned_drivers)
Group by request_at;
