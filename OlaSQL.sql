use Ola;
select*from bookings;

#1 Retrieve all successful bookings:
create view Succes_Bookings as
select*from bookings 
where Booking_Status = 'success';

select*from Succes_Bookings;

#2 Find the average ride distance for each vehicle type:
create view ride_distance as
SELECT Vehicle_Type, 
AVG(Ride_Distance) 
as avg_distance 
FROM bookings 
GROUP BY
Vehicle_Type;

select*from ride_distance;

#3 Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as
SELECT COUNT(*) FROM bookings WHERE Booking_Status = 'cancelled by Customer';

select*from cancelled_rides_by_customers;

#4 List the top 5 customers who booked the highest number of rides:
create view booked_highest_number as
SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM bookings GROUP BY
Customer_ID ORDER BY total_rides DESC LIMIT 5;

select*from booked_highest_number;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view car_related_issues as
SELECT COUNT(*) FROM bookings WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

select*from car_related_issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Prime_Sedan_rating as
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM
bookings WHERE Vehicle_Type = 'Prime Sedan';

select*from Prime_Sedan_rating;

#7. Retrieve all rides where payment was made using UPI:
create view payment_using_UPI as
select*from bookings where Payment_method = 'UPI';

select*from payment_using_UPI;

#8. Find the average customer rating per vehicle type: 
create view customer_rating_vehicle as
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating FROM bookings
GROUP BY Vehicle_Type;

select*from customer_rating_vehicle;

#9. Calculate the total booking value of rides completed successfully:
create view booking_completed_successfully as
select sum(Booking_value) as  total_successful_value from bookings where Booking_Status = 'Success';

select*from booking_completed_successfully;

#10. List all incomplete rides along with the reason:
create view incomplete_rides as
select Booking_ID, Incomplete_Rides_Reason from bookings where Incomplete_Rides = 'Yes';

select*from incomplete_rides;

