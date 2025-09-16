CREATE DATABASE OLA_PROJECT;
USE OLA_PROJECT;

## WE MAKE A VIEW BCOZ WHEN WE WANT TO SEE THE DATA ALL I DO IS JUST (SELECT * FROM successful_booking)

#  1. Retrieve all successful bookings:

CREATE VIEW successful_booking AS
SELECT * FROM bookings
WHERE booking_status = 'success';

SELECT * FROM successful_booking;


# 2. Find the average ride distance for each vehicle type:

CREATE VIEW ride_distance_for_each_vehicle AS
SELECT vehicle_type,AVG(Ride_Distance) AS Avg_Distance
FROM bookings
GROUP BY vehicle_type;

SELECT * FROM ride_distance_for_each_vehicle;


# 3. Get the total number of cancelled rides by customers:
CREATE VIEW canceled_by_customer AS 
SELECT COUNT(*) FROM bookings
WHERE booking_status = 'Canceled by Customer';

SELECT * FROM canceled_by_customer;


#  4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW top_5_customer AS 
SELECT customer_id, COUNT(booking_id) booking_id
FROM bookings
GROUP BY customer_id
ORDER BY booking_id DESC
LIMIT 5;

SELECT * FROM top_5_customer;

#  5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW ride_cancled_by_driver_p_c_issues AS 
SELECT COUNT(*) Total_Cancel_Rides FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM ride_cancled_by_driver_p_c_issues;

#  6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW max_min_driver_rating_sedan AS 
SELECT vehicle_type,
MAX(Driver_Ratings) Max_Rating,
MIN(Driver_Ratings) Min_Rating
FROM bookings
WHERE vehicle_type = 'Prime Sedan';

SELECT * FROM max_min_driver_rating_sedan;

#  7. Retrieve all rides where payment was made using UPI:
CREATE VIEW upi_payment AS 
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

SELECT * FROM upi_payment;


#  8. Find the average customer rating per vehicle type:
CREATE VIEW avg_customer_rating_per_vehicle AS 
SELECT vehicle_type, ROUND(AVG(Customer_Rating),2) Avg_Customer_Rating
FROM bookings
GROUP BY vehicle_type;

SELECT * FROM avg_customer_rating_per_vehicle;

# 9. Calculate the total booking value of rides completed successfully:
CREATE VIEW successful_rides AS 
SELECT SUM(Booking_Value) Successful_total_booking_value
FROM bookings
WHERE Booking_Status = 'success';

SELECT * FROM successful_rides;

# 10. List all incomplete rides along with the reason:
CREATE VIEW incomplete_rides_with_reason AS 
SELECT booking_id,Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM incomplete_rides_with_reason;

##				Questions With Answers

 # 1. Retrieve all successful bookings:
 SELECT * FROM successful_booking;

 # 2. Find the average ride distance for each vehicle type:
 SELECT * FROM ride_distance_for_each_vehicle;

 # 3. Get the total number of cancelled rides by customers:
 SELECT * FROM canceled_by_customer;

 # 4. List the top 5 customers who booked the highest number of rides:
 SELECT * FROM top_5_customer;

 # 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
 SELECT * FROM ride_cancled_by_driver_p_c_issues;

 # 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 SELECT * FROM max_min_driver_rating_sedan;

 # 7. Retrieve all rides where payment was made using UPI:
 SELECT * FROM upi_payment;

 # 8. Find the average customer rating per vehicle type:
 SELECT * FROM avg_customer_rating_per_vehicle;

 # 9. Calculate the total booking value of rides completed successfully:
 SELECT * FROM successful_rides;

 # 10. List all incomplete rides along with the reason:
 SELECT * FROM incomplete_rides_with_reason;


